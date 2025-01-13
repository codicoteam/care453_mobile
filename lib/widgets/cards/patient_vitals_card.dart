import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/patient_vitals_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../../features/patientvitals/screens/edit_patient_vitals.dart';
import '../../features/patientvitals/screens/view_patient_vitals_details_dialog.dart';

class PatientVitalsCard extends StatelessWidget {
  final PatientVitalsModel patientVitals;
  final VisitModel visitsModel;
  final VoidCallback? onTap;

  PatientVitalsCard({
    required this.patientVitals,
    this.onTap,
    required this.visitsModel,
  });

  @override
  Widget build(BuildContext context) {
    // Format date and time
    String formatDateTime() {
      try {
        // Parse the String into a DateTime object
        final parsedDate = DateTime.parse(patientVitals.recordedAt);
        // Format the DateTime object into the desired format
        final dateFormat = DateFormat('EEE, MMM d, yyyy');
        return dateFormat.format(parsedDate);
      } catch (e) {
        // Handle potential parsing errors
        return 'Invalid date';
      }
    }

    String formatTimeOnly() {
      try {
        // Parse the String into a DateTime object
        final parsedDate = DateTime.parse(patientVitals.recordedAt);
        // Format the DateTime object to display time only in the desired format
        final timeFormat = DateFormat('hh:mm a'); // Example: 10:15 AM
        return timeFormat.format(parsedDate);
      } catch (e) {
        // Handle potential parsing errors
        return 'Invalid time';
      }
    }

    List<String> getMenuOptions() {
      switch (visitsModel.status) {
        case 'Ongoing':
          return ['View', 'Edit'];
        default:
          return [];
      }
    }

    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.all(2),
        height: 100, // Adjust the desired height
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 4, // Blur radius (simulating elevation 7)
              offset: Offset(0, 3), // Shadow position (x, y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      'assets/images/heart-rate-monitor.png',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.calendar,
                                      color: Pallete.originBlue,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      patientVitals.recordedAt != null
                                          ? formatDateTime()
                                          : 'N/A',
                                      style: TextStyle(
                                        color: Pallete.blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.clock,
                                  color: Pallete.originBlue,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(formatTimeOnly(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Pallete.blackColor)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Temperature: ${patientVitals.temperature}',
                              style: TextStyle(
                                color: Pallete.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              if(visitsModel.status != "Completed")
                 PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      size: 24,
                      color: Pallete.originBlue,
                    ),
                    onSelected: (value) {
                      print('Selected: $value');
                      if(value=="Edit"){
                        Get.dialog(EditPatientVitals(patientVitalsModel: patientVitals,));
                      }

                        if(value=="View"){
                        Get.dialog(ViewPatientVitalsDetailsDialog(patientVitalsModel: patientVitals,));
                      }
                    },
                    itemBuilder: (context) {
                      return getMenuOptions()
                          .map((option) => PopupMenuItem<String>(
                                value: option,
                                child: Text(option),
                              ))
                          .toList();
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
