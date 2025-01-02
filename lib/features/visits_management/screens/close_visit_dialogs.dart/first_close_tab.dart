import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/Home/admin_main_home.dart';
import 'package:care453/features/visits_management/helpers/visit_helper.dart';
import 'package:care453/models/get_medicine_model.dart';
import 'package:care453/models/get_task_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:care453/widgets/error_widgets/error_submission.dart';
import 'package:care453/widgets/error_widgets/error_widget.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:care453/widgets/loaders/loader_widget.dart';
import 'package:care453/widgets/success/success_submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/visit_controller.dart';

class FirstCloseTabDialog extends StatefulWidget {
  final VisitModel visitModel;
  const FirstCloseTabDialog({super.key, required this.visitModel});
  @override
  State<FirstCloseTabDialog> createState() => _FirstCloseTabDialogState();
}

class _FirstCloseTabDialogState extends State<FirstCloseTabDialog> {
  final visitController = Get.find<VisitController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      visitController.getAllTaskPerVisitForClient(widget.visitModel.id!);
      visitController.getAllMedicationPerVisitForClient(widget.visitModel.id!);
    });
  }

  List<GetTaskModel> selectedVisitsIds = [];

  bool isVisitSelected(GetTaskModel visit) {
    return selectedVisitsIds
        .any((selectedVisit) => selectedVisit.id == visit.id);
  }

  void toggleVisitSelection(GetTaskModel visit) {
    setState(() {
      if (isVisitSelected(visit)) {
        selectedVisitsIds
            .removeWhere((selectedVisit) => selectedVisit.id == visit.id);
      } else {
        selectedVisitsIds.add(visit);
      }
    });
    DevLogs.logSuccess(
        "Selected Visits: ${selectedVisitsIds.map((v) => v.id).toList()}");
    DevLogs.logSuccess("Selected Visits: ${selectedVisitsIds}");
  }

  List<GetMedicationModel> selectedMedicationIds = [];

  bool isVisitMedication(GetMedicationModel visit) {
    return selectedMedicationIds
        .any((selectedVisit) => selectedVisit.id == visit.id);
  }

  void toggleMedicationSelection(GetMedicationModel visit) {
    setState(() {
      if (isVisitMedication(visit)) {
        selectedMedicationIds
            .removeWhere((selectedVisit) => selectedVisit.id == visit.id);
      } else {
        selectedMedicationIds.add(visit);
      }
    });
    DevLogs.logSuccess(
        "Selected Visits: ${selectedMedicationIds.map((v) => v.id).toList()}");
    DevLogs.logSuccess("Selected Visits: ${selectedMedicationIds}");
  }

  final VisitHelper visitHelper = VisitHelper();
  bool taskdone = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        child: SingleChildScrollView(
          child: taskdone
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dialog Title
                    Text(
                      'Close Visit',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Pallete.originBlue,
                              ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 15),
                    Text(
                      'Select Task that you have done ',
                      style: GoogleFonts.poppins(
                        color: Pallete.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: Colors.transparent,
                      child: Obx(() {
                        if (visitController.isLoading.value) {
                          return const VehicleLoader();
                        }
                        if (visitController.errorMessage.isNotEmpty) {
                          return ApiFailureWidget(onRetry: () {
                            visitController.errorMessage.value = "";
                            visitController.refreshTasks(widget.visitModel.id!);
                          });
                        }
                        return visitController.tasks.isEmpty
                            ? const EmptyStateWidget(
                                icon: LocalImageConstants.notFoundIcon,
                                title: 'No Requests Found',
                                description:
                                    'There are no tasks matching your visit.',
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.6, // Set a fixed height
                                child: RefreshIndicator(
                                  color: Pallete.originBlue,
                                  onRefresh: () => visitController
                                      .refreshTasks(widget.visitModel.id!),
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(0),
                                    itemCount: visitController.tasks.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 12),
                                    itemBuilder: (context, index) {
                                      final visit =
                                          visitController.tasks[index];
                                      final isSelected = isVisitSelected(visit);
                                      return GestureDetector(
                                        onTap: () =>
                                            toggleVisitSelection(visit),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              color: isSelected
                                                  ? Pallete.originBlue
                                                  : Colors.grey.shade300,
                                              width: 2,
                                            ),
                                            boxShadow: isSelected
                                                ? [
                                                    BoxShadow(
                                                      color: Pallete.originBlue
                                                          .withOpacity(0.1),
                                                      blurRadius: 5,
                                                      spreadRadius: 2,
                                                    )
                                                  ]
                                                : [],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: isSelected
                                                        ? Pallete.originBlue
                                                            .withOpacity(0.1)
                                                        : Colors.grey.shade300,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        LocalImageConstants
                                                            .tasks,
                                                        width: 10,
                                                        height: 10,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${visit.name}",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isSelected
                                                              ? Pallete
                                                                  .originBlue
                                                              : Colors.grey
                                                                  .shade800,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        "${visit.description}",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: isSelected
                                                              ? Pallete
                                                                  .originBlue
                                                                  .withOpacity(
                                                                      0.8)
                                                              : Colors.grey
                                                                  .shade600,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (isSelected)
                                                  Icon(Icons.check_circle,
                                                      color:
                                                          Pallete.originBlue),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                      }),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GeneralButton(
// Inside your onTap method
                          onTap: () {
                            bool isFormValid =
                                visitHelper.validateAndSubmitForm(
                                    visitId: widget.visitModel.id!,
                                    tasks: selectedVisitsIds);
                            if (isFormValid) {
                              setState(() {
                                taskdone = false;
                              });
                            } else {
                              // Handle validation failure
                            }
                            // Format the current date to "yyyy-MM-dd"
                          },
                          btnColor: Pallete.originBlue,
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ).animate().fadeIn(duration: 650.ms),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              width: 47,
                              height: 47,
                              decoration: BoxDecoration(
                                color: Colors.grey[
                                    400], // Set the background color to grey
                                shape: BoxShape.circle, // Make it circular
                              ),
                              alignment: Alignment
                                  .center, // Center the text inside the circle
                              child: Image.asset(
                                LocalImageConstants.cancel,
                                height: 25,
                                width: 25,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dialog Title
                    Text(
                      'Close Visit',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Pallete.originBlue,
                              ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 15),
                    Text(
                      'Select medication given to patient',
                      style: GoogleFonts.poppins(
                        color: Pallete.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: Colors.transparent,
                      child: Obx(() {
                        if (visitController.isLoading.value) {
                          return const VehicleLoader();
                        }
                        if (visitController.errorMessage.isNotEmpty) {
                          return ApiFailureWidget(onRetry: () {
                            visitController.errorMessage.value = "";
                            visitController.refreshTasks(widget.visitModel.id!);
                          });
                        }
                        return visitController.medications.isEmpty
                            ? const EmptyStateWidget(
                                icon: LocalImageConstants.notFoundIcon,
                                title: 'No Requests Found',
                                description:
                                    'There are no medication matching your visit.',
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.6, // Set a fixed height
                                child: RefreshIndicator(
                                  color: Pallete.originBlue,
                                  onRefresh: () => visitController
                                      .refreshMedicine(widget.visitModel.id!),
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(0),
                                    itemCount:
                                        visitController.medications.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 12),
                                    itemBuilder: (context, index) {
                                      final visit =
                                          visitController.medications[index];
                                      final isSelected =
                                          isVisitMedication(visit);
                                      return GestureDetector(
                                        onTap: () =>
                                            toggleMedicationSelection(visit),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              color: isSelected
                                                  ? Pallete.originBlue
                                                  : Colors.grey.shade300,
                                              width: 2,
                                            ),
                                            boxShadow: isSelected
                                                ? [
                                                    BoxShadow(
                                                      color: Pallete.originBlue
                                                          .withOpacity(0.1),
                                                      blurRadius: 5,
                                                      spreadRadius: 2,
                                                    )
                                                  ]
                                                : [],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: isSelected
                                                        ? Pallete.originBlue
                                                            .withOpacity(0.1)
                                                        : Colors.grey.shade300,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        LocalImageConstants
                                                            .bluePill,
                                                        width: 15,
                                                        height: 15,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${visit.name}",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isSelected
                                                              ? Pallete
                                                                  .originBlue
                                                              : Colors.grey
                                                                  .shade800,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        "${visit.description}",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: isSelected
                                                              ? Pallete
                                                                  .originBlue
                                                                  .withOpacity(
                                                                      0.8)
                                                              : Colors.grey
                                                                  .shade600,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (isSelected)
                                                  Icon(Icons.check_circle,
                                                      color:
                                                          Pallete.originBlue),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GeneralButton(
// Inside your onTap method
                          onTap: () async {
                            // Call the method and await its result

                            Get.dialog(
                              const CustomLoader(message: 'Submitting'),
                              barrierDismissible: false,
                            );
                            bool isFormValid = await visitHelper
                                .updateTasksAndMedicationAndVisitId(
                              visitModel: widget.visitModel,
                              tasks: selectedVisitsIds,
                              medications: selectedMedicationIds,
                            );
                            Get.back();

                            if (isFormValid) {
                              // Handle success
                              Get.dialog(
                                SuccessSubmission(
                                  Title: 'Successfully Completed The Visit',
                                  Description:
                                      'Completing the visits, you are no longer allowed to make any changes to the visit, if so contact the admin and the client',
                                  ButtonText: 'Continue',
                                ),
                                barrierDismissible: false,
                              );
                              print("Form submission successful!");
                            } else {
                              // Handle validation failure
                              Get.dialog(
                                ErrorSubmission(),
                                barrierDismissible: false,
                              );
                              print("Form submission failed.");
                            }
                            // Perform any other operations after form submission
                          },

                          btnColor: Pallete.originBlue,
                          child: const Text(
                            'Close Visit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ).animate().fadeIn(duration: 650.ms),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              width: 47,
                              height: 47,
                              decoration: BoxDecoration(
                                color: Colors.grey[
                                    400], // Set the background color to grey
                                shape: BoxShape.circle, // Make it circular
                              ),
                              alignment: Alignment
                                  .center, // Center the text inside the circle
                              child: Image.asset(
                                LocalImageConstants.cancel,
                                height: 25,
                                width: 25,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
