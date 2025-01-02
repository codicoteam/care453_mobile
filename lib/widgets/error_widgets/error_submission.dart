import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/Home/admin_main_home.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/custom_description.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:care453/widgets/general_button_two.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_text_field.dart';

class ErrorSubmission extends StatefulWidget {
  const ErrorSubmission({
    super.key,
  });

  @override
  State<ErrorSubmission> createState() => _ErrorSubmissionState();
}

class _ErrorSubmissionState extends State<ErrorSubmission> {
  List<String> uploadedImageUrl = [];

  final TextEditingController _descriptionontroller = TextEditingController();

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
            children: [
              const SizedBox(height: 30),
              Image.asset(
                LocalImageConstants.errorWarning,
                color: Pallete.originBlue,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                "Error Occured",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Pallete.blackColor,
                    ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 300.ms),
              const SizedBox(height: 15),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () {
                    Get.to(EmployeeMainScreen());
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Pallete.originBlue, // Set the background color
                      borderRadius:
                          BorderRadius.circular(10), // Add border radius
                    ),
                    child: Center(
                      child: Text(
                        "Try Again",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors
                              .white, // Text color to contrast with the background
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
























// import 'package:care453/core/utils/asset_utils/image_util.dart';
// import 'package:care453/core/utils/colors/pallete.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../general_button_two.dart';
// class SuccessSubmission extends StatefulWidget {
//   const SuccessSubmission({super.key});

//   @override
//   State<SuccessSubmission> createState() => _SuccessSubmissionState();
// }

// class _SuccessSubmissionState extends State<SuccessSubmission> {
//   @override
//   Widget build(BuildContext context) {
//     return 

    
//     Dialog(
//   alignment: Alignment.bottomCenter,
//   insetPadding: EdgeInsets.zero,
//   shadowColor: Colors.grey.withOpacity(0.2),
//   child: ConstrainedBox(
//     constraints: BoxConstraints(
//       maxWidth: MediaQuery.of(context).size.width * 0.9,
//     ),
//     child: Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 10,
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [

//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GeneralButtonTwo(
//                   onTap: () {},
//                   btnColor: Pallete.originBlue,
//                   child: const Text(
//                     'Continue',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ).animate().fadeIn(duration: 650.ms),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );

//   }
// }
