import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/get_observation_model.dart';
import 'package:intl/intl.dart';

class ObservationCardForClient extends StatelessWidget {
  final GetObservationModel getObservationModel;
  final VoidCallback? onTap;

  const ObservationCardForClient({
    super.key,
    required this.getObservationModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> getMenuOptions() {
      return ['View Profile'];
    }

    // Format date and time
    String formatDateTime() {
      try {
        // Parse the String into a DateTime object
        final parsedDate = DateTime.parse(getObservationModel.date!);
        // Format the DateTime object into the desired format
        final dateFormat = DateFormat('EEE, MMM d, yyyy');
        return dateFormat.format(parsedDate);
      } catch (e) {
        // Handle potential parsing errors
        return 'Invalid date';
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
                      child: Icon(
                        Icons.home,
                        size: 200,
                        color: Pallete.primaryColor.withOpacity(0.5),
                      ),
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
                              "Observation Details",
                              style: GoogleFonts.poppins(
                                color: Pallete.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Date Section
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Pallete.originBlue, size: 14),
                            const SizedBox(width: 8),
                            Text(
                              formatDateTime() ?? 'No date available',
                              style: GoogleFonts.poppins(
                                color: Pallete.originBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Description Section
                        ReadMoreText(
                          getObservationModel.description ??
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

                        const SizedBox(height: 20),

                        // Slidable Image Carousel
                        if (getObservationModel.images != null &&
                            getObservationModel.images!.isNotEmpty)
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              enlargeCenterPage: true,
                              height: 200,
                              viewportFraction: 0.9,
                              aspectRatio: 16 / 9,
                            ),
                            items: getObservationModel.images!.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                  );
                                },
                              );
                            }).toList(),
                          )
                        else
                          Center(
                            child: Text(
                              'No images available',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 400.ms)
              .slideY(
                  begin: 0.1, end: 0, duration: 400.ms, curve: Curves.easeOut)
              .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.3)),
        ),
      ),
    );
  }
}
