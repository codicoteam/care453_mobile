import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/profile_management/controllers/profile_controllers.dart';
import 'package:care453/features/profile_management/helpers/profile_helper.dart';
import 'package:care453/widgets/customPhoneNumber.dart';
import 'package:care453/widgets/custom_password_textfield.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../providers/user_provider_class.dart';
import 'package:intl/intl.dart';

class CreateProfileClient extends StatefulWidget {
  const CreateProfileClient({super.key});
  @override
  State<CreateProfileClient> createState() => _CreateProfileClientState();
}

class _CreateProfileClientState extends State<CreateProfileClient> {
  final profileController = Get.find<ProfileController>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController maidenSurnameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController countryOfBirthController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController address_Controller = TextEditingController();
  TextEditingController allergies_Controller = TextEditingController();
  TextEditingController medicalAidInfo = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? countryValue;
  String genderValue = "Male"; // Default selected gender
  TextEditingController date_of_controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final ProfileHelper profileHelper = ProfileHelper();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      profileController
          .getProfileClient(clientEmail: "${user?.email}")
          .then((_) {
        if (!mounted) return; // Exit if the widget is disposed
        final client = profileController.clientProfile.value;
        if (client != null) {
          DateTime parsedDate =
              DateTime.parse(client.dateOfBirth! ?? "1999-12-03");
          String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
          setState(() {
            firstNameController.text = client.firstName ?? "";
            surnameController.text = client.lastName ?? "";
            emailController.text = client.email ?? "";
            phoneNumberController.text = client.contactNumber ?? "";
            address_Controller.text = client.address ?? "";
            medicalAidInfo.text = client.medicalAidInfo ?? "";
            allergies_Controller.text = client.allergies!.first ?? "";
            dateOfBirthController.text = formattedDate ?? "";
            genderValue = client.gender ?? "Male";
            uploadedImageUrl = client.profilePicture ?? "";
          });
        }
      });
    });
  }

  @override
  void dispose() {
    dateOfBirthController.dispose();
    firstNameController.dispose();
    surnameController.dispose();
    nationalIdController.dispose();
    maidenSurnameController.dispose();
    countryOfBirthController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    address_Controller.dispose();
    allergies_Controller.dispose();
    medicalAidInfo.dispose();
    super.dispose();
  }

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
          'Profile',
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
            Obx(() {
              if (profileController.isLoading.value) {
                return Container(
                  height: 250,
                  child: Center(
                    child: LoadingAnimationWidget.hexagonDots(
                        color: Pallete.originBlue, size: 60),
                  ),
                );
              }
              final client = profileController.clientProfile.value;

              return Padding(
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
                      child: CustomTextField(
                        labelText: 'Date of Birth',
                        controller: dateOfBirthController,
                        prefixIcon: Icon(Icons.calendar_today),
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
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Allergies",
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
                        controller: allergies_Controller,
                        labelText: 'Dust, Peanut',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Phone Number",
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
                    FadeInSlide(
                        duration: 1.6,
                        child: GenderPickerWithImage(
                          showOtherGender: false,
                          verticalAlignedText: true,
                          selectedGender: genderValue == "Male"
                              ? Gender.Male
                              : Gender.Female,
                          selectedGenderTextStyle: TextStyle(
                            color: Colors
                                .blue, // Replace with Pallete.originBlue if available
                            fontWeight: FontWeight.bold,
                          ),
                          unSelectedGenderTextStyle: TextStyle(
                            color: Colors
                                .grey, // Use a distinguishable unselected color
                            fontWeight: FontWeight.normal,
                          ),
                          onChanged: (gender) {
                            setState(() {
                              genderValue =
                                  gender!.name; // Updates the selected gender
                              print(
                                  'Gender selected: $genderValue'); // Debugging output
                            });
                          },
                          equallyAligned: true,
                          animationDuration: Duration(milliseconds: 300),
                          isCircular: true,
                          opacityOfGradient: 0.4,
                          padding: const EdgeInsets.all(3),
                          size: 50,
                        )),
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
                          height: 45,
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
                    Row(
                      children: [
                        Text(
                          "Password",
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
                      child: CustomPasswordTextfield(
                        controller: passwordController,
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Confirm Password",
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
                      child: CustomPasswordTextfield(
                        controller: confirmPasswordController,
                        labelText: 'Confirm Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        obscureText: true,
                      ),
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
                              profileHelper.validateAndUpdate(
                                firstName: firstNameController.text,
                                gender: genderValue ?? "",
                                lastName: surnameController.text,
                                medicalInfo: medicalAidInfo.text,
                                dateOfBirth: dateOfBirthController.text,
                                address: address_Controller.text,
                                clientPhoneNumber: phoneNumberController.text,
                                profilePicture: uploadedImageUrl ?? "",
                                confirmPasswordController:
                                    confirmPasswordController.text,
                                passwordController: passwordController.text,
                                email: client!.email!,
                                medicalhistory:
                                    '${client.medicalHistory!.first.condition}',
                                allergies: allergies_Controller.text,
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
              );
            }),
          ],
        ),
      ),
    );
  }
}
