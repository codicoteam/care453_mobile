import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/fade_in_animation.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:care453/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/helpers/genenal_helpers.dart';
import '../../../widgets/customer_animation/fade_in_slide.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../view_care_professionals/screens/view_all_employee_screen.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({super.key});

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  int activeIndex = 0; // Move the variable here and initialize it

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent2(),
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
                        "Prince McClain",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Pallete.blackColor,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "3 Spruit Hatfiled Harare",
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
                child: Container(
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
                      SizedBox(
                        height: 8,
                      ),
                      Text("Care Professioner Attending to you."),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: ClipOval(
                                child: Image.asset("assets/images/female.png")),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mirriam Dube',
                                style: TextStyle(
                                  fontFamily: 'Inter', // Font family
                                  fontSize: 18.0, // Font size (15px)
                                  fontWeight: FontWeight
                                      .w500, // Font weight (500, medium)
                                  height: 18.15 /
                                      15.0, // Line height (line-height / font-size)
                                ),
                                textAlign:
                                    TextAlign.left, // Text alignment (left)
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                      height: 18,
                                      width: 20,
                                      fit: BoxFit.fill,
                                      "assets/images/alarm-clock.png"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '10:00 am - 15:00 pm',
                                    style: TextStyle(
                                      color: Pallete.lightPrimaryTextColor,
                                      fontFamily: 'Inter', // Font family
                                      fontSize: 14.0, // Font size (15px)
                                      fontWeight: FontWeight
                                          .w500, // Font weight (500, medium)
                                      height: 18.15 /
                                          15.0, // Line height (line-height / font-size)
                                    ),
                                    textAlign:
                                        TextAlign.left, // Text alignment (left)
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      //         // GeneralHelpers.temporaryNavigator(
                      //         //     context, NotificationPage());
                      //       },
                      //       child: Container(
                      //         width: 80,
                      //         height: 40,
                      //         decoration: BoxDecoration(
                      //           color: Pallete.originBlue.withOpacity(
                      //               0.2), // Background color of the container
                      //           borderRadius: BorderRadius.circular(30),
                      //         ),
                      //         child: Center(
                      //           child: Image.asset(
                      //             'assets/images/phone.png',
                      //             width: 30,
                      //             height: 30,
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 80,
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //         color: Pallete.originBlue.withOpacity(
                      //             0.2), // Background color of the container
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                      //       child: Center(
                      //         child: Image.asset(
                      //           'assets/images/whatsapp.png',
                      //           width: 30,
                      //           height: 30,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 80,
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //         color: Pallete.originBlue.withOpacity(
                      //             0.2), // Background color of the container
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                      //       child: Center(
                      //         child: Image.asset(
                      //           'assets/images/sms.png',
                      //           width: 30,
                      //           height: 30,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      FadeInSlide(
                        duration: 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor:
                                const Color.fromARGB(255, 9, 104, 247),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            minimumSize: const Size(double.infinity, 0),
                          ),
                          onPressed: () {
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
                              Get.to(ViewAllEmployeeScreen());
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
                                                'assets/images/care_professional.png',
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
                                        "Care Professionals",
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
                            onTap: () {},
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
                                                'assets/images/health-check.png',
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
                                        "My History",
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
                            onTap: () {},
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
                                                'assets/images/bill.png',
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
                                        "Bills",
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
                            onTap: () {},
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
