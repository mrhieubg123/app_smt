import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/model/pickup_rate_status_model.dart';
import '../../../src/screen/machine_status_screen/machine_status_getdata.dart';
import 'widget/machine_status_table_widget.dart';
import 'widget/machine_status_table_landscape_widget.dart';

class PickupRateStatusStatusApp extends StatefulWidget {
  const PickupRateStatusStatusApp({super.key});

  @override
  State<PickupRateStatusStatusApp> createState() =>
      _PickupRateStatusStatusAppState();
}

class _PickupRateStatusStatusAppState extends State<PickupRateStatusStatusApp> {
  DataPickupRateStatusModel? dataPickupRateStatusModel;
  List<String> listLine = [];
  List<String> listLocation = [];
  Timer? _timer;
  List<int> countStatus = [0, 0, 0, 0];
  List<double> specStatus = [99.8, 99.7];
  @override
  void initState() {
    startPollingData();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    _timer?.cancel();
    // 🔒 Khoá hướng dọc
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  Future initData() async {
    dataPickupRateStatusModel = await MachineStatusGetData()
        .getPickupRateStatus();
    if (dataPickupRateStatusModel?.data != null) {
      listLine = MachineStatusGetData().getUniqueSortedLinesPickupRate(
        dataPickupRateStatusModel!.data!,
      );
      listLocation = [
        "BN3_H1",
        "BN3_H2",
        "BN3_H3",
        "BN3_H4",
        "BN3_H5",
        "BN3_H6",
        "BN3_G1",
        "BN3_G2",
      ];
    }
    initCountStatus();
    setState(() {});
  }

  initCountStatus() {
    countStatus = [0,0,0,0];
    for (PickupRateStatusModel item
        in (dataPickupRateStatusModel?.data ?? [])) {
      final map = item.toJson(); // chuyển model thành Map
      for (var value in map.values) {
        if (value.toString().contains("_") ) continue;
        if (value == null) {
          countStatus[3]++;
        } else if (value >= specStatus[0]) {
          countStatus[0]++;
        } else if (value >= specStatus[1]&&value < specStatus[0]) {
          countStatus[1]++;
        } else {
          countStatus[2]++;
        }
      }
    }
  }

  startPollingData() async {
    await initData();
    debugPrint("🕒 Gọi data lần đầu:");
    // Đặt hẹn giờ gọi lại mỗi 5 phút
    _timer = Timer.periodic(Duration(seconds: 20), (Timer t) async {
      await initData();
      debugPrint("🕒 Cập nhật mỗi 5 phút:");
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        // return _buildPortrait();
        // return _buildLandscape();
        if (orientation == Orientation.portrait) {
          return _buildPortrait();
        } else {
          return _buildLandscape();
        }
      },
    );
  }

  _buildPortrait() {
    return Scaffold(
      backgroundColor: const Color(0xff1d1d22),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 64.h, color: Colors.white),
        ),
        title: Text(
          "Pickup Rate Status",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight + 100.h),
            buildStatusStatsWidget(),
            Flexible(
              child: PickupRateStatusTable(
                lineNames: listLine,
                columnNames: listLocation,
                machines: dataPickupRateStatusModel?.data ?? [],
              ),
            ),
            // InkWell(
            //   onTap: () => goToErrorTableScreen(context),
            //   child: Stack(
            //     alignment: Alignment.topRight,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            //         padding: EdgeInsets.symmetric(
            //           vertical: 24.h,
            //           horizontal: 32.w,
            //         ),
            //         decoration: BoxDecoration(
            //           color: Colors.blueAccent,
            //           borderRadius: BorderRadius.circular(32.r),
            //         ),
            //         child: Text(
            //           "Confirm",
            //           style: TextStyle(color: Colors.white, fontSize: 48.sp),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _buildLandscape() {
    return Scaffold(
      backgroundColor: const Color(0xff1d1d22),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 64.h, color: Colors.white),
        ),
        actions: [
          buildStatusStatsLandscapeWidget(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight + 100.h),
            Flexible(
              child: PickupRateStatusTableLandscapeWidget(
                lineNames: listLine,
                columnNames: listLocation,
                machines: dataPickupRateStatusModel?.data ?? [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildStatusStatsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: 1.sw / 4 - 88.w,
                  width: 1.sw / 4 - 88.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFA8E063), // xanh lá nhạt
                        Color(0xFF56AB2F), // xanh lá đậm
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      countStatus[0].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  "≥99.8",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: 1.sw / 4 - 88.w,
                  width: 1.sw / 4 - 88.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFD200), // vàng tươi
                        Color(0xFFF7971E), // cam đậm
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      countStatus[1].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  "≥99.7",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: 1.sw / 4 - 88.w,
                  width: 1.sw / 4 - 88.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF5F6D), // đỏ dâu
                        Color(0xFF920E19), // cam sáng
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      countStatus[2].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  "<99.7",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: 1.sw / 4 - 88.w,
                  width: 1.sw / 4 - 88.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFBDC3C7), // xám bạc
                        Color(0xFF2C3E50), // xám than
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      countStatus[3].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
                  "N/A",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildStatusStatsLandscapeWidget() {
    return Row(
      children: [
        buildLight(
          colors: [
            Color(0xFFA8E063), // xanh lá nhạt
            Color(0xFF56AB2F), // xanh lá đậm
          ],
          count: countStatus[0],
        ),
        Text(
          " ≥99.8   ",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
        buildLight(
          colors: [
            Color(0xFFFFD200), // vàng tươi
            Color(0xFFF7971E), // cam đậm
          ],
          count: countStatus[1],
        ),
        Text(
          " ≥99.7   ",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
        buildLight(
          colors: [
            Color(0xFFFF5F6D), // đỏ dâu
            Color(0xFF920E19), // cam sáng
          ],
          count: countStatus[2],
        ),
        Text(
          " <99.7   ",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
        buildLight(
          colors: [
            Color(0xFFBDC3C7), // xám bạc
            Color(0xFF2C3E50), // xám than
          ],
          count: countStatus[3],
        ),
        Text(
          " N/A   ",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
      ],
    );
  }

  Widget buildLight({colors, count}) {
    return Container(
      height: 108.h,
      width: 108.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: colors),
      ),
      child: Center(
        child: Text(count.toString(), style: TextStyle(color: Colors.white)),
      ),
    );
  }

  goToErrorTableScreen(context) async {
    // if (listErrorNotConfirmModel?.data == null ||
    //     listErrorNotConfirmModel!.data!.isEmpty) {
    //   showDialogMessage(message: "Không có lỗi nào cần xác nhận");
    //   return;
    // }
    // if (listErrorNotConfirmModel != null) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => ErrorStableScreen(
    //         listErrorNotConfirmModel: listErrorNotConfirmModel!,
    //       ),
    //     ),
    //   ).then((v) {
    //     initData();
    //   });
    // }
  }
}
