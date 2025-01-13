import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/visits_management/screens/start_visit/start_visit_dialog_client.dart';
import 'package:care453/features/visits_management/screens/tabs/task/task_assigned_screens.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/dashboards_widget/dashboard_line_chart.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:care453/widgets/error_widgets/error_widget.dart';
import 'package:care453/widgets/loaders/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:care453/widgets/dashboards_widget/line_chart.dart';
import '../../patientvitals/screens/patient_vitals_on_visit.dart';
import '../controllers/patient_vitals_controllers.dart';

class DashboardPatientVitals extends StatefulWidget {
  const DashboardPatientVitals({
    super.key,
  });

  @override
  State<DashboardPatientVitals> createState() => _DashboardPatientVitalsState();
}

class _DashboardPatientVitalsState extends State<DashboardPatientVitals>
    with SingleTickerProviderStateMixin {
  final patientVitalsController = Get.find<PatientVitalsControllers>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      patientVitalsController
          .getAllPatientVitalsForClient("676297d66ec829a1a595dca6");
    });
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
          'Health Analytics',
          style: GoogleFonts.poppins(
            color: Pallete.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
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
      ),
      body: Obx(() {
        if (patientVitalsController.isLoading.value) {
          return const VehicleLoader();
        }

        if (patientVitalsController.errorMessage.isNotEmpty) {
          return ApiFailureWidget(onRetry: () {
            patientVitalsController.errorMessage.value = "";
            patientVitalsController
                .getAllPatientVitalsForClient("676297d66ec829a1a595dca6");
          });
        }

        return patientVitalsController.patientVitals.isEmpty
            ? const EmptyStateWidget(
                icon: LocalImageConstants.notFoundIcon,
                title: 'No Requests Found',
                description:
                    'There are no requests matching your search or category.',
              )
            : RefreshIndicator(
                color: Pallete.originBlue,
                onRefresh: () => patientVitalsController
                    .refreshPatientVitalsForClient("676297d66ec829a1a595dca6"),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 500, // Constrain height for the ListView
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                height:
                                    500, // Constrain height for LineChartSample1
                                child: LineChartSample1(patientVitalModels: patientVitalsController.patientVitals,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
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
