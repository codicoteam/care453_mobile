import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/features/appointments/screens/add_appointment_dialog.dart';
import 'package:care453/features/appointments/screens/appointment_dialog_details.dart';
import 'package:care453/providers/user_provider_class.dart';
import 'package:care453/widgets/cards/appointment_card.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/colors/pallete.dart';
import '../../../widgets/error_widgets/error_widget.dart';
import '../../../widgets/loaders/loader_widget.dart';
import '../controllers/appointment_controller.dart';

class AllAppointmentForClient extends StatefulWidget {
  const AllAppointmentForClient({super.key});
  @override
  State<AllAppointmentForClient> createState() =>
      _AllAppointmentForClientState();
}

class _AllAppointmentForClientState extends State<AllAppointmentForClient>
    with SingleTickerProviderStateMixin {
  final appointmentController = Get.find<AppointmentController>();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  final List<String> _requestStatus = [
    'All',
    'Scheduled',
    'Ongoing',
    'Completed'
  ];

  String _selectedStatus = 'All';
  final String _searchQuery = '';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _requestStatus.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = Provider.of<UserProvider>(context, listen: false)
          .user; // Use listen: false
      appointmentController.getAllAllAppointmentForEmployee("${user?.id}");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: true,
            backgroundColor: Pallete.originBlue,
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Text(
              'My Appointments',
              style: GoogleFonts.poppins(
                color: Pallete.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(LocalImageConstants.care_giver_two),
                    ),
                  ),
                ),
                Container(
                  color: Pallete.originBlue
                      .withOpacity(0.9), // Semi-transparent blue overlay
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: CustomTextField(
                        labelText: 'Search',
                        prefixIcon:
                            Icon(Icons.search, color: Pallete.whiteColor),
                      )),
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    tabAlignment: TabAlignment.center,
                    unselectedLabelColor: Colors.white70,
                    tabs: _requestStatus
                        .map((category) => Tab(text: category))
                        .toList(),
                    onTap: (index) {
                      setState(() {
                        _selectedStatus = _requestStatus[index];
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notification_add, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
        body: Obx(() {
          if (appointmentController.isLoading.value) {
            return const VehicleLoader();
          }
          if (appointmentController.errorMessage.isNotEmpty) {
            final user = Provider.of<UserProvider>(context, listen: false)
                .user; // Use listen: false
            return ApiFailureWidget(onRetry: () {
              appointmentController.errorMessage.value = "";
              appointmentController
                  .getAllAllAppointmentForEmployee("${user?.id}");
            });
          }
          final filteredAssessments =
              appointmentController.appointments.where((runnerModel) {
            if (_selectedStatus == 'Scheduled') {
              return runnerModel.status == "Scheduled";
            } else if (_selectedStatus == 'Ongoing') {
              return runnerModel.status == "Ongoing";
            } else if (_selectedStatus == 'Completed') {
              return runnerModel.status == "Completed";
            }
            return true; // For "All", include all runners
          }).toList();
          final user =
              Provider.of<UserProvider>(context, listen: false).user; // Use l

          return filteredAssessments.isEmpty
              ? const EmptyStateWidget(
                  icon: LocalImageConstants.notFoundIcon,
                  title: 'No Requests Found',
                  description:
                      'There are no requests matching your search or category.',
                )
              : RefreshIndicator(
                  color: Pallete.originBlue,
                  onRefresh: () => appointmentController
                      .refreshAppointment("${user?.id}"),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredAssessments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final appointmentModel = filteredAssessments[index];
                      return AppointmentCard(
                        appointmentModel: appointmentModel,
                        onTap: () {
                          Get.dialog(AppointmentDialogDetails(
                              appointmentModel: appointmentModel));
                        },
                      );
                    },
                  ),
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.originBlue,
        onPressed: () {
          Get.dialog(AddAppointmentDialog());
          print("Floating Action Button Clicked!");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
