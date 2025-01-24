import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/custom_date_picker.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/custom_description.dart';
import '../Helpers/register_helper.dart';

class MedicalDetailScreen extends StatefulWidget {
  final String address;
  final String phone_number;
  final String email;
  final String profile_picture;
  final String first_name;
  final String last_name;
  final String date_of_birth;
  final String gender;

  const MedicalDetailScreen(
      {super.key,
      required this.address,
      required this.phone_number,
      required this.email,
      required this.profile_picture,
      required this.first_name,
      required this.last_name,
      required this.date_of_birth,
      required this.gender});

  @override
  State<MedicalDetailScreen> createState() => _MedicalDetailScreenState();
}

class _MedicalDetailScreenState extends State<MedicalDetailScreen> {
  TextEditingController allergis_controller = TextEditingController();
  TextEditingController medical_history_Controller = TextEditingController();
  TextEditingController medicalAidInf = TextEditingController();
  String genderValue = "Male"; // Default selected gender
  final RegisterHelper registerHelper = RegisterHelper();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            FadeInSlide(
              duration: 1.0,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 70,
                child: Image.asset("assets/images/mylogo.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  FadeInSlide(
                    duration: 1.2,
                    child: Text(
                      'Medical Register',
                      style: GoogleFonts.poppins(
                          color: Pallete.lightPrimaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 1.6,
                    child: CustomDescriptionField(
                      labelText: 'Medical History',
                      controller: medical_history_Controller,
                      fillColor: Colors.grey[200],
                      filled: true,
                      focusedBorderColor: Colors.blue,
                      defaultBorderColor: Colors.grey,
                      onChanged: (value) {
                        print('Description: $value');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 1.6,
                    child: FadeInSlide(
                      duration: 1.6,
                      child: CustomDescriptionField(
                        labelText: 'Medical Aid Inforomation',
                        controller: medicalAidInf,
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusedBorderColor: Colors.blue,
                        defaultBorderColor: Colors.grey,
                        onChanged: (value) {
                          print('Description: $value');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 1.4,
                    child: FadeInSlide(
                      duration: 1.6,
                      child: CustomDescriptionField(
                        labelText: 'Allegies e.g Peanuts, Dust',
                        controller: allergis_controller,
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusedBorderColor: Colors.blue,
                        defaultBorderColor: Colors.grey,
                        onChanged: (value) {
                          print('Description: $value');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 2.0,
                    child: CustomButton(
                        btnColor: Pallete.originBlue,
                        width: screenWidth,
                        borderRadius: 10,
                        child: Text(
                          'Continue',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          registerHelper.validateRegisterThree(
                            allergies: allergis_controller.text,
                            medicalAidInfo: medicalAidInf.text,
                            medicalHistory: medical_history_Controller.text, address: widget.address, phone_number: widget.phone_number, email: widget.email, profile_picture: widget.profile_picture, first_name: widget.first_name, last_name: widget.last_name, date_of_birth: widget.date_of_birth, gender: widget.gender,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
