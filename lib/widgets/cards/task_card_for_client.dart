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

class TaskCardForClient extends StatelessWidget {
  final GetTaskModel getTaskModel;
  final VoidCallback? onTap;

  const TaskCardForClient({super.key, required this.getTaskModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final request = getTaskModel;
    // final employee = request.careProfessionalId;

    // Determine status color
    Color getStatusColor() {
      switch (getTaskModel.status) {
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
    //   return dateFormat.format(getTaskModel.dateOfVisit!);
    // }

    // Get menu options based on status
    List<String> getMenuOptions() {
      switch (getTaskModel.status) {
        case 'Pending':
          return ['View Profile' ];
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
          elevation: 6,
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
                              "Task Details",
                              style: GoogleFonts.poppins(
                                color: Pallete.blackColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: getStatusColor().withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                getTaskModel.status ?? 'Unknown',
                                style: TextStyle(
                                  color: getStatusColor(),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Title:',
                                    style: GoogleFonts.poppins(
                                      color: Pallete.blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '${getTaskModel.name}',
                                      style: GoogleFonts.poppins(
                                        color: Pallete.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Description',
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
                          getTaskModel.description ??
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
                          "Assigned By",
                          style: GoogleFonts.poppins(
                            color: Pallete.blackColor,
                            fontSize: 17,
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
                                                getTaskModel.assignedBy!
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
                                        '${getTaskModel.assignedBy!.firstName} ${getTaskModel.assignedBy!.lastName}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${getTaskModel.assignedBy!.email}',
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
