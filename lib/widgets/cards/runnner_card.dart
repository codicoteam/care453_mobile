import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/runner_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unicons/unicons.dart';

import '../../features/map_management/screens/visits_on_map_runner.dart';

class RunnnerCard extends StatefulWidget {
  final RunnerModel runnerModel;
  final VoidCallback? onTap;

  const RunnnerCard({super.key, required this.runnerModel, this.onTap});

  @override
  State<RunnnerCard> createState() => _RunnnerCardState();
}

class _RunnnerCardState extends State<RunnnerCard> {
  @override
  Widget build(BuildContext context) {
    final request = widget.runnerModel;
    final employee = request.employeeId;
    final clientId = request.visits;

    // Determine status color
    Color getStatusColor() {
      switch (widget.runnerModel.dateAssigned) {
        case 'Completed':
          return Colors.green;
        case 'Ongoing':
          return Colors.orange;
        case 'Scheduled':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    // Format date and time
    String formatDateTime() {
      try {
        final parsedDate = DateTime.parse(widget.runnerModel.dateAssigned);
        final dateFormat = DateFormat('EEE, MMM d, yyyy');
        return dateFormat.format(parsedDate);
      } catch (e) {
        return 'Invalid date';
      }
    }

    List<String> getMenuOptions() {
      switch (widget.runnerModel.status) {
        case 'Scheduled':
          return ['View', 'Reschedule'];
        case 'Ongoing':
          return ['View'];
        case 'Completed':
          return ['View', 'Report'];
        default:
          return [];
      }
    }

    LatLng? deliveryPoint;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: Material(
          elevation: 9,
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.circular(35),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
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
                      child: Icon(Icons.location_on,
                          size: 160,
                          color: Pallete.primaryColor.withOpacity(0.5)),
                    ),
                  ),

                  // Card Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatDateTime(),
                                    style: TextStyle(
                                        color: Pallete.blackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${widget.runnerModel.name}',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  ReadMoreText(
                                    widget.runnerModel.description ??
                                        'No description available',
                                    trimLines: 2,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
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
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    height: 50,
                                    width: (widget.runnerModel.visits.length > 3
                                            ? 3
                                            : widget
                                                .runnerModel.visits.length) *
                                        35.0,
                                    child: Stack(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                (widget.runnerModel.visits
                                                            .length >
                                                        3
                                                    ? 3
                                                    : widget.runnerModel.visits
                                                        .length);
                                            i++)
                                          Positioned(
                                            right: i * 8.0,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Pallete.originBlue,
                                              radius: 25,
                                              child: ClipOval(
                                                child: Image.network(
                                                  widget
                                                      .runnerModel
                                                      .visits[i]
                                                      .clientId!
                                                      .profilePicture!,
                                                  fit: BoxFit.cover,
                                                  width: 50,
                                                  height: 50,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
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
                                                  },
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Icon(
                                                    Icons.error,
                                                    size: 50,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: getStatusColor().withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    widget.runnerModel.status ?? 'Unknown',
                                    style: TextStyle(
                                      color: getStatusColor(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(delay: 200.ms, duration: 500.ms)
                                .slideX(begin: -0.1, end: 0),
                          ],
                        ),

                        const SizedBox(height: 10),
                        SizedBox(
                          height: 2,
                          width: double.infinity,
                          child: Divider(color: Pallete.originBlue),
                        ),
                        const SizedBox(height: 10),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Location Info
                            Expanded(
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Number of Visits: ",
                                          style: TextStyle(
                                            color:
                                                Pallete.lightPrimaryTextColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${widget.runnerModel.visits.length}",
                                          style: TextStyle(
                                            color: Pallete.blackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(VisitsOnMapRunner(
                                  runnerModel: widget.runnerModel,
                                  onLocationPicked: (latitude, longitude) {
                                    setState(() {
                                      deliveryPoint =
                                          LatLng(latitude, longitude);
                                    });
                                  },
                                ));
                              },
                              child: Container(
                                width: 50, // Diameter = 2 * radius
                                height: 50, // Diameter = 2 * radius
                                decoration: BoxDecoration(
                                  color: Pallete.originBlue,
                                  shape: BoxShape
                                      .circle, // Makes the container circular
                                ),
                                child: Center(
                                    child: Image.asset(
                                  LocalImageConstants
                                      .uprightArrow, // Replace with the path to your image asset
                                  width: 24, // Set the desired width
                                  height: 24, // Set the desired height
                                  color: Colors
                                      .white, // Optional: Apply a color filter
                                )),
                              ),
                            )
                            // Status Indicator
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
