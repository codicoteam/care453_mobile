import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/features/visits_management/controller/visit_controller.dart';
import 'package:care453/widgets/dashboards_widget/dashboard_line_chart.dart';
import 'package:care453/widgets/empty_widget/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/colors/pallete.dart';
import '../../../widgets/cards/payments_widget.dart';
import '../../../widgets/cards/visit_card_for_employee.dart';
import '../../../widgets/error_widgets/error_widget.dart';
import '../../../widgets/loaders/loader_widget.dart';
import '../../visits_management/screens/detail_visit_for_employee.dart';
import 'package:intl/intl.dart';

class EmployeePaymentMainScreen extends StatefulWidget {
  const EmployeePaymentMainScreen({super.key});
  @override
  State<EmployeePaymentMainScreen> createState() =>
      _EmployeePaymentMainScreenState();
}

class _EmployeePaymentMainScreenState extends State<EmployeePaymentMainScreen>
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

  List<String> getMenuOptions() {
    final now = DateTime.now();
    final List<String> options = [];

    for (int i = 0; i < 10; i++) {
      final pastMonth = DateTime(now.year, now.month - i, 1);
      options.add(DateFormat("MMMM yyyy").format(pastMonth));
    }

    return options;
  }

  String startDate = '';
  String endDate = '';
  @override
  void initState() {
    super.initState();

    // Calculate start and end dates for the current month
    final now = DateTime.now();
    startDate =
        DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, 1));
    endDate =
        DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month + 1, 0));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      visitController.getAllVisitsForEmployeeAndDateFilter(
        employeeId: '67689853376e63cab46a0f44',
        startDate: startDate,
        endDate: endDate,
      );
    });
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
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Pallete.whiteColor,
              ),
            ),
            title: Text(
              'My Income',
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
            actions: [
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  size: 24,
                  color: Colors.white,
                ),
                onSelected: (value) {
                  // Parse the selected month and year
                  final DateTime selectedDate =
                      DateFormat("MMMM yyyy").parse(value);

                  // Get the first and last days of the selected month
                  final firstDay =
                      DateTime(selectedDate.year, selectedDate.month, 1);
                  final lastDay =
                      DateTime(selectedDate.year, selectedDate.month + 1, 0);

                  print('Selected value: $value');
                  print(
                      'First date of that month: ${DateFormat('yyyy-MM-dd').format(firstDay)}');
                  print(
                      'Last date of that month: ${DateFormat('yyyy-MM-dd').format(lastDay)}');
                  visitController.refreshEmployeeVisitsAndDateFilter(
                      employeeId: '67689853376e63cab46a0f44',
                      startDate: '${DateFormat('yyyy-MM-dd').format(firstDay)}',
                      endDate: '${DateFormat('yyyy-MM-dd').format(lastDay)}');
                },
                itemBuilder: (context) {
                  return getMenuOptions()
                      .map((option) => PopupMenuItem<String>(
                            value: option,
                            child: Text(option),
                          ))
                      .toList();
                },
              ),
            ],
          ),
        ],
        body: Obx(() {
          if (visitController.isLoading.value) {
            return const VehicleLoader();
          }

          if (visitController.errorMessage.isNotEmpty) {
            return ApiFailureWidget(onRetry: () {
              visitController.errorMessage.value = "";
              visitController.getAllVisitsForEmployeeAndDateFilter(
                employeeId: '67689853376e63cab46a0f44',
                startDate: startDate,
                endDate: endDate,
              );
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

          final completedTrips = filteredTrips
              .where((trip) => trip.status == "Completed")
              .toList();

// Calculate totalNumberOfCompletedVisits
          final totalNumberOfCompletedVisits = completedTrips.length;

// Calculate totaNumberOfCompletedHours
          final totaNumberOfCompletedHours =
              completedTrips.fold<double>(0, (total, trip) {
            final startTime = DateTime.parse(trip.startTime!);
            final endTime = DateTime.parse(trip.endTime!);
            final hours = endTime.difference(startTime).inHours.toDouble();
            return total + hours;
          });

// Calculate totalNumberOfAllHours
          final totalNumberOfAllHours =
              filteredTrips.fold<double>(0, (total, trip) {
            final startTime = DateTime.parse(trip.startTime!);
            final endTime = DateTime.parse(trip.endTime!);
            final hours = endTime.difference(startTime).inHours.toDouble();
            return total + hours;
          });

// Calculate totalMoneyOnCompletedVisits
          final totalMoneyOnCompletedVisits =
              completedTrips.fold<double>(0, (total, trip) {
            final startTime = DateTime.parse(trip.startTime!);
            final endTime = DateTime.parse(trip.endTime!);
            final hours = endTime.difference(startTime).inHours.toDouble();
            return total +
                (hours * double.parse(trip.amountPaidPerHour ?? '0.0'));
          });

// Calculate totalMoneyOnAllVisits
          final totalMoneyOnAllVisits =
              filteredTrips.fold<double>(0, (total, trip) {
            final startTime = DateTime.parse(trip.startTime!);
            final endTime = DateTime.parse(trip.endTime!);
            final hours = endTime.difference(startTime).inHours.toDouble();
            return total +
                (hours * double.parse(trip.amountPaidPerHour ?? '0.0'));
          });

          return filteredTrips.isEmpty
              ? const EmptyStateWidget(
                  icon: LocalImageConstants.notFoundIcon,
                  title: 'No Requests Found',
                  description:
                      'There are no requests matching your search or category.',
                )
              : RefreshIndicator(
                  color: Pallete.originBlue,
                  onRefresh: () =>
                      visitController.refreshEmployeeVisitsAndDateFilter(
                    employeeId: '67689853376e63cab46a0f44',
                    startDate: startDate,
                    endDate: endDate,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DashboardPieChartCard(
                            title: 'Visits Recorded',
                            icon: FontAwesomeIcons.clock,
                            data: [
                              DashboardDataItem(
                                label: 'Completed',
                                color: Colors.green,
                                value: filteredTrips
                                    .where((trip) => trip.status == "Completed")
                                    .length,
                              ),
                              DashboardDataItem(
                                label: 'Ongoing',
                                color: Colors.red,
                                value: filteredTrips
                                    .where((trip) => trip.status == "Ongoing")
                                    .length,
                              ),
                              DashboardDataItem(
                                label: 'Scheduled',
                                color: Colors.amber,
                                value: filteredTrips
                                    .where((trip) => trip.status == "Scheduled")
                                    .length,
                              ),
                              DashboardDataItem(
                                label: 'Confirmed',
                                color: Colors.indigo,
                                value: filteredTrips
                                    .where((trip) => trip.status == "Confirmed")
                                    .length,
                              ),
                            ],
                            expectedTotal: "$totalMoneyOnAllVisits",
                          )
                              .animate()
                              .fadeIn(duration: 600.ms)
                              .slideX(begin: 0.1),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Income Breakdown',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Pallete.originBlue,
                                    ),
                              ),
                            ],
                          ).animate().fadeIn(duration: 300.ms),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: PaymentsWidget(
                            totalNumberOfVisits: "${filteredTrips.length}",
                            totalNumberOfCompletedVisits:
                                "$totalNumberOfCompletedVisits",
                            totaNumberOfCompletedHours:
                                "$totaNumberOfCompletedHours",
                            totalNumberOfAllHours: "$totalNumberOfAllHours",
                            totalMoneyOnCompletedVisits:
                                "$totalMoneyOnCompletedVisits",
                            totalMoneyOnAllVisits: "$totalMoneyOnAllVisits",
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Visits In the Months',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Pallete.originBlue,
                                    ),
                              ),
                            ],
                          ).animate().fadeIn(duration: 300.ms),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            children: filteredTrips.map((patientVitalsModel) {
                              return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: VisitCardForEmployee(
                                    visitModel: patientVitalsModel,
                                    onTap: () {
                                      Get.to(DetailVisitForEmployee(
                                        visitModel: patientVitalsModel,
                                      ));
                                      // Get.toNamed(RoutesHelper.clientShuttleDetailsScreen, arguments: shuttle);
                                    },
                                  ));
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
