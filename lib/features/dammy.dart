// import 'package:care453/core/utils/asset_utils/image_util.dart';
// import 'package:care453/core/utils/colors/pallete.dart';
// import 'package:care453/features/visits_management/screens/tabs/task/task_assigned_screens.dart';
// import 'package:care453/models/visit_model.dart';
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shimmer/shimmer.dart';

// import 'tabs/medication/medication_assigned_screen.dart';
// import 'tabs/observation/observation_screens.dart';
// import 'visits_management/screens/tabs/observation/observation_screens.dart';

// class DetailVisit extends StatefulWidget {
//   final VisitModel visitModel;
//   const DetailVisit({super.key, required this.visitModel});

//   @override
//   State<DetailVisit> createState() => _DetailVisitState();
// }

// class _DetailVisitState extends State<DetailVisit>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//  @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(
//       length: widget.visitModel.status == "Completed" ? 4 : 2,
//       vsync: this,
//     );
//   }


//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Pallete.whiteColor,
//           ),
//         ),
//         title: Text(
//           'Visit Details',
//           style: GoogleFonts.poppins(
//             color: Pallete.whiteColor,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.notification_add,
//               color: Pallete.originBlue,
//             ),
//           )
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(320),
//           child: Stack(
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     height: 70,
//                     color: Colors.transparent,
//                   ),
//                   Container(
//                     height: 170,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).scaffoldBackgroundColor,
//                         borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(50))),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
                 
//                   Text(
//                     "750 Lorraine Drive, LA 70663",
//                     style: Theme.of(context)
//                         .textTheme
//                         .labelLarge
//                         ?.copyWith(fontSize: 12),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                     decoration: BoxDecoration(
//                         color: Pallete.success,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text(
//                       widget.visitModel.status!,
//                       style: Theme.of(context)
//                           .textTheme
//                           .labelLarge
//                           ?.copyWith(fontSize: 12, color: Colors.white),
//                     ),
//                   ),
//                   Container(
//                       padding: const EdgeInsets.all(16),
//                       color: Theme.of(context).scaffoldBackgroundColor,
//                       child: TabBar(
//                         labelColor: Pallete.originBlue,
//                         controller: _tabController,
//                         tabAlignment: TabAlignment.start,
//                         indicator: UnderlineTabIndicator(
//                           borderSide: BorderSide(
//                             color: Pallete
//                                 .originBlue, // Set the color for the bottom line
//                             width: 3.0, // Set the thickness of the line
//                           ),
//                           insets: EdgeInsets.symmetric(
//                               horizontal:
//                                   0.0), // Adjust spacing of the indicator
//                         ),
//                         isScrollable: true,
//                            tabs: widget.visitModel.status == "Completed"
//                           ? const [
//                               Tab(text: 'Task Assigned'),
//                               Tab(text: 'Medication'),
//                               Tab(text: 'Observations'),
//                               Tab(text: 'Vitals Recorded'),
//                             ]
//                           : const [
//                               Tab(text: 'Task Assigned'),
//                               Tab(text: 'Medication'),
//                             ],
//                       )),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: widget.visitModel.status == "Completed"
//             ? [
//                 TaskAssignedScreens(
//                   visitId: "${widget.visitModel.id}",
//                 ),
//                 MedicationAssignedScreen(
//                   visitId: "${widget.visitModel.id}",
//                 ),
//                 ObservationScreens(
//                   visitId: "${widget.visitModel.id}",
//                 ),
//                 VitalRecordedTab(),
//               ]
//             : [
//                 TaskAssignedScreens(
//                   visitId: "${widget.visitModel.id}",
//                 ),
//                 MedicationAssignedScreen(
//                   visitId: "${widget.visitModel.id}",
//                 ),
//               ],
//       ),
//     );
//   }
// }

// class TripHistoryTab extends StatelessWidget {
//   const TripHistoryTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Trip History'),
//     );
//   }
// }

// class VehicleRequestsTab extends StatelessWidget {
//   const VehicleRequestsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Vehicle Requests'),
//     );
//   }
// }

// class RatingsTab extends StatelessWidget {
//   const RatingsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Ratings'),
//     );
//   }
// }

// class VehicleClassesTab extends StatelessWidget {
//   const VehicleClassesTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Recorded Vital Signs'),
//     );
//   }
// }
