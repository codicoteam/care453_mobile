import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/profile_management/controllers/profile_controllers.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});
  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  final profileController = Get.find<ProfileController>();

  String genderValue = "Male"; // Default selected gender

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Pallete.whiteColor,
          ),
        ),
        title: Text(
          'About Us',
          style: GoogleFonts.poppins(
            color: Pallete.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(LocalImageConstants.care_giver_two),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Pallete.originBlue
                  .withOpacity(0.9), // Blue overlay with 50% opacity
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  BounceFromRightAnimation(
                    delay: 0.5,
                    child: Text(
                      "Care 453 Health Company is a professional home care service provider dedicated to delivering high-quality, personalized patient care in the comfort of their homes.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 25),
                  const BounceFromRightAnimation(
                    delay: 0.8,
                    child: Text(
                      "We specialize in assisting individuals who require medical attention, elderly care, and rehabilitation support by ensuring they receive compassionate and professional caregiving.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 25),
                  BounceFromRightAnimation(
                    delay: 1.1,
                    child: Text(
                      "Our team of experienced caregivers and healthcare professionals is committed to improving patient well-being by offering reliable and comprehensive home-based care services.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 25),
                  BounceFromRightAnimation(
                    delay: 1.1,
                    child: Text(
                      "We empower families by providing tailored solutions that enhance the quality of life for patients, ensuring comfort, dignity, and independence.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 12),
                  FadeInSlide(
                      duration: 1.1,
                      child: Divider(
                        color: Pallete.originBlue,
                      )),
                  SizedBox(height: 20),
                  BounceFromRightAnimation(
                      delay: 1.4,
                      child: GestureDetector(
                        onTap: () async {
                          final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: 'support@care453.com',
                            queryParameters: {
                              'subject': 'Support Inquiry', // Optional subject
                            },
                          );

                          if (await canLaunchUrl(emailUri)) {
                            await launchUrl(emailUri,
                                mode: LaunchMode.inAppWebView);
                          } else {
                          }
                        },
                        child: Row(
                          children: [
                            Icon(Icons.email,
                                color: Pallete.originBlue, size: 22),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "support@care453.com",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 15),
                  BounceFromRightAnimation(
                      delay: 1.7,
                      child: GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse("https://www.care453.com");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalNonBrowserApplication);
                          } else {
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.public,
                              color: Pallete.originBlue,
                              size: 22,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "www.care453.com",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
