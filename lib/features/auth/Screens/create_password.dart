import 'package:care453/features/auth/Controller/auth_controller.dart';
import 'package:care453/features/auth/Services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/helpers/genenal_helpers.dart';
import '../../../core/utils/asset_utils/image_util.dart';
import '../../../core/utils/colors/pallete.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../profile_management/helpers/profile_helper.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String email;
  final String first_name;
  final String last_name;
  final String date_of_birth;
  final String gender;
  final String address;
  final String phone_number;
  final String profile_picture;
  final String allergies;
  final String medicalHistory;
  final String medicalAidInfo;

  const CreatePasswordScreen({
    super.key,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.date_of_birth,
    required this.gender,
    required this.address,
    required this.phone_number,
    required this.profile_picture,
    required this.allergies,
    required this.medicalHistory,
    required this.medicalAidInfo,
  });

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthController authController = Get.put(AuthController());
  final ProfileHelper profileHelper = ProfileHelper();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 120,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/mylogo.png"),
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
                  Text(
                    'Create a Password',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Pallete.lightPrimaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Password should contain at least one\nuppercase, lowercase, number\n and special characters',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Pallete.lightPrimaryTextColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: passwordController,
                    obscureText: true,
                    labelText: 'Create a password',
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    labelText: 'Confirm password',
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      btnColor: Pallete.originBlue,
                      width: screenWidth,
                      borderRadius: 10,
                      child: Text(
                        'SignUp',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      onTap: () {
                        profileHelper.validateAndSubmitForm(
                          firstName: widget.first_name,
                          gender: widget.gender,
                          lastName: widget.last_name,
                          medicalInfo: widget.medicalAidInfo,
                          dateOfBirth: widget.date_of_birth,
                          address: widget.address,
                          clientPhoneNumber: widget.phone_number,
                          profilePicture: widget.profile_picture,
                          confirmPasswordController: passwordController.text,
                          passwordController: passwordController.text,
                          email: widget.email,
                          medicalhistory: widget.medicalHistory,
                          allergies: widget.allergies,
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
