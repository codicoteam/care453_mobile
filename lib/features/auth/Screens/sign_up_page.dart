import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:care453/features/auth/Screens/create_password.dart';
import 'package:care453/features/auth/Screens/sign_in.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:care453/widgets/error_dialof.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();



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
                    child: CustomTextField(
                      controller: userNameController,
                      labelText: 'Username',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
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
                        onTap: () => validateAndSubmitForm()
                    ),
                  ),
                ],
              ),
            ),
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
        )
    );
  }

  void validateAndSubmitForm() async {
    if (!GeneralHelpers.isEmail(emailController.text)) {
      showErrorDialog('Please input a valid email');
      return;
    }

    if (userNameController.text.isEmpty) {
      showErrorDialog('Username is required.');
      return;
    }
    GeneralHelpers.permanentNavigator(
        context,
        CreatePasswordScreen(
          email: emailController.text.trim(),
          username: userNameController.text.trim(),
        )
    );
  }

}



    // const SizedBox(
    //           height: 16,
    //         ),
    //         FadeInSlide(
    //           duration: 2.2,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               SizedBox(
    //                 width: screenWidth * 0.25,
    //                 child: const Column(
    //                   children: [
    //                     Divider(
    //                       thickness: 2,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Text(
    //                 'SignUp with',
    //                 style: GoogleFonts.poppins(
    //                     color: Pallete.lightPrimaryTextColor, fontSize: 12),
    //               ),
    //               SizedBox(
    //                 width: screenWidth * 0.25,
    //                 child: const Column(
    //                   children: [
    //                     Divider(
    //                       thickness: 2,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 8,
    //         ),
    //         FadeInSlide(
    //           duration: 2.4,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Image.asset(
    //                 "assets/images/google_icon.png",
    //                 width: 40,
    //               ),
    //               const SizedBox(
    //                 width: 40,
    //               ),
    //               const Icon(
    //                 FontAwesomeIcons.facebook,
    //                 color: Colors.blue,
    //                 size: 40,
    //               ),
    //               const SizedBox(
    //                 width: 40,
    //               ),
    //               const Icon(
    //                 FontAwesomeIcons.apple,
    //                 size: 40,
    //               )
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 8,
    //         ),
    //         FadeInSlide(
    //           duration: 2.6,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               SizedBox(
    //                 width: screenWidth * 0.42,
    //                 child: const Column(
    //                   children: [
    //                     Divider(
    //                       thickness: 2,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Text(
    //                 'or',
    //                 style: GoogleFonts.poppins(
    //                     color: Pallete.lightPrimaryTextColor),
    //               ),
    //               SizedBox(
    //                 width: screenWidth * 0.42,
    //                 child: const Column(
    //                   children: [
    //                     Divider(
    //                       thickness: 2,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 16,
    //         ),
    //         FadeInSlide(
    //           duration: 2.8,
    //           child: GestureDetector(
    //             onTap: () =>
    //                 GeneralHelpers.permanentNavigator(context, const Login()),
    //             child: RichText(
    //               textAlign: TextAlign.center,
    //               text: TextSpan(
    //                   style: GoogleFonts.poppins(
    //                       fontSize: 12, color: Pallete.lightPrimaryTextColor),
    //                   children: [
    //                     const TextSpan(text: "Already have an account? "),
    //                     TextSpan(
    //                         text: " Login",
    //                         style: GoogleFonts.poppins(
    //                             color: Pallete.originBlue,
    //                             fontWeight: FontWeight.bold))
    //                   ]),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 16,
    //         ),
    //         FadeInSlide(
    //           duration: 3.0,
    //           child: Text(
    //             'By proceeding you consent to get calls, WhatsApp or SMS messages including by automated means from Markiti and its affiliated to the number provided',
    //             textAlign: TextAlign.center,
    //             style: GoogleFonts.poppins(
    //                 color: Pallete.lightPrimaryTextColor, fontSize: 9.61),
    //           ),
    //         )
        