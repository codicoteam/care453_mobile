import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/custom_date_picker.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../widgets/customPhoneNumber.dart';
import '../../profile_management/helpers/profile_helper.dart';
import '../Helpers/register_helper.dart';

class ContactDetailsScreen extends StatefulWidget {
  final String first_name;
  final String last_name;
  final String date_of_birth;
  final String gender;
  const ContactDetailsScreen(
      {super.key,
      required this.first_name,
      required this.last_name,
      required this.date_of_birth,
      required this.gender});

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController address_Controller = TextEditingController();
  TextEditingController date_of_birth_controller = TextEditingController();
  final ProfileHelper profileHelper = ProfileHelper();
  final RegisterHelper registerHelper = RegisterHelper();

  String uploadedImageUrl = "";

  bool uploading = false;
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
              height: 15,
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
                      controller: address_Controller,
                      labelText: 'Address',
                      prefixIcon: const Icon(
                        Icons.location_city,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                      duration: 1.6,
                      child: CustomePhoneNumber(
                        labelText: "Phone Number",
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        controller: phoneNumberController,
                        onChanged: (value) {
                          print("Phone number: $value");
                        },
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  FadeInSlide(
                      duration: 1.6,
                      child: CustomTextField(
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        controller: emailController,
                        onChanged: (value) {
                          print("Phone number: $value");
                        },
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: GestureDetector(
                      onTap: () {
                        profileHelper.showImagePickerDialog((url) {
                          setState(() {
                            uploadedImageUrl = url;
                          });
                        });
                        setState(() {
                          uploading = true;
                        });
                      },
                      child: Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/profile-two.png",
                              width: 25,
                              height: 25,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Set Profile Picture",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  if (uploading && uploadedImageUrl == "")
                    Container(
                      height: 250,
                      child: Center(
                        child: LoadingAnimationWidget.hexagonDots(
                            color: Pallete.originBlue, size: 60),
                      ),
                    ),
                  if (uploadedImageUrl != '')
                    Column(
                      children: [
                        SizedBox(height: 10),
                        ClipOval(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Grey background
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey
                                      .shade300, // Adjust the shade of grey as needed
                                  shape: BoxShape
                                      .circle, // Ensures the background is circular
                                ),
                              ),
                              // Image with loading indicator
                              Image.network(
                                uploadedImageUrl!,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child; // Image has fully loaded
                                  }
                                  return LoadingAnimationWidget.hexagonDots(
                                      color: Pallete.originBlue,
                                      size: 60); // Display a loading spinner
                                },
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return Icon(Icons.error,
                                      size: 50,
                                      color: Colors
                                          .red); // Handle image load errors
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
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
                          registerHelper.validateRegisterTwo(
                              address: address_Controller.text,
                              phone_number: phoneNumberController.text,
                              email: emailController.text,
                              profile_picture: uploadedImageUrl,
                              first_name: widget.first_name,
                              last_name: widget.last_name,
                              date_of_birth: widget.date_of_birth,
                              gender: widget.gender);
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
