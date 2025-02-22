import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:care453/widgets/error_widgets/error_widget.dart';
import 'package:care453/widgets/loaders/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/asset_utils/image_util.dart';
import '../../../widgets/cards/patient_vitals_card.dart';
import '../controllers/patient_vitals_controllers.dart';
import 'view_patient_vitals_details_dialog.dart';

class PatientVitalsOnVisit extends StatefulWidget {
  final VisitModel visitModel;
  const PatientVitalsOnVisit({super.key, required this.visitModel, });
  @override
  State<PatientVitalsOnVisit> createState() => _PatientVitalsOnVisitState();
}
class _PatientVitalsOnVisitState extends State<PatientVitalsOnVisit> {
  final patientVitalsController = Get.find<PatientVitalsControllers>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      patientVitalsController.getAllPatientVitalsForVisitId(widget.visitModel.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Obx(() {
        if (patientVitalsController.isLoading.value) {
          return const VehicleLoader();
        }

        if (patientVitalsController.errorMessage.isNotEmpty) {
          return ApiFailureWidget(onRetry: () {
            patientVitalsController.errorMessage.value = "";
            patientVitalsController.refreshPatientVitalsForVisitId(widget.visitModel.id!);
          });
        }

        return patientVitalsController.patientVitals.isEmpty
            ? const EmptyStateWidget(
                icon: LocalImageConstants.notFoundIcon,
                title: 'No Patient Vitals Found',
                description: 'There are no patient vitals matching your visit.',
              )
            : RefreshIndicator(
                color: Pallete.originBlue,
                onRefresh: () => patientVitalsController.refreshPatientVitalsForVisitId(widget.visitModel.id!),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: patientVitalsController.patientVitals.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final patientVitals = patientVitalsController.patientVitals[index];
                    return PatientVitalsCard(
                      patientVitals: patientVitals,
                      onTap: () {
                        Get.dialog(ViewPatientVitalsDetailsDialog(patientVitalsModel: patientVitals,));
                        // Get.toNamed(RoutesHelper.clientShuttleDetailsScreen, arguments: shuttle);
                      }, visitsModel: widget.visitModel,
                    );
                  },
                ),
              );
      }),
    );
  }
}
