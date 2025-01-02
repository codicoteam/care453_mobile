
import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/auth/Handler/auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/custom_button.dart';

class AccountVerificationSuccessful extends StatelessWidget {
  const AccountVerificationSuccessful({super.key});


  @override
  Widget build(BuildContext context) {String? sentTo;
  double screenWidth = MediaQuery.sizeOf(context).width;


  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),

          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(
                    LocalImageConstants.success,
                    width: 200
                ),

                const SizedBox(
                  height: 8,
                ),

                Text(
                  'Verification Successful',
                  style: GoogleFonts.poppins(
                      color: Pallete.lightPrimaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  'Congratulations your account has been activated.Continue to start Shopping and Experience a world of unrivaled Deals and personalized Offers.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Pallete.lightPrimaryTextColor,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                CustomButton(
                    btnColor: Pallete.primaryColor,
                    width: screenWidth,
                    borderRadius: 10,
                    child: Text(
                      'Continue',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),

                    onTap: () => GeneralHelpers.permanentNavigator(context, AuthHandler())
                ),

                const SizedBox(
                  height: 30,
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
