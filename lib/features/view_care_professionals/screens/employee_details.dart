import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/view_care_professionals/Helpers/view_employee_helper.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import '../../../models/employee_model.dart';

class EmployeeProfileScreen extends StatefulWidget {
  final EmployeeModel employeeModel;
  const EmployeeProfileScreen({super.key, required this.employeeModel});
  @override
  State<EmployeeProfileScreen> createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
  String _getInitials(String? firstName, String? lastName) {
    return '${firstName?[0] ?? ''}${lastName?[0] ?? ''}'.toUpperCase();
  }

  final ViewEmployeeHelper viewEmployeeHelper = ViewEmployeeHelper();

  @override
  Widget build(BuildContext context) {
    final initials = _getInitials(
        widget.employeeModel.firstName, widget.employeeModel.lastName);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Pallete.whiteColor,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    LocalImageConstants.care_giver_two,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Pallete.originBlue.withOpacity(0.9),
                          Pallete.originBlue.withOpacity(0.9),
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: _buildProfileHeader(
                  initials, widget.employeeModel.profilePicture!, context),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildDriverDetailsSection(),
                const SizedBox(height: 30),
                FadeInSlide(
                  duration: 1.8,
                  child: CustomButton(
                      width: 45,
                      btnColor: Pallete.originBlue,
                      borderRadius: 10,
                      child: Text(
                        'Back',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      }),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(
      String initials, String profileImage, BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Pallete.lightPrimaryTextColor)),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Pallete.originBlue.withOpacity(0.7),
            child: ClipOval(
              child: Image.network(
                profileImage,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image has loaded
                  } else {
                    return Center(
                      child: Text(
                        initials,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ); // Show initials while loading
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      initials,
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ); // Show initials on error
                },
              ),
            ),
          )
              .animate()
              .scale(duration: 600.ms, curve: Curves.elasticOut)
              .fadeIn(),
        ),
        const SizedBox(height: 12),
        Text(
          "${widget.employeeModel.firstName} ${widget.employeeModel.lastName}",
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ).animate().slideY(begin: 0.5, end: 0, duration: 500.ms).fadeIn(),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: widget.employeeModel.employmentType == 'Full-time'
                ? Colors.green.shade600
                : Colors.red.shade600,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.employeeModel.employmentType ?? 'Unknown',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ).animate().scale(duration: 400.ms),
        SizedBox(
          height: 16,
        )
      ],
    );
  }

  Widget _buildDriverDetailsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Employee Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                //navigate the number
                viewEmployeeHelper
                    .makePhoneCall(widget.employeeModel.contactNumber!);
              },
              child: _buildDetailRow(Icons.phone, 'Phone Number',
                  widget.employeeModel.contactNumber ?? 'N/A'),
            ),
            GestureDetector(
              onTap: () {
                viewEmployeeHelper.sendEmail(widget.employeeModel.email!);

                //navigate to email
              },
              child: _buildDetailRow(
                  Icons.email, 'Email', widget.employeeModel.email ?? 'N/A'),
            ),
            _buildDetailRow(UniconsLine.clinic_medical, 'Specialization',
                widget.employeeModel.specialization ?? 'N/A'),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Pallete.originBlue,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Address",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            Text(
              widget.employeeModel.address!,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.1);
  }

  Widget _buildDetailRow(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Pallete.originBlue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
