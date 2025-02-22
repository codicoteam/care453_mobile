import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/features/assessment_management/controller/assessment_controller.dart';
import 'package:care453/widgets/cards/assessment_card.dart';
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
import 'answer_assessment_dialog.dart';

class AllAssessmentScreen extends StatefulWidget {
  const AllAssessmentScreen({super.key});
  @override
  State<AllAssessmentScreen> createState() => _AllAssessmentScreenState();
}

class _AllAssessmentScreenState extends State<AllAssessmentScreen>
    with SingleTickerProviderStateMixin {
  final assessmemtController = Get.find<AssessmentController>();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  final List<String> _requestStatus = ['All', 'Not Answered', 'Answered'];

  String _selectedStatus = 'All';
  final String _searchQuery = '';
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _requestStatus.length, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
            final user = Provider.of<UserProvider>(context, listen: false)
          .user; // Use listen: false
      assessmemtController
          .getAllAllAssessmentForEmployee("${user?.id}");
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
              'Assessments',
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
          if (assessmemtController.isLoading.value) {
            return const VehicleLoader();
          }
          if (assessmemtController.errorMessage.isNotEmpty) {
            return ApiFailureWidget(onRetry: () {
                          final user = Provider.of<UserProvider>(context, listen: false)
          .user; // Use listen: false
              assessmemtController.errorMessage.value = "";
              assessmemtController
                  .getAllAllAssessmentForEmployee("${user?.id}");
            });
          }
          final filteredAssessments =
              assessmemtController.assessments.where((assessment) {
            if (_selectedStatus == 'Not Answered') {
              return assessment.answer == "N/A";
            } else if (_selectedStatus == 'Answered') {
              return assessment.answer != "N/A";
            }
            return true; // For "All", include all assessments
          }).toList();
                         final user = Provider.of<UserProvider>(context, listen: false)
          .user; 
          return filteredAssessments.isEmpty
              ? const EmptyStateWidget(
                  icon: LocalImageConstants.notFoundIcon,
                  title: 'No Requests Found',
                  description:
                      'There are no requests matching your search or category.',
                )
              : RefreshIndicator(
                  color: Pallete.originBlue,
                  onRefresh: () => assessmemtController
                      .refreshSsessments("${user?.id}"),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredAssessments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final assessment = filteredAssessments[index];
                      return AssessmentCard(
                        assessmentModel: assessment,
                        onTap: () {
                          Get.dialog(
                              AnswerAssessmentDialog(
                                assessmentModel: assessment,
                              ),
                              barrierDismissible: false);
                        },
                        IndexValue:
                            '${index + 1}', // Set IndexValue as the 1-based index
                      );
                    },
                  ),
                );
        }),
      ),
    );
  }
}
