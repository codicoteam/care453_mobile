import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/cards/patient_vitals_card_dashboard.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:care453/widgets/error_widgets/error_widget.dart';
import 'package:care453/widgets/loaders/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:care453/widgets/dashboards_widget/line_chart.dart';
import '../controllers/patient_vitals_controllers.dart';
import 'view_patient_vitals_details_dialog.dart';

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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 500,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                height: 500,
                                child: LineChartSample1(
                                  patientVitalModels:
                                      patientVitalsController.patientVitals,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Vitals on Line Graph',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Pallete.originBlue,
                                  ),
                            ),
                          ],
                        ).animate().fadeIn(duration: 300.ms),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: patientVitalsController.patientVitals
                              .map((patientVitalsModel) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: PatientVitalsCardDashboard(
                                patientVitals: patientVitalsModel,
                                onTap: () {
                                  Get.dialog(ViewPatientVitalsDetailsDialog(
                                    patientVitalsModel: patientVitalsModel,
                                  ));
                                },
                              ),
                            );
                          }).toList(),
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
