import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/appointments/helpers/appointment_helper.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/views/screens/care_proffesional_module/location%20picker/location_picker.dart';
import 'package:care453/widgets/customDropdown.dart';
import 'package:care453/widgets/custom_description.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider_class.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_field/custom_text_field.dart';
import '../controllers/appointment_controller.dart';

class AddAppointmentDialog extends StatefulWidget {
  const AddAppointmentDialog({
    super.key,
  });

  @override
  State<AddAppointmentDialog> createState() => _AddAppointmentDialogState();
}

class _AddAppointmentDialogState extends State<AddAppointmentDialog> {
  List<String> uploadedImageUrl = [];
  final TextEditingController _descriptionontroller = TextEditingController();
  final TextEditingController _streetcontroller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final appointmentController = Get.find<AppointmentController>();
  final AppointmentHelper appointmentHelper = AppointmentHelper();
  String? countryValue;
  String? stateValue;
  String? cityValue;
  LatLng? deliveryPoint;
  String? serviceType;
  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Pallete.originBlue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Pallete.originBlue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      setState(() {
        _timeController.text = pickedTime.format(context);
      });
    }
  }

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
                'Create an appointment',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                    ),
              ).animate().fadeIn(duration: 300.ms),
              const SizedBox(height: 20),

              CustomDropdown(
                items: [
                  'Nursing',
                  'Physiotherapy',
                  'General Care',
                  'Specialized Care'
                ],
                // selectedItem: 'Option 1',
                onChanged: (value) {
                  setState(() {
                    serviceType = value;
                  });
                },
                labelText: 'Choose an Service Type',
                labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                dropdownTextStyle: TextStyle(fontSize: 16, color: Colors.black),
                fillColor: Colors.grey[200],
                filled: true,
                defaultBorderColor: Colors.grey,
                focusedBorderColor: Colors.blue,
                prefixIcon: Icon(Icons.medical_services),
              ),
              const SizedBox(height: 15),
              // Bay I
              CustomDescriptionField(
                labelText: 'Enter Description',
                controller: _descriptionontroller,
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorderColor: const Color.fromARGB(255, 174, 195, 212),
                defaultBorderColor: Colors.grey,
                onChanged: (value) {
                  print('Description: $value');
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectDate,
                      child: CustomTextField(
                        controller: _dateController,
                        labelText: 'Date',
                        readOnly: true,
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: _selectDate,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectTime,
                      child: CustomTextField(
                        controller: _timeController,
                        labelText: 'Time',
                        readOnly: true,
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: _selectTime,
                        ),
                      ),
                    ),
                  ),
                ],
              ).animate().slideX(begin: 0.1, duration: 300.ms),
              const SizedBox(height: 16),

              CSCPicker(
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value.toString();
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value.toString();
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value.toString();
                  });
                },
                countryDropdownLabel: countryValue != null
                    ? "$countryValue"
                    : 'Select Country', // Update label dynamically
                stateDropdownLabel: stateValue != null
                    ? "$stateValue"
                    : 'Select State', // Update label dynamically
                cityDropdownLabel: cityValue != null
                    ? "$stateValue"
                    : 'Select City', // Update label dynamically
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                ),

                selectedItemStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ).animate().slideX(begin: 0.1, duration: 300.ms),

              const SizedBox(height: 15),
              // Bay I
              CustomDescriptionField(
                labelText: 'Street Address',
                controller: _streetcontroller,
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorderColor: const Color.fromARGB(255, 174, 195, 212),
                defaultBorderColor: Colors.grey,
                onChanged: (value) {
                  print('Description: $value');
                },
              ),

              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomButton(
                      btnColor: deliveryPoint == null
                          ? Colors.grey
                          : Pallete.originBlue,
                      width: MediaQuery.sizeOf(context).width,
                      borderRadius: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            deliveryPoint == null
                                ? '  Select Location from map'
                                : "  Edit",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          deliveryPoint = LatLng(-17.830871, 31.045817);
                        });
                        GeneralHelpers.temporaryNavigator(context,
                            LocationPickerScreen(
                          onLocationPicked: (latitude, longitude) {
                            setState(() {
                              deliveryPoint = LatLng(-17.830871, 31.045817);
                            });
                          },
                        ));
                      }),
                ).animate().slideX(begin: 0.1, duration: 300.ms),
              ),
              // Submit Button

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralButton(
                    onTap: () {
                      if (deliveryPoint == null) {
                        Get.snackbar(
                          'Validation failed',
                          'Please pick location',
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 5),
                          backgroundColor: Pallete.originBlue,
                        );
                      } else {
                        final user =
                            Provider.of<UserProvider>(context, listen: false)
                                .user; // Use listen: false
                        appointmentHelper.validateAndSubmitForm(
                            clientId: "${user?.id}",
                            visitDate: _dateController.text,
                            visitTime: _timeController.text,
                            serviceType: serviceType!,
                            status: "Pending",
                            paymentStatus: "Pending",
                            street: _streetcontroller.text,
                            city: "$cityValue $countryValue",
                            state: stateValue!,
                            latitude: deliveryPoint!.latitude,
                            longtitude: deliveryPoint!.longitude,
                            moreInfo: _descriptionontroller.text);
                        Get.back();
                      }
                    },
                    btnColor: Pallete.originBlue,
                    child: const Text(
                      'Book  Appointment',
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
                        )).animate().slideX(begin: 0.1, duration: 300.ms),
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
