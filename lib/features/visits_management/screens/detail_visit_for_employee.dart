import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/observation_management/screens/add_observation_dialog.dart';
import 'package:care453/features/patientvitals/screens/add_patient_vitals_dialog.dart';
import 'package:care453/features/patientvitals/screens/patient_vitals_on_visit.dart';
import 'package:care453/features/visits_management/screens/tabs/task/task_assigned_screens.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/success/success_submission.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'close_visit_dialogs.dart/first_close_tab.dart';
import 'start_visit/start_visit_dialog_employee.dart';
import 'tabs/medication/medication_assigned_screen.dart';
import 'tabs/observation/observation_screens.dart';

class DetailVisitForEmployee extends StatefulWidget {
  final VisitModel visitModel;
  const DetailVisitForEmployee({super.key, required this.visitModel});

  @override
  State<DetailVisitForEmployee> createState() => _DetailVisitForEmployeeState();
}

class _DetailVisitForEmployeeState extends State<DetailVisitForEmployee>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Pallete.whiteColor,
          ),
        ),
        title: Text(
          'Visit Details',
          style: GoogleFonts.poppins(
            color: Pallete.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          if (widget.visitModel.status == "Ongoing")
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle menu item selection
                if (value == "Add Observation") {
                  Get.dialog(
                    AddObservationDialog(
                      visitModel: widget.visitModel,
                    ),
                    barrierDismissible: false,
                  );
                  print("Add Observation selected");
                } else if (value == "Add Patient Vitals") {
                  Get.dialog(
                    AddPatientVitalsDialog(
                      visitModel: widget.visitModel,
                    ),
                    barrierDismissible: false,
                  );
                } else if (value == "Close Visit") {
                  Get.dialog(
                    FirstCloseTabDialog(
                      visitModel: widget.visitModel,
                    ),
                    barrierDismissible: false,
                  );
                  print("Add Patient Vitals selected");
                  // Perform action for "Add Patient Vitals"
                  print("Close Visit");
                }
              },
              icon: Icon(
                Icons.more_vert,
                color: Pallete.whiteColor, // Replace with your color variable
              ),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: "Add Observation",
                  child: Text("Add Observation"),
                ),
                PopupMenuItem(
                  value: "Add Patient Vitals",
                  child: Text("Add Patient Vitals"),
                ),
                PopupMenuItem(
                  value: "Close Visit",
                  child: Text("Close Visit"),
                ),
              ],
            ),
          if (widget.visitModel.status == "Confirmed")
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle menu item selection
                if (value == "Start Visit") {
                  Get.dialog(
                    StartVisitDialogEmployee(
                      visitModel: widget.visitModel,
                    ),
                    barrierDismissible: false,
                  );
                  print("Add Observation selected");
                } else if (value == "Add Patient Vitals") {
                  // Perform action for "Add Patient Vitals"
                  print("Add Patient Vitals selected");
                } else if (value == "Close Visit") {
                  Get.dialog(
                    FirstCloseTabDialog(
                      visitModel: widget.visitModel,
                    ),
                    barrierDismissible: false,
                  );
                  print("Add Patient Vitals selected");
                  // Perform action for "Add Patient Vitals"
                  print("Close Visit");
                }
              },
              icon: Icon(
                Icons.more_vert,
                color: Pallete.whiteColor, // Replace with your color variable
              ),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: "Start Visit",
                  child: Text("Start Visit"),
                ),
              ],
            ),
        ],
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(LocalImageConstants.care_giver_two),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Pallete.originBlue
                  .withOpacity(0.9), // Blue overlay with 50% opacity
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(320),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 70,
                    color: Colors.transparent,
                  ),
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(50))),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade300,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: Pallete.originBlue,
                            ),
                            Text("Call",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Pallete.primaryColor,
                                        fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Pallete.whiteColor, width: 5)),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  widget.visitModel.clientId!.profilePicture!,
                              fit: BoxFit
                                  .cover, // Ensures the image covers the entire space
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  color: Colors.grey[300],
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 32,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade300,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.email,
                              color: Pallete.originBlue,
                            ),
                            Text("Email",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Pallete.primaryColor,
                                        fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "${widget.visitModel.clientId!.firstName} ${widget.visitModel.clientId!.lastName}",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${widget.visitModel.clientId!.address}",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Pallete.success,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      widget.visitModel.status!,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(16),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: TabBar(
                          labelColor: Pallete.originBlue,
                          controller: _tabController,
                          tabAlignment: TabAlignment.start,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color: Pallete
                                  .originBlue, // Set the color for the bottom line
                              width: 3.0, // Set the thickness of the line
                            ),
                            insets: EdgeInsets.symmetric(
                                horizontal:
                                    0.0), // Adjust spacing of the indicator
                          ),
                          isScrollable: true,
                          tabs: [
                            Tab(text: 'Task Assigned'),
                            Tab(text: 'Medication'),
                            Tab(text: 'Observations'),
                            Tab(text: 'Vitals Recorded'),
                          ])),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        TaskAssignedScreens(
          visitId: "${widget.visitModel.id}",
        ),
        MedicationAssignedScreen(
          visitId: "${widget.visitModel.id}",
        ),
        ObservationScreens(
          visitId: "${widget.visitModel.id}",
        ),
        PatientVitalsOnVisit(visitModel: widget.visitModel,),
      ]),
    );
  }
}

class TripHistoryTab extends StatelessWidget {
  const TripHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Trip History'),
    );
  }
}

class VitalRecordedTab extends StatelessWidget {
  const VitalRecordedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Vitals Requests'),
    );
  }
}

class RatingsTab extends StatelessWidget {
  const RatingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ratings'),
    );
  }
}

class VehicleClassesTab extends StatelessWidget {
  const VehicleClassesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recorded Vital Signs'),
    );
  }
}
