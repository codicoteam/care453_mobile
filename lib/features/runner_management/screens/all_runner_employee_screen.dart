import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/features/assessment_management/controller/assessment_controller.dart';
import 'package:care453/features/runner_management/screens/all_visits_in_runner.dart';
import 'package:care453/widgets/cards/assessment_card.dart';
import 'package:care453/widgets/custom_text_field.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/colors/pallete.dart';
import '../../../widgets/cards/runnner_card.dart';
import '../../../widgets/error_widgets/error_widget.dart';
import '../../../widgets/loaders/loader_widget.dart';
import '../controller/runner_controller.dart';

class AllRunnerEmployeeScreen extends StatefulWidget {
  const AllRunnerEmployeeScreen({super.key});
  @override
  State<AllRunnerEmployeeScreen> createState() =>
      _AllRunnerEmployeeScreenState();
}

class _AllRunnerEmployeeScreenState extends State<AllRunnerEmployeeScreen>
    with SingleTickerProviderStateMixin {
  final runnerController = Get.find<RunnerController>();
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
      runnerController.getAllAllRunnersForEmployee("6763fbc6d9c0556eaea94214");
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
              'Runners',
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
          if (runnerController.isLoading.value) {
            return const VehicleLoader();
          }
          if (runnerController.errorMessage.isNotEmpty) {
            return ApiFailureWidget(onRetry: () {
              runnerController.errorMessage.value = "";
              runnerController
                  .getAllAllRunnersForEmployee("6763fbc6d9c0556eaea94214");
            });
          }
          final filteredAssessments =
              runnerController.runners.where((runnerModel) {
            if (_selectedStatus == 'Scheduled') {
              return runnerModel.status == "Scheduled";
            } else if (_selectedStatus == 'Ongoing') {
              return runnerModel.status == "Ongoing";
            } else if (_selectedStatus == 'Completed') {
              return runnerModel.status == "Completed";
            }
            return true; // For "All", include all runners
          }).toList();

          return filteredAssessments.isEmpty
              ? const EmptyStateWidget(
                  icon: LocalImageConstants.notFoundIcon,
                  title: 'No Requests Found',
                  description:
                      'There are no requests matching your search or category.',
                )
              : RefreshIndicator(
                  color: Pallete.originBlue,
                  onRefresh: () => runnerController
                      .refreshRunners("6763fbc6d9c0556eaea94214"),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredAssessments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final runnerModel = filteredAssessments[index];
                      return RunnnerCard(
                        runnerModel: runnerModel,
                        onTap: () {
                          Get.to(AllVisitsInRunner(runnerModel: runnerModel));
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
