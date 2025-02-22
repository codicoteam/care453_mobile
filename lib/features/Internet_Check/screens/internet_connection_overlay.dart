import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/connectivity_controller.dart';

class InternetConnectionOverlay extends StatelessWidget {
  final Widget child;

  const InternetConnectionOverlay({super.key, required this.child});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Obx(() {
          final connectivityController = Get.find<ConnectivityController>();
          return connectivityController.isConnected.value
              ? const SizedBox.shrink()
              : AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.redAccent.shade700,
                  Colors.red.shade600,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              bottom: 15,
              left: 20,
              right: 20,
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Lottie animation (optional, requires lottie package)
                  // Lottie.asset(
                  //   'assets/no_internet_animation.json', // You'll need to add this
                  //   width: 50,
                  //   height: 50,
                  //   fit: BoxFit.contain,
                  // ),

                  SvgPicture.asset(
                    LocalImageConstants.notFoundIcon,
                    width: 50,
                    height: 50,
                  ),

                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Connection Lost',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Please check your internet connection',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      // // Optional: Add a method to manually retry connection
                      // Get.find<ConnectivityController>().checkConnectivity();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}