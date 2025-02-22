import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/features/visits_management/controller/visit_controller.dart';
import 'package:care453/widgets/cards/visit_card_for_employee.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/colors/pallete.dart';
import '../../../providers/user_provider_class.dart';
import '../../../widgets/error_widgets/error_widget.dart';
import '../../../widgets/loaders/loader_widget.dart';
import 'detail_visit_for_employee.dart';
class ViewAllVisitsForEmployee extends StatefulWidget {
  const ViewAllVisitsForEmployee({super.key});
  @override
  State<ViewAllVisitsForEmployee> createState() =>
      _ViewAllVisitsForEmployeeState();
}
class _ViewAllVisitsForEmployeeState extends State<ViewAllVisitsForEmployee>
    with SingleTickerProviderStateMixin {
  final visitController = Get.find<VisitController>();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  final List<String> _requestStatus = [
    'All',
    'Scheduled',
    'Confirmed',
    'Ongoing',
    'Completed',
  ];
  String _selectedStatus = 'All';
  final String _searchQuery = '';
  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false).user;
    _tabController = TabController(length: _requestStatus.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      visitController.getAllVisitsForEmployee(employeeid: '${user?.id}');
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
              'All Visits',
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
          if (visitController.isLoading.value) {
            return const VehicleLoader();
          }

          if (visitController.errorMessage.isNotEmpty) {
            final user = Provider.of<UserProvider>(context, listen: false).user;

            return ApiFailureWidget(onRetry: () {
              visitController.errorMessage.value = "";
              visitController.getAllVisitsForEmployee(
                  employeeid: '${user?.id}');
            });
          }

          final filteredTrips = visitController.visits.where((employeeModel) {
            final categoryMatch = _selectedStatus == 'All' ||
                (employeeModel.status ?? '').toLowerCase() ==
                    _selectedStatus.toLowerCase();

            final searchMatch = _searchQuery.isEmpty ||
                (employeeModel.careProfessionalId!.firstName ?? '')
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()) ||
                (employeeModel.careProfessionalId!.lastName ?? '')
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase());

            return categoryMatch && searchMatch;
          }).toList();
          final user = Provider.of<UserProvider>(context, listen: false).user;

          return filteredTrips.isEmpty
              ? const EmptyStateWidget(
                  icon: LocalImageConstants.notFoundIcon,
                  title: 'No Requests Found',
                  description:
                      'There are no requests matching your search or category.',
                )
              : RefreshIndicator(
                  color: Pallete.originBlue,
                  onRefresh: () => visitController.refreshEmployeeVisits(
                      employeeid: '${user?.id}'),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredTrips.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final visit = filteredTrips[index];
                      return VisitCardForEmployee(
                        visitModel: visit,
                        onTap: () {
                          Get.to(DetailVisitForEmployee(
                            visitModel: visit,
                          ));
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
