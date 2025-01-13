import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/patientvitals/helpers/patient_vitals_helpers.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:care453/models/patient_vitals_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/custom_description.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:care453/widgets/error_widgets/error_submission.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:care453/widgets/success/success_submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/custom_text_field.dart';

class AddPatientVitalsDialog extends StatefulWidget {
  final VisitModel visitModel;
  const AddPatientVitalsDialog({super.key, required this.visitModel});
  @override
  State<AddPatientVitalsDialog> createState() => _AddPatientVitalsDialogState();
}

class _AddPatientVitalsDialogState extends State<AddPatientVitalsDialog> {
  List<String> uploadedImageUrl = [];
  TextEditingController answer_controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _descriptionontroller = TextEditingController();
  final PatientVitalsHelpers patientVitalHelper = PatientVitalsHelpers();
  final TextEditingController _tempcontroller = TextEditingController();
  final TextEditingController _bloodPressureSystoliccontroller =
      TextEditingController();
  final TextEditingController _bloodPressureDiastolicccontroller =
      TextEditingController();
  final TextEditingController _heartController = TextEditingController();
  final TextEditingController _respiratoryController = TextEditingController();
  final TextEditingController oxygencontroller = TextEditingController();

  final TextEditingController _timeController = TextEditingController();

  // final AssessmentHelpers assessmentHelpers = AssessmentHelpers();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dialog Title

              Text(
                'Add Patient Vitals',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                    ),
              ).animate().fadeIn(duration: 300.ms),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _tempcontroller,
                      labelText: 'Temperature',
                      prefixIcon: const Icon(FontAwesomeIcons.temperatureFull),
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      controller: _heartController,
                      labelText: 'Heart Rate',
                      prefixIcon: Icon(FontAwesomeIcons.heartPulse),
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                ],
              ).animate().slideX(begin: 0.1, duration: 300.ms),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _respiratoryController,
                      labelText: 'Respiratory rate',
                      prefixIcon: const Icon(FontAwesomeIcons.lungs),
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      controller: oxygencontroller,
                      labelText: 'Oxygen Saturation',
                      prefixIcon: Icon(FontAwesomeIcons.lungs),
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                ],
              ).animate().slideX(begin: 0.1, duration: 300.ms),
              SizedBox(
                height: 10,
              ),

              Text(
                'Blood Pressure: ',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _bloodPressureSystoliccontroller,
                      labelText: 'Systolic',
                      prefixIcon: const Icon(FontAwesomeIcons.heartPulse),
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      controller: _bloodPressureDiastolicccontroller,
                      labelText: 'Diastolic',
                      prefixIcon: Icon(FontAwesomeIcons.heartPulse),
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                ],
              ).animate().slideX(begin: 0.1, duration: 300.ms),
              SizedBox(
                height: 10,
              ),

              CustomDescriptionField(
                labelText: 'Enter Description',
                controller: _descriptionontroller,
                fillColor: Colors.white,
                filled: true,
                focusedBorderColor: Colors.blue,
                defaultBorderColor: Colors.grey,
                onChanged: (value) {
                  print('Description: $value');
                },
              ),


              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralButton(
                    onTap: () {
                      final double? temperature =
                          double.tryParse(_tempcontroller.text);
                      final double? systolic = double.tryParse(
                          _bloodPressureSystoliccontroller.text);
                      final double? diastolic = double.tryParse(
                          _bloodPressureDiastolicccontroller.text);
                      final double? heartRate =
                          double.tryParse(_heartController.text);
                      final double? respiratoryRate =
                          double.tryParse(_respiratoryController.text);
                      final double? oxygenSaturation =
                          double.tryParse(oxygencontroller.text);

                      patientVitalHelper.validateAndSubmitForm(
                        visitId: widget.visitModel.id!,
                        patientId: widget.visitModel.clientId!.id!,
                        temperature: temperature!,
                        systolic: systolic!,
                        diastolic: diastolic!,
                        heartRate: heartRate!,
                        respiratoryRate: respiratoryRate!,
                        oxygenSaturation: oxygenSaturation!,
                        notes: _descriptionontroller.text,
                      );
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
                          color: Colors
                              .grey[400], // Set the background color to grey
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
