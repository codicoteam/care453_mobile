import 'package:care453/core/utils/colors/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPieChartCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<DashboardDataItem> data;
  final VoidCallback? onTap;

  const DashboardPieChartCard({
    super.key,
    required this.title,
    required this.icon,
    required this.data,
    this.onTap,
  });

  @override
  State<DashboardPieChartCard> createState() => _DashboardPieChartCardState();
}

class _DashboardPieChartCardState extends State<DashboardPieChartCard> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    // Calculate total
    final total = widget.data.fold(0, (sum, item) => sum + item.value);

    return Animate(
      effects: [
        FadeEffect(duration: 600.ms, curve: Curves.easeOutQuad),
        SlideEffect(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
          duration: 600.ms,
        ),
      ],
      child: Container(
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  _buildHeader(context),

                  const SizedBox(height: 20),

                  // Pie Chart
                  _buildPieChart(total),

                  const SizedBox(height: 30),

                  // Status Legend
                  _buildLegend(context, total),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Pallete.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                color: Pallete.primaryColor,
                size: 20,
              ),
            ).animate().scale(
              duration: 500.ms,
              curve: Curves.elasticOut,
            ),
            const SizedBox(width: 12),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const Icon(
          Icons.more_vert_rounded,
          color: Colors.grey,
          size: 24,
        ),
      ],
    );
  }

  Widget _buildPieChart(int total) {
    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions) {
                      touchedIndex = pieTouchResponse
                          ?.touchedSection?.touchedSectionIndex;
                    }
                  });
                },
              ),
              centerSpaceRadius: 40,
              sections: _generatePieChartSections(total),
            ),
          ).animate().shimmer(
            duration: 2000.ms,
            color: Colors.white.withOpacity(0.3),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                total.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Pallete.primaryColor,
                ),
              ),
            ],
          ).animate().scale(
            duration: 500.ms,
            curve: Curves.elasticOut,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _generatePieChartSections(int total) {
    return widget.data.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final isTouched = touchedIndex == index;
      final radius = isTouched ? 70.0 : 50.0;

      return PieChartSectionData(
        color: item.color,
        value: item.value.toDouble(),
        title: isTouched ? '${item.value}' : '',
        radius: radius,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Widget _buildLegend(BuildContext context, int total) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: widget.data.map((item) {
        final percentage = (item.value / total * 100).toStringAsFixed(1);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: item.color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: item.color.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${item.label} ($percentage%)',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        )
            .animate(delay: 300.ms)
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.1, end: 0);
      }).toList(),
    );
  }
}

class DashboardDataItem {
  final String label;
  final Color color;
  final int value;

  const DashboardDataItem({
    required this.label,
    required this.color,
    required this.value,
  });
}