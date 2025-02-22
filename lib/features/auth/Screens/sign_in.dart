import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/features/auth/Controller/auth_controller.dart';
import 'package:care453/features/auth/Handler/auth_handler.dart';
import 'package:care453/models/select_user_enum.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/custom_password_textfield.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:care453/features/auth/Screens/forgot_password.dart';
import 'package:care453/features/auth/Screens/sign_up_page.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:care453/widgets/error_dialof.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            FadeInSlide(
                duration: 1.0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70,
                  child: Image.asset("assets/images/mylogo.png"),
                )),
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
                      'Login',
                      style: GoogleFonts.poppins(
                          color: Pallete.lightPrimaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 1.4,
                    child: CustomTextField(
                      controller: emailController,
                      labelText: 'Email Address',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                    duration: 1.6,
                    child: CustomPasswordTextfield(
                      controller: passwordController,
                      obscureText: true,
                      labelText: 'password',
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  FadeInSlide(
                    duration: 1.8,
                    child: CustomButton(
                        btnColor: Pallete.originBlue,
                        width: screenWidth,
                        borderRadius: 10,
                        child: Text(
                          'Log In',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => validateAndSubmitForm()),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FadeInSlide(
                    duration: 2.2,
                    child: GestureDetector(
                      onTap: () => GeneralHelpers.temporaryNavigator(
                          context, ForgotPasswordScreen()),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Pallete.lightPrimaryTextColor),
                            children: [
                              // TextSpan(
                              //     text: "Forgot Password?",
                              //     style: GoogleFonts.poppins(
                              //         color: Pallete.originBlue,
                              //         fontWeight: FontWeight.w400))
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                FadeInSlide(
                  duration: 2.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.25,
                        child: const Column(
                          children: [
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        ' Login with',
                        style: GoogleFonts.poppins(
                            color: Pallete.lightPrimaryTextColor, fontSize: 12),
                      ),
                      SizedBox(
                        width: screenWidth * 0.25,
                        child: const Column(
                          children: [
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              
                FadeInSlide(
                  duration: 2.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.42,
                        child: const Column(
                          children: [
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'or',
                        style: GoogleFonts.poppins(
                            color: Pallete.lightPrimaryTextColor),
                      ),
                      SizedBox(
                        width: screenWidth * 0.42,
                        child: const Column(
                          children: [
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FadeInSlide(
                  duration: 3.0,
                  child: GestureDetector(
                    onTap: () => GeneralHelpers.permanentNavigator(
                        context, const SignUp()),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Pallete.lightPrimaryTextColor),
                          children: [
                            const TextSpan(text: "Don't have an Account? "),
                            TextSpan(
                                text: " Register",
                                style: GoogleFonts.poppins(
                                    color: Pallete.originBlue,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FadeInSlide(
                  duration: 3.2,
                  child: Text(
                    'By proceeding you consent to get calls, WhatsApp or SMS messages including by automated means from Care453 and its affiliated to the number provided',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Pallete.lightPrimaryTextColor, fontSize: 9.61),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) => ErrorDialog(
              errorMessage: errorMessage,
            ));
  }

  void validateAndSubmitForm() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('', 'Email is required.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue);
      return;
    }

    // Validate email format
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(emailController.text.trim())) {
      Get.snackbar('', 'Invalid email format.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue);
      return;
    }

    if (passwordController.text.isEmpty) {
      Get.snackbar('', 'Password is required.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue);
      return;
    }

    if (passwordController.text.length < 8) {
      Get.snackbar('', 'Password is too short',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue);
      return;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const CustomLoader(message: 'Logging in');
        });

    final success = await authController.authSignInRequest(
      emailAddress: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    Navigator.pop(context); // Close the loader dialog

    if (success) {
      // Navigate to the main screen or dashboard
      GeneralHelpers.permanentNavigator(context, const AuthHandler());
    } else {
      showErrorDialog(authController.errorMessage.value);
    }
  }
}
