import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/cards/user_card.dart';
import 'package:care453/widgets/customer_animation/fade_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../models/group_users_models.dart';

class GroupDetailDialog extends StatefulWidget {
  final List<GroupUser> users;
  const GroupDetailDialog({super.key, required this.users});
  @override
  State<GroupDetailDialog> createState() => _GroupDetailDialogState();
}

class _GroupDetailDialogState extends State<GroupDetailDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dialog Title
              Row(
                children: [
                  FadeInAnimation(
                    delay: 2.0,
                    child: Image.asset(
                      LocalImageConstants.groupChat,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FadeInAnimation(
                    delay: 2.0,
                    child: Text(
                      'Chat Members',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Pallete.originBlue,
                              ),
                    ),
                  ),
                ],
              ).animate().fadeIn(duration: 300.ms),
              const SizedBox(height: 16),
              SizedBox(
                height: 260.0, // Adjust as needed
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: widget.users.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final user = widget.users[index];
                    return UserCard(groupUser: user);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
