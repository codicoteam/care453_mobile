import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/casched_data.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/auth/Handler/auth_handler.dart';
import 'package:care453/models/select_user_enum.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../providers/global/global.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../widgets/general_button.dart';

class InitialRoleSelectionScreen extends StatefulWidget {
  const InitialRoleSelectionScreen({super.key});

  @override
  State<InitialRoleSelectionScreen> createState() =>
      _InitialRoleSelectionScreenState();
}

class _InitialRoleSelectionScreenState
    extends State<InitialRoleSelectionScreen> {
  UserRole? _selectedRole;

  final List<RoleOption> _roles = [
    RoleOption(
      id: UserRole.client,
      title: 'Client',
      icon: FontAwesomeIcons.car,
      description: 'Easily manage and schedule your home care services',
    ),
    RoleOption(
      id: UserRole.careProfessioner,
      title: 'Care Professional',
      icon: FontAwesomeIcons.shieldAlt,
      description: 'Comprehensive tools to provide quality care',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60,
                    child: Image.asset(LocalImageConstants.care453Logo),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: -0.5, end: 0),

                  Text(
                    'Welcome\nTo\nCare 453',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Pallete.originBlue),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: -0.5, end: 0),
                  const SizedBox(height: 40),

                  Text(
                    'Select your role to get started',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: -0.5, end: 0),

                  ...List.generate(_roles.length, (index) {
                    final role = _roles[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRole = role.id;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: _selectedRole == role.id
                                ? Colors.blue.shade50
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _selectedRole == role.id
                                  ? Pallete.originBlue
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                            boxShadow: _selectedRole == role.id
                                ? [
                                    BoxShadow(
                                      color:
                                          Pallete.originBlue.withOpacity(0.2),
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    )
                                  ]
                                : [],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                // Icon
                                Icon(
                                  role.icon,
                                  size: 32,
                                  color: _selectedRole == role.id
                                      ? Pallete.originBlue
                                      : Colors.grey.shade400,
                                ),

                                const SizedBox(width: 16),

                                // Text Content
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        role.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: _selectedRole == role.id
                                              ? Pallete.originBlue
                                              : Colors.grey.shade800,
                                        ),
                                      ),
                                      Text(
                                        role.description,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: _selectedRole == role.id
                                              ? Pallete.originBlue
                                                  .withOpacity(0.8)
                                              : Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Selection Indicator
                                if (_selectedRole == role.id)
                                  Icon(Icons.check_circle,
                                      color: Pallete.originBlue),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 500.ms, delay: 500.ms * index)
                        .slideX(begin: 0.1, end: 0);
                  }),

                  const SizedBox(height: 32),

                  // Continue Button
                  GeneralButton(
                    onTap: () async {
                      if (_selectedRole != null) {
                        await CacheUtils.saveUserRoleToCache(
                                role: _selectedRole.toString().split('.').last)
                            .then((_) {
                          Get.to(AuthHandler());
                        });
                      }
                    },
                    width: MediaQuery.sizeOf(context).width,
                    btnColor: _selectedRole != null
                        ? Pallete.originBlue
                        : Colors.grey.shade400,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms, delay: 1000.ms)
                      .slideY(begin: 0.5, end: 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoleOption {
  final UserRole id;
  final String title;
  final IconData icon;
  final String description;

  RoleOption({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
  });
}
