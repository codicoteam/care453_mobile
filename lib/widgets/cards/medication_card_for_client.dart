import 'package:cached_network_image/cached_network_image.dart';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/get_task_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unicons/unicons.dart';
import '../../models/get_medicine_model.dart';
class MedicationCardForClient extends StatelessWidget {
  final GetMedicationModel getMedicationModel;
  final VoidCallback? onTap;
  const MedicationCardForClient(
      {super.key, required this.getMedicationModel, this.onTap});
  @override
  Widget build(BuildContext context) {
    final request = getMedicationModel;
    // final employee = request.careProfessionalId;
    // Determine status color
    Color getStatusColor() {
      switch (getMedicationModel.status) {
        case 'Completed':
          return Colors.green;
        case 'Pending':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    // // Format date and time
    // String formatDateTime() {
    //   final dateFormat = DateFormat('EEE, MMM d, yyyy');
    //   return dateFormat.format(getMedicationModel.dateOfVisit!);
    // }

    // Get menu options based on status
    List<String> getMenuOptions() {
      switch (getMedicationModel.status) {
        case 'Pending':
          return ['View Profile'];
        case 'Ongoing':
          return ['View'];
        case 'Completed':
          return ['View Profile'];
        default:
          return [];
      }
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Material(
          elevation: 9,
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey.shade50,
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Background pattern
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Opacity(
                      opacity: 0.1,
                      child: Icon(Icons.home,
                          size: 200,
                          color: Pallete.primaryColor.withOpacity(0.5)),
                    ),
                  ),

                  // Card Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Medication Details",
                              style: GoogleFonts.poppins(
                                color: Pallete.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                      width: 100,
                                      height: 100,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Image.asset(
                                        LocalImageConstants.medicationIcon,
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${getMedicationModel.name}',
                                        style: GoogleFonts.poppins(
                                          color: Pallete.blackColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Frequecy:',
                                            style: TextStyle(
                                              color: Pallete.originBlue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${getMedicationModel.frequency}',
                                            style: TextStyle(
                                              color: Pallete.originBlue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Dosage:',
                                            style: TextStyle(
                                              color: Pallete.originBlue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '${getMedicationModel.dosage}',
                                            style: TextStyle(
                                              color: Pallete.originBlue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Notes',
                          style: GoogleFonts.poppins(
                            color: Pallete.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ReadMoreText(
                          getMedicationModel.description ??
                              'No description available',
                          trimLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                          colorClickableText: Pallete.originBlue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                            fontSize: 13,
                            color: Pallete.originBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 200.ms, duration: 500.ms)
                            .slideX(begin: -0.1, end: 0),
                        const SizedBox(height: 10),

                        const SizedBox(height: 10),
                        SizedBox(
                          height: 2,
                          width: double.infinity,
                          child: Divider(color: Pallete.originBlue),
                        ),
                        const SizedBox(height: 10),
                        // Header Row
                        Text(
                          "Prescribed By",
                          style: GoogleFonts.poppins(
                            color: Pallete.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                          backgroundColor: Pallete.originBlue,
                                          radius: 25,
                                          child: CircleAvatar(
                                            backgroundColor: Pallete.originBlue,
                                            radius: 25,
                                            child: ClipOval(
                                              child: Image.network(
                                                getMedicationModel.prescribedBy!
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
                                                  if (loadingProgress == null) {
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
                                  const SizedBox(width: 15),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${getMedicationModel.prescribedBy!.firstName} ${getMedicationModel.prescribedBy!.lastName}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${getMedicationModel.prescribedBy!.email}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(
                                Icons.more_vert,
                                size: 24,
                                color: Pallete.originBlue,
                              ),
                              onSelected: (value) {
                                print('Selected: $value');
                              },
                              itemBuilder: (context) {
                                return getMenuOptions()
                                    .map((option) => PopupMenuItem<String>(
                                          value: option,
                                          child: Text(option),
                                        ))
                                    .toList();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms)
            .slideY(begin: 0.1, end: 0, duration: 400.ms, curve: Curves.easeOut)
            .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.3)),
      ),
    );
  }
}
