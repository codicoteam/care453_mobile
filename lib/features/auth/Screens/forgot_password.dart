import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/asset_utils/image_util.dart';
import '../../../core/utils/colors/pallete.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {


  ForgotPasswordScreen({super.key,});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 120,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                "assets/images/mylogo.png",
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20
              ),

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
                    'Reset Password',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Pallete.lightPrimaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    'Enter your email and we will send you a password reset link',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Pallete.lightPrimaryTextColor,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),


                  CustomTextField(
                    controller: emailController,
                    obscureText: false,
                    labelText: 'Email Address',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  CustomButton(
                    btnColor: Pallete.originBlue,
                    width: screenWidth,
                    borderRadius: 10,
                    child: Text(
                        'Reset Password',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),

                    onTap: () async{
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context){
                            return const CustomLoader(
                                message: 'Resetting Password'
                            );
                          }
                      );
                      GeneralHelpers.back(context);


                      // await AuthServices.sendPasswordResetEmail(email: emailController.text.trim());


                      // GeneralHelpers.temporaryNavigator(context, ResendResetEmailScreen(email: emailController.text.trim()));

                    },
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
