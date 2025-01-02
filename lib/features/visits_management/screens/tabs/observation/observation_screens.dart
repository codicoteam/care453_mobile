import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/visits_management/controller/visit_controller.dart';
import 'package:care453/widgets/cards/medication_card_for_client.dart';
import 'package:care453/widgets/cards/task_card_for_client.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:care453/widgets/error_widgets/error_widget.dart';
import 'package:care453/widgets/loaders/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/asset_utils/image_util.dart';
import '../../../../../widgets/cards/observation_card_for_client.dart';

class ObservationScreens extends StatefulWidget {
  final String visitId;
  const ObservationScreens({super.key, required this.visitId});
  @override
  State<ObservationScreens> createState() => _ObservationScreensState();
}
class _ObservationScreensState extends State<ObservationScreens> {
  final visitController = Get.find<VisitController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      visitController.getAllObservationPerVisitForClient(widget.visitId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Obx(() {
        if (visitController.isLoading.value) {
          return const VehicleLoader();
        }

        if (visitController.errorMessage.isNotEmpty) {
          return ApiFailureWidget(onRetry: () {
            visitController.errorMessage.value = "";
            visitController.refreshObservation(widget.visitId);
          });
        }

        return visitController.observations.isEmpty
            ? const EmptyStateWidget(
                icon: LocalImageConstants.notFoundIcon,
                title: 'No Requests Found',
                description: 'There are no tasks matching your visit.',
              )
            : RefreshIndicator(
                color: Pallete.originBlue,
                onRefresh: () => visitController.refreshObservation(widget.visitId),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: visitController.observations.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final observation = visitController.observations[index];
                    return ObservationCardForClient(
                      getObservationModel: observation,
                      onTap: () {
                        // Get.to(DetailVisit(visitModel: visit,));
                        // Get.toNamed(RoutesHelper.clientShuttleDetailsScreen, arguments: shuttle);
                      },
                    );
                  },
                ),
              );
      }),
    );
  }
}
