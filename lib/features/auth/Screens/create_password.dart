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

class CreatePasswordScreen extends StatefulWidget {
  final String email;
  final String username;

  const CreatePasswordScreen({super.key, required this.email, required this.username});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final AuthController authController = Get.put(AuthController());
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
                    onTap: () => validateAndSubmitForm(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateAndSubmitForm() async {
    if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Password is required.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please confirm your password.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (passwordController.text.length < 8) {
      Get.snackbar('Error', 'Password is too short.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      Get.snackbar('Error', 'Passwords don\'t match.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!GeneralHelpers.isStrongPassword(confirmPasswordController.text.trim())) {
      Get.snackbar('Error', 'Your password is too weak.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    authController.isLoading(true);
    final bool isSuccess = await authController.authSignUpRequest(
      emailAddress: widget.email,
      password: confirmPasswordController.text.trim(),
      userName: widget.username,
    );

    authController.isLoading(false);
    if (isSuccess) {
      Get.snackbar('Success', authController.successMessage.value,
          snackPosition: SnackPosition.BOTTOM);
      // Navigate to the desired screen on success
      // GeneralHelpers.permanentNavigator(context, const AuthHandler());
    } else {
      Get.snackbar('Error', authController.errorMessage.value,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
