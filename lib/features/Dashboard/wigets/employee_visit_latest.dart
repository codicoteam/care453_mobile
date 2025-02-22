import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/visits_management/controller/visit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../providers/user_provider_class.dart';

class VisitWidget extends StatefulWidget {
  @override
  _VisitWidgetState createState() => _VisitWidgetState();
}

class _VisitWidgetState extends State<VisitWidget> {
  final VisitController visitController = Get.put(VisitController());

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false).user;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      visitController.getAllVisitsForEmployee(employeeid: "${user?.id}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: visitController.isLoading.value
            ? _buildLoadingShimmer()
       
                : visitController.visits.isEmpty
                    ? _buildVisitCard()
                    : _buildEmptyState(),
      ),
    );
  }

  Widget _buildLoadingShimmer() {
    return Container(
      height: 80,
      decoration: _containerDecoration(),
      padding: const EdgeInsets.all(2.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
          leading: const CircleAvatar(),
          title: Container(height: 16, color: Colors.white),
          subtitle: Container(height: 12, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      height: 80,
      decoration: _containerDecoration(),
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("An Error Occurred"),
          TextButton(
            onPressed: () {
              final userId =
                  'user_id_here'; // Replace with actual user ID logic
              visitController.getAllVisitsForEmployee(employeeid: userId);
            },
            child: Text("Retry"),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: 80,
      decoration: _containerDecoration(),
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.center,
      child: Text("No Latest Visit Found"),
    );
  }

  Widget _buildVisitCard() {
    final visit = visitController.visits.last;
    return Container(
      height: 163,
      decoration: _containerDecoration(),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text("View your latest visit"),
          SizedBox(height: 5),
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  visit.clientId!.profilePicture ?? '',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.person, size: 50),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${visit.clientId!.firstName} ${visit.clientId!.lastName}",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/alarm-clock.png",
                          height: 18, width: 20),
                      SizedBox(width: 10),
                      Text(
                        "${visit.officialVisitTime} - ${visit.officialEndTime}",
                        style: TextStyle(
                            color: Pallete.lightPrimaryTextColor,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: Color.fromARGB(255, 9, 104, 247),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              minimumSize: Size(double.infinity, 0),
            ),
            onPressed: () {
              // Add button logic here
            },
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                'View More',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Pallete.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Pallete.originBlue, width: 1),
    );
  }
}
