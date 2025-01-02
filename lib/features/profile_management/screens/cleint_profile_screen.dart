import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/profile_management/controllers/profile_controllers.dart';
import 'package:care453/features/profile_management/helpers/profile_helper.dart';
import 'package:care453/widgets/customPhoneNumber.dart';
import 'package:care453/widgets/custom_date_form.dart';
import 'package:care453/widgets/custom_date_picker.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text_field.dart';

class CreateProfileClient extends StatefulWidget {
  const CreateProfileClient({super.key});
  @override
  State<CreateProfileClient> createState() => _CreateProfileClientState();
}

class _CreateProfileClientState extends State<CreateProfileClient> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController maidenSurnameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController countryOfBirthController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController address_Controller = TextEditingController();
  TextEditingController medicalAidInfo = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? countryValue;
  String? genderValue;

  TextEditingController date_of_controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final ProfileHelper profileHelper = ProfileHelper();
  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // You can handle the image file here
      print("Image Path: ${image.path}");
    }
  }

  bool uploading = false;
  String? uploadedImageUrl;
  double uploadProgress = 0.0;
  // Title
  bool _isMr = false;
  bool _isMrs = false;
  bool _isMs = false;
  bool _isMiss = false;
  bool _isDr = false;
  bool _isOther = false;

  // Gender
  bool _isMale = false;
  bool _isFemale = false;

  // Marital Status
  bool _isSingle = false;
  bool _isMarried = false;
  bool _isDivorced = false;
  bool _isWidowed = false;
  bool _isEngaged = false;

  // Residing
  bool _isResidingYes = false;
  bool _isNoResiding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        // GeneralHelpers.temporaryNavigator(context, CustomerHome());
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Pallete.originBlue,
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Complete Profile",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
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
                  Row(
                    children: [
                      Text(
                        "First Name",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    child: CustomTextField(
                      controller: firstNameController,
                      labelText: 'Enter Name',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Surname",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    child: CustomTextField(
                      controller: surnameController,
                      labelText: 'Enter Surname',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Medical Aid Info",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    child: CustomTextField(
                      controller: medicalAidInfo,
                      labelText: 'Medical Aid Info',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Date of Birth",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    child: CustomDateOfBirth(
                      labelText: 'Date of Birth',
                      controller: dateOfBirthController,
                      prefixIcon: Icon(Icons.calendar_today),
                      focusedBorderColor: Colors.blue,
                      onChanged: (value) {
                        print('Selected Date: $value');
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Address",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    child: CustomTextField(
                      controller: address_Controller,
                      labelText: 'Street & City',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        "Country ",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  CSCPicker(
                    showStates: false, // Hide the state input
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value.toString();
                      });
                    },
                    countryDropdownLabel: countryValue != null
                        ? "$countryValue"
                        : 'Select Country', // Update label dynamically
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    selectedItemStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Phone Number Controller",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 45,
                      child: CustomePhoneNumber(
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.phone),
                        controller: phoneNumberController,
                        onChanged: (value) {
                          print("Phone number: $value");
                        },
                      )),
                  Row(
                    children: [
                      Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  GenderPickerWithImage(
                    showOtherGender: false,
                    verticalAlignedText: true,
                    selectedGender: Gender.Male,
                    selectedGenderTextStyle: TextStyle(
                        color: Pallete.originBlue, fontWeight: FontWeight.bold),
                    unSelectedGenderTextStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                    onChanged: (gender) {
                      print(gender!.name);
                      setState(() {
                        genderValue = gender!.name;
                      });
                    },
                    equallyAligned: true,
                    animationDuration: Duration(milliseconds: 300),
                    isCircular: true,
                    // default : true,
                    opacityOfGradient: 0.4,
                    padding: const EdgeInsets.all(3),
                    size: 50, //default : 40
                  ),
                  Row(
                    children: [
                      Text(
                        "Profile Picture",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
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
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Pallete.whiteColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/profile-two.png",
                              width: 30,
                              height: 30,
                              color: Pallete.lightPrimaryTextColor,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Set Picture",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (uploading && uploadedImageUrl == null)
                    Container(
                      height: 250,
                      child: Center(
                        child: LoadingAnimationWidget.hexagonDots(
                            color: Pallete.originBlue, size: 60),
                      ),
                    ),
                  if (uploadedImageUrl != null)
                    Column(
                      children: [
                        SizedBox(height: 10),
                        ClipOval(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Grey background
                              Container(
                                height: 250,
                                width: 250,
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
                                height: 250,
                                width: 250,
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
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    child: FadeInSlide(
                      duration: 1.8,
                      child: CustomButton(
                          btnColor: Pallete.originBlue,
                          width: double.infinity,
                          borderRadius: 10,
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            profileHelper.validateAndSubmitForm(
                              country: countryValue ?? "",
                              firstName: firstNameController.text,
                              gender: genderValue ?? "",
                              lastName: surnameController.text,
                              medicalInfo: medicalAidInfo.text,
                              dateOfBirth: dateOfBirthController.text,
                              address: address_Controller.text,
                              clientPhoneNumber: phoneNumberController.text,
                              profilePicture: uploadedImageUrl ?? "",
                              confirmPasswordController: 'Clinpride#2001',
                              passwordController: 'Clinpride#2001',
                            );

                            print("Next button tapped");
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
