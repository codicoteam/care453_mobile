import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/custom_date_picker.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helpers/register_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController date_of_birth_controller = TextEditingController();
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
                      'Register',
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
                    child: CustomTextField(
                      controller: firstNameController,
                      labelText: 'First name',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 1.6,
                    child: CustomTextField(
                      controller: lastNameController,
                      labelText: 'Last name',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 1.4,
                    child: CustomDateOfBirth(
                      labelText: 'Date of Birth',
                      controller: date_of_birth_controller,
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      focusedBorderColor: Colors.blue,
                      onChanged: (value) {
                        print('Selected Date: $value');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                      duration: 1.6,
                      child: GenderPickerWithImage(
                        showOtherGender: false,
                        verticalAlignedText: true,
                        selectedGender:
                            genderValue == "Male" ? Gender.Male : Gender.Female,
                        selectedGenderTextStyle: TextStyle(
                          color: Colors
                              .blue, // Replace with Pallete.originBlue if available
                          fontWeight: FontWeight.bold,
                        ),
                        unSelectedGenderTextStyle: TextStyle(
                          color: Colors
                              .grey, // Use a distinguishable unselected color
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (gender) {
                          setState(() {
                            genderValue =
                                gender!.name; // Updates the selected gender
                            print(
                                'Gender selected: $genderValue'); // Debugging output
                          });
                        },
                        equallyAligned: true,
                        animationDuration: Duration(milliseconds: 300),
                        isCircular: true,
                        opacityOfGradient: 0.4,
                        padding: const EdgeInsets.all(3),
                        size: 50,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 24,
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
                          registerHelper.validateRegisterOne(
                              first_name: firstNameController.text,
                              last_name: lastNameController.text,
                              date_of_birth: date_of_birth_controller.text,
                              gender: genderValue!);
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
