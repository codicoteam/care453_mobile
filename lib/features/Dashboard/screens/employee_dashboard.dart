import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/visits_management/screens/employee_all_visit.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:care453/widgets/drawer.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../providers/user_provider_class.dart';
import '../../../widgets/customer_animation/fade_in_slide.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../widgets/drawer_employee.dart';
import '../../../widgets/loaders/loader_group_user.dart';
import '../../assessment_management/screens/all_assessment_screen.dart';
import '../../profile_management/screens/employee_profile_screen.dart';
import '../../runner_management/screens/all_runner_employee_screen.dart';
import '../../view_care_professionals/screens/view_all_employee_screen.dart';
import '../../visits_management/controller/visit_controller.dart';
import '../../visits_management/screens/detail_visit.dart';

class CareProfessionalHome extends StatefulWidget {
  const CareProfessionalHome({super.key});
  @override
  State<CareProfessionalHome> createState() => _CareProfessionalHomeState();
}

class _CareProfessionalHomeState extends State<CareProfessionalHome> {
  int activeIndex = 0;
  final List<Widget> imageSliders = [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Pallete.originBlue,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 216, 205, 205).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ensures seamless\ncommunication between \nyou and your nurse.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Pallete.blackColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.originBlue,
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => TwoFavorite()),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/services.png',
                        width: 95,
                        height: 95,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Pallete.originBlue,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 216, 205, 205).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Easily track your \nhealth records with \nour secure platform.",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.originBlue,
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => TwoFavorite()),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/caregiver.png',
                        width: 95,
                        height: 95,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Pallete.originBlue,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 216, 205, 205).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Stay connected with \nyour nurse for personalized \nhealth updates.",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.originBlue,
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => TwoFavorite()),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/trained.png',
                        width: 95,
                        height: 95,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ];
  final visitController = Get.find<VisitController>();
  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false).user;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      visitController.getAllVisitsForEmployee(employeeid: '${user?.id}');
    });
  }

  @override
  Widget build(BuildContext context) {
        final user = Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      drawer: DrawerEmployee(),
      body: Container(
        color: Pallete.greyBackground,
        child: Column(
          children: [
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                children: [
                  // Profile icon with circular border
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                    );
                  }),
                  const SizedBox(width: 20),
                  // Section title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Pallete.blackColor,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 18,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${user?.email}",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Pallete.blackColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 1.9,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  onPageChanged: ((index, reason) {
                    setState(() => activeIndex = index);
                  }),
                ),
                items: imageSliders,
              ),
            ),
            // Visits header with counter and dropdown icon
            // Alerts section with message and button

            BounceFromRightAnimation(
              delay: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: visitController.isLoading.value
                    ? Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Pallete.originBlue, // Blue border color
                            width: 1, // Border width of 2
                          ),
                        ),
                        padding: const EdgeInsets.all(2.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ListTile(
                            leading: const CircleAvatar(),
                            title: Container(height: 16, color: Colors.white),
                            subtitle:
                                Container(height: 12, color: Colors.white),
                          ),
                        ),
                      )
                    : visitController.visits.isEmpty
                        ? Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Pallete.originBlue, // Blue border color
                                width: 1, // Border width of 2
                              ),
                            ),
                            padding: const EdgeInsets.all(2.0),
                            child: Text("No Latest Visit Found"))
                        : Container(
                            height: 163,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Pallete.originBlue, // Blue border color
                                width: 1, // Border width of 2
                              ),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Text("View your latest visit"),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    CircleAvatar(
                                            backgroundColor: Pallete.originBlue,
                                            radius: 25,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Pallete.originBlue,
                                              radius: 25,
                                              child: ClipOval(
                                                child: Image.network(
                                                  visitController
                                                      .visits
                                                      .last
                                                      .clientId!
                                                      .profilePicture!,
                                                  fit: BoxFit.cover,
                                                  width:
                                                      50, // Match the diameter of the CircleAvatar (2 * radius)
                                                  height:
                                                      50, // Match the diameter of the CircleAvatar (2 * radius)
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      // The image has finished loading
                                                      return child;
                                                    } else {
                                                      // The image is still loading, show shimmer
                                                      return Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[300]!,
                                                        highlightColor:
                                                            Colors.grey[100]!,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.grey[300],
                                                          radius: 25,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                    // Handle image loading error (optional)
                                                    return Icon(Icons.error,
                                                        size: 50,
                                                        color: Colors.red);
                                                  },
                                                ),
                                              ),
                                            ))
                                        .animate()
                                        .fadeIn(duration: 300.ms)
                                        .slideX(),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${visitController.visits.last.clientId!.firstName} ${visitController.visits.last.clientId!.lastName}",
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            height: 18.15 / 15.0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                height: 18,
                                                width: 20,
                                                fit: BoxFit.fill,
                                                "assets/images/alarm-clock.png"),
                                            SizedBox(width: 10),
                                            Text(
                                              "${visitController.visits.last.officialVisitTime} ${visitController.visits.last.officialEndTime}",
                                              style: TextStyle(
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                                fontFamily: 'Inter',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                height: 18.15 / 15.0,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                FadeInSlide(
                                  duration: 3,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      backgroundColor: const Color.fromARGB(
                                          255, 9, 104, 247),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      minimumSize:
                                          const Size(double.infinity, 0),
                                    ),
                                    onPressed: () {
                                      Get.to(DetailVisit(
                                        visitModel: visitController.visits.last,
                                      ));
                                      // Add button onPressed logic here
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        'View More',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Pallete.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: BounceFromRightAnimation(
                    delay: 3.5,
                    child: GridView.count(
                      crossAxisCount: 2, // Two items per line
                      shrinkWrap: true,
                      childAspectRatio:
                          1.3, // Adjust the value to change the height of the widgets

                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 3, left: 3, top: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(AllRunnerEmployeeScreen());
                              // GeneralHelpers.temporaryNavigator(
                              //     context, ViewAllAvailable());
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 216, 205, 205)
                                            .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Pallete.originBlue,
                                      width: 1,
                                    ),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Pallete.originBlue
                                              .withOpacity(0.1),
                                        ),
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                LocalImageConstants.runners,
                                                width: 10,
                                                height: 10,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "My Runners",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 3, left: 3, top: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(ViewAllVisitsForEmployee());
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 216, 205, 205)
                                            .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Pallete.originBlue,
                                      width: 1,
                                    ),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Pallete.originBlue
                                              .withOpacity(0.1),
                                        ),
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                LocalImageConstants.visits,
                                                width: 10,
                                                height: 10,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "My Visits",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 3, left: 3, top: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(AllAssessmentScreen());
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 216, 205, 205)
                                            .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Pallete.originBlue,
                                      width: 1,
                                    ),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Pallete.originBlue
                                              .withOpacity(0.1),
                                        ),
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                LocalImageConstants.assessments,
                                                width: 10,
                                                height: 10,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Assessments",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 3, left: 3, top: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.off(EmployeeProfileDetailScreen());
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 216, 205, 205)
                                            .withOpacity(0.8),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Pallete.originBlue,
                                      width: 1,
                                    ),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Pallete.originBlue
                                              .withOpacity(0.1),
                                        ),
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/account.png',
                                                width: 10,
                                                height: 10,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "My Profile",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}






// 