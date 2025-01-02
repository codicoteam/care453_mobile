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

class MedicationAssignedScreen extends StatefulWidget {
  final String visitId;
  const MedicationAssignedScreen({super.key, required this.visitId});
  @override
  State<MedicationAssignedScreen> createState() => _MedicationAssignedScreenState();
}
class _MedicationAssignedScreenState extends State<MedicationAssignedScreen> {
  final visitController = Get.find<VisitController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      visitController.getAllMedicationPerVisitForClient(widget.visitId);
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
            visitController.refreshMedicine(widget.visitId);
          });
        }

        return visitController.medications.isEmpty
            ? const EmptyStateWidget(
                icon: LocalImageConstants.notFoundIcon,
                title: 'No Requests Found',
                description: 'There are no tasks matching your visit.',
              )
            : RefreshIndicator(
                color: Pallete.originBlue,
                onRefresh: () => visitController.refreshMedicine(widget.visitId),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: visitController.medications.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final medication = visitController.medications[index];
                    return MedicationCardForClient(
                      getMedicationModel: medication,
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
