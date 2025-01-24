import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/casched_data.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/auth/Services/auth_services.dart';
import 'package:care453/features/message_management/screens/chat_screen.dart';
import 'package:care453/features/profile_management/screens/cleint_profile_screen.dart';
import 'package:care453/features/visits_management/screens/client_all_visits.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../features/patientvitals/screens/dashboard_patient_vitals.dart';
import '../features/splash/role_selection.dart';

class DrawerComponent2 extends StatelessWidget {
  DrawerComponent2({super.key});

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.70, //set dawer width
      elevation: 3,
      child: Material(
        color: Pallete.whiteColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
                    Get.to(CreateProfileClient());
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 3, color: Pallete.originBlue),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${user!.displayName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${user!.email}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Divider(
              color: Pallete.originBlue.withOpacity(0.5),
              height: 3,
              thickness: 2,
            ),

            SizedBox(
              height: 15,
            ),

            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Image.asset(
                  LocalImageConstants.appointment,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: appColors.white,
                ),
              ),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientMany()));
              },
            ),

            ListTile(
              leading: Container(
                height: 35,
                width: 30,
                child: Image.asset(
                  LocalImageConstants.visits,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Visits',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: appColors.white,
                ),
              ),
              onTap: () {
                Get.to(ViewAllVisitScreen());
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientMany()));
              },
            ),
            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Image.asset(
                  LocalImageConstants.medicalReport,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Medical Report',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: appColors.white,
                ),
              ),
              onTap: () {
                Get.to(DashboardPatientVitals());
              },
            ),

            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Image.asset(
                  LocalImageConstants.chatMessage,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Chat',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: appColors.white,
                ),
              ),
              onTap: () {
                Get.to(ChatScreen());
              },
            ),

            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Image.asset(
                  LocalImageConstants.faq,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'FAQ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: appColors.white,
                ),
              ),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeolocatorWidget()));
              },
            ),

            ListTile(
              leading: Container(
                height: 35,
                width: 35,
                child: Image.asset(
                  LocalImageConstants.about,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: appColors.white,
                ),
              ),
              onTap: () {
                // Helpers.temporaryNavigator(context, TripsTab());
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),

            ListTile(
                leading: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset(
                    LocalImageConstants.logout,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    // color: appColors.white,
                  ),
                ),
                onTap: () async {
                  final result = await AuthServices.signOut();
                  await CacheUtils.clearCachedRole();
                  await CacheUtils.updateOnboardingStatus(false);
                  if (result.success) {
                    Get.to(InitialRoleSelectionScreen());
                  } else {
                    Get.snackbar('Error', "ocurredgfd");
                  }
                }),
            Divider(
              color: Pallete.originBlue.withOpacity(0.5),
              height: 3,
              thickness: 2,
            ),
            Expanded(
                child: SizedBox(
              child: Column(
                children: <Widget>[
                  Text(
                    'Contact Us: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.whatsapp,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.sms,
                              color: Pallete.blackColor,
                            )),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.xTwitter,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),

            // Divider(
            //   color: appColors.grey[80],
            //   height: 3,
            //   thickness: 2,
            // ),

            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Pallete.blackColor,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Pallete.originBlue,
                ),
              ),
              onTap: () {
                // _auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
