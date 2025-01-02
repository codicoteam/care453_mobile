import 'package:care453/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:unicons/unicons.dart';

import '../../core/utils/colors/pallete.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel employeeModel;
  final VoidCallback? onTap;
  const EmployeeCard({super.key, required this.employeeModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Pallete.originBlue,
              radius: 30,
              child: ClipOval(
                child: Image.network(
                  employeeModel.profilePicture!,
                  fit: BoxFit.cover,
                  width:
                      60, // Match the diameter of the CircleAvatar (2 * radius)
                  height:
                      60, // Match the diameter of the CircleAvatar (2 * radius)
                ),
              ),
            ).animate().fadeIn(duration: 300.ms).slideX(),
            title: Text(
              "${employeeModel.firstName} ${employeeModel.lastName}",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ).animate().fadeIn(duration: 400.ms),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (employeeModel.email ?? '').length > 20
                      ? "${employeeModel.email!.substring(0, 15)}..."
                      : (employeeModel.email ?? ''),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(),
                ).animate().fadeIn(duration: 500.ms),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Pallete.originBlue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        UniconsLine.award,
                        color: Colors.amber,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        'A',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ).animate().fadeIn(duration: 600.ms),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      color: _getStatusColor(employeeModel.employmentType ?? '')
                          .withOpacity(0.2),
                      border: Border.all(
                          color: _getStatusColor(
                              employeeModel.employmentType ?? '')),
                      borderRadius: BorderRadius.circular(10)),
                  width: 80,
                  child: Text(
                    '${employeeModel.employmentType}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            _getStatusColor(employeeModel.employmentType ?? ''),
                        fontWeight: FontWeight.bold),
                  ),
                ).animate().fadeIn(duration: 700.ms),
              ],
            )));
  }

  String _getInitials(String firstName, String lastName) {
    String initials = '';
    if (firstName.isNotEmpty) initials += firstName[0].toUpperCase();
    if (lastName.isNotEmpty) initials += lastName[0].toUpperCase();
    return initials;
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'ongoing':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      case 'available':
        return Colors.orange;
      case 'declined':
        return Colors.teal;
      case 'closed':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
