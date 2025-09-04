import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/pickup_rate_analysis_model.dart';
import '../../../repositories/pickup_rate/pickuprate_repository_impl.dart';

class PickupRateAnalysisScreen extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  PickupRateAnalysisScreen({super.key, required this.data});

  @override
  State<PickupRateAnalysisScreen> createState() =>
      _PickupRateAnalysisScreenState();
}

class _PickupRateAnalysisScreenState extends State<PickupRateAnalysisScreen> {
  List<Map<String, dynamic>> sampleData = [
    {'name': 'Abâb', 'value': 10.0},
    {'name': 'Babbb', 'value': 20.0},
    {'name': 'Ccccc', 'value': 30.0},
    {'name': 'Dcccc', 'value': 15.0},
    {'name': 'Ecccc', 'value': 25.0},
    {'name': 'Fvvvv', 'value': 5.0},
    {'name': 'Gvvvv', 'value': 35.0},
    {'name': 'Hhhhh', 'value': 18.0},
    {'name': 'Iiiii', 'value': 28.0},
    {'name': 'Jjjjj', 'value': 12.0},
  ];
  PickupRateAnalysisByDayModel? pickupRateAnalysisByDayModel;

  @override
  void initState() {
    initData();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future initData() async {
    pickupRateAnalysisByDayModel = await PickupRateRepositoryImpl()
        .getDataPickupRateAnalysisByDay();
    final lst = pickupRateAnalysisByDayModel?.dataBySlot ?? [];
    setState(() {
      sampleData = groupByCause(lst);
    });
  }

  List<Map<String, dynamic>> groupByCause(List<DataBySlot> data) {
    final Map<String, Map<String, dynamic>> slotMap = {};

    for (var item in data) {
      final cause =
          "${(item.lM ?? "").replaceAll("ine_", "").replaceAll("-", "")}\n${item.sLOTNO ?? ""}";

      if (slotMap.containsKey(cause)) {
        slotMap[cause]!['value'] += double.parse(
          (item.fAILQTY ?? 0).toString(),
        );
      } else {
        slotMap[cause] = {
          "name": cause,
          "value": double.parse((item.fAILQTY ?? 0).toString()),
        };
      }
    }
    List<Map<String, dynamic>> finalList = slotMap.values.toList();
    finalList.sort((a, b) => (b['value'] as num).compareTo(a['value'] as num));
    return finalList.take(20).toList();
  }

  @override
  void dispose() {
    // 🔒 Khoá hướng dọc
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxValue = sampleData
        .map<double>((e) => e['value'] as double)
        .reduce((a, b) => a > b ? a : b);
    final maxY = (((maxValue * 1.2) / 100).ceil() * 100).toDouble();
    final interval = maxY / 4;
    return Scaffold(
      backgroundColor: Color(0xff1d1d22),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 64.h, color: Colors.white),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(width: 48.w),
          // 👉 Tiêu đề trục Y xoay dọc
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              '   Analysis Error by Slot',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 2.2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 96.h, 16.w, 0),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    maxY: maxY,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        // tooltipBgColor: Colors.grey.shade800,
                        tooltipBorderRadius: BorderRadius.circular(
                          8,
                        ), // Dùng tooltipBorderRadius
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            (rod.toY.round()).toString(),
                            TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            // children: <TextSpan>[
                            //   TextSpan(
                            //     text: (rod.toY.round()).toString(),
                            //     style: TextStyle(
                            //       color: Colors.yellowAccent,
                            //       fontSize: 16.sp,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ],
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: interval,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                          reservedSize: 32.w,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 42.w,
                          getTitlesWidget: (value, meta) {
                            final idx = value.toInt();
                            if (idx < 0 || idx >= sampleData.length) {
                              return SizedBox.shrink();
                            }
                            return Text(
                              sampleData[idx]['name'],
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    barGroups: List.generate(sampleData.length, (index) {
                      final value = sampleData[index]['value'] as double;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: value,
                            width: 24.w,
                            borderRadius: BorderRadius.circular(24.r),
                            gradient: LinearGradient(
                              colors: [Colors.red, Colors.redAccent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ],
                        showingTooltipIndicators: [0],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
