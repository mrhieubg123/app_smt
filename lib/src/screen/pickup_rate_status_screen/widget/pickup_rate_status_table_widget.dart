import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/model/pickup_rate_status_model.dart';
import '../../../../main.dart';
import '../pickup_rate_detail_screen/pickup_rate_detail_screen.dart';

class PickupRateStatusTable extends StatelessWidget {
  PickupRateStatusTable({
    super.key,
    required this.lineNames,
    required this.machines,
    required this.columnNames,
  });

  final dynamic listColor = {
    "RUN": Colors.green,
    "OFFt": Colors.yellow,
    "ERROR": Colors.red,
    "NA": Colors.grey,
  };

  final int numberRows = 7;

  final List<PickupRateStatusModel> machines;

  final List<String> lineNames;

  final List<String> columnNames;

  Widget buildLight({Color? color, double? radius, onTap, double? value}) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(radius: radius, backgroundColor: color),
          Text(
            value == null ? "" : value.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  getMachineFromLineLocation(line, location) {
    try {
      PickupRateStatusModel? result = machines.firstWhereOrNull(
        (e) => (e.lINENAME == line),
      );
      if (result == null) return null;
      return result.toJson()[location];
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  getColorFromLineLocation(line, location) {
    try {
      PickupRateStatusModel? result = machines.firstWhereOrNull(
        (e) => (e.lINENAME == line),
      );
      if (result != null) {
        if (result.toJson()[location] == null) {
          return Colors.grey;
        } else if (result.toJson()[location] >= 99.8) {
          return listColor["RUN"];
        } else if (result.toJson()[location] >= 99.7) {
          return listColor["OFFt"];
        } else {
          return listColor["ERROR"];
        }
        return listColor[result.toJson()[location].toString().split("-")[0]];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return Colors.grey;
  }

  Widget buildColumnName() {
    return Row(
      children: [
        SizedBox(
          width: 90.w,
          child: Text(
            "Line",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(columnNames.length, (index) {
                return Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      columnNames[index].replaceAll("BN3_", ""),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 42.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  buildStatusName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 40.sp),
        ),
        Row(
          children: [
            buildLight(color: Colors.green, radius: 16.r),
            Text(
              " ≥99.8   ",
              style: TextStyle(color: Colors.white, fontSize: 32.sp),
            ),
            buildLight(color: Colors.yellow, radius: 16.r),
            Text(
              " ≥99.7   ",
              style: TextStyle(color: Colors.white, fontSize: 32.sp),
            ),
            buildLight(color: Colors.red, radius: 16.r),
            Text(
              " <99.7   ",
              style: TextStyle(color: Colors.white, fontSize: 32.sp),
            ),
            buildLight(color: Colors.grey, radius: 16.r),
            Text(
              " N/A   ",
              style: TextStyle(color: Colors.white, fontSize: 32.sp),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Color(0xff1b1c54),
        border: Border.all(color: Colors.white, width: 4.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 32.h),
            buildStatusName(),
            SizedBox(height: 32.h),
            buildColumnName(),
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 16.h),
              child: Divider(color: Colors.grey),
            ),
            ...List.generate(lineNames.length, (lineIndex) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          lineNames[lineIndex],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 72.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ...List.generate(
                                    columnNames.length,
                                    (index) => Flexible(
                                      flex: 1,
                                      child: Center(
                                        child: buildLight(
                                          radius: 32.r,
                                          value: getMachineFromLineLocation(
                                            lineNames[lineIndex],
                                            columnNames[index],
                                          ),
                                          onTap: () => goToMachineDetailScreen(
                                            lineNames[lineIndex],
                                            columnNames[index],
                                          ),
                                          color: getColorFromLineLocation(
                                            lineNames[lineIndex],
                                            columnNames[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (lineIndex != lineNames.length - 1)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 16.h,
                      ),
                      child: Divider(color: Colors.grey),
                    ),
                ],
              );
            }),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  goToMachineDetailScreen(machine, line) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            PickupRateDetailScreen(machine: machine, line: line),
      ),
    );
  }
}
