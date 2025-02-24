import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/features/view_care_professionals/screens/employee_details.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/colors/pallete.dart';
import '../../../widgets/cards/employee_card.dart';
import '../../../widgets/error_widgets/error_widget.dart';
import '../../../widgets/loaders/loader_widget.dart';
import '../controller/view_professional_controller.dart';

class ViewAllEmployeeScreen extends StatefulWidget {
  const ViewAllEmployeeScreen({super.key});

  @override
  State<ViewAllEmployeeScreen> createState() => _ViewAllEmployeeScreenState();
}

class _ViewAllEmployeeScreenState extends State<ViewAllEmployeeScreen>
    with SingleTickerProviderStateMixin {
  final viewEmployeeController = Get.find<ViewProfessionalController>();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  final List<String> _requestStatus = [
    'All',
    'Full Time',
    'Part Time',
  ];

  String _selectedStatus = 'All';
  final String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _requestStatus.length, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewEmployeeController.getAllEmployeeForClient();
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
              'All Care Professionals',
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
                        prefixIcon: Icon(Icons.search, color: Pallete.whiteColor),
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
          if (viewEmployeeController.isLoading.value) {
            return const VehicleLoader();
          }

          if (viewEmployeeController.errorMessage.isNotEmpty) {
            return ApiFailureWidget(onRetry: () {
              viewEmployeeController.errorMessage.value = "";
              viewEmployeeController.getAllEmployeeForClient();
            });
          }

          final filteredTrips =
              viewEmployeeController.shuttles.where((employeeModel) {
            final categoryMatch = _selectedStatus == 'All' ||
                (employeeModel.email ?? '').toLowerCase() ==
                    _selectedStatus.toLowerCase();

            final searchMatch = _searchQuery.isEmpty ||
                (employeeModel.firstName! ?? '')
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()) ||
                (employeeModel.lastName ?? '')
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase());

            return categoryMatch && searchMatch;
          }).toList();

          return filteredTrips.isEmpty
              ? const EmptyStateWidget(
                  icon: LocalImageConstants.notFoundIcon,
                  title: 'No Requests Found',
                  description:
                      'There are no requests matching your search or category.',
                )
              : RefreshIndicator(
                color: Pallete.originBlue,
                  onRefresh: () => viewEmployeeController.refreshTrips(),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredTrips.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final shuttle = filteredTrips[index];
                      return EmployeeCard(
                        employeeModel: shuttle,
                        onTap: () {
                          Get.to(EmployeeProfileScreen(employeeModel: shuttle,));
                          // Get.toNamed(RoutesHelper.clientShuttleDetailsScreen, arguments: shuttle);
                        },
                      );
                    },
                  ),
                );
        }),
      ),
   
    );
  }
}
