import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widget/dialog.dart';
import '../../../src/screen/machine_status_screen/machine_status_getdata.dart';
import '../../../src/screen/machine_status_screen/widget/machine_status_table_widget.dart';
import '../../../core/model/error_not_confirm_model.dart';
import '../../../core/model/machine_status_model.dart';
import '../error_table_screen/error_table_screen.dart';
import 'widget/machine_status_table_landscape_widget.dart';

class MachineStatusApp extends StatefulWidget {
  const MachineStatusApp({super.key});

  @override
  State<MachineStatusApp> createState() => _MachineStatusAppState();
}

class _MachineStatusAppState extends State<MachineStatusApp> {
  ListMachineSMTStatusModel? listMachineStatusModel;
  ListErrorNotConfirmModel? listErrorNotConfirmModel;
  List<String> listLine = [];
  List<String> listLocation = [];
  Timer? _timer;
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
    listMachineStatusModel = await MachineStatusGetData().getMachineStatus();
    if (listMachineStatusModel?.data != null) {
      listLine = MachineStatusGetData().getUniqueSortedLines(
        listMachineStatusModel!.data!,
      );
      listLocation = [
        "PRINTER",
        "H1",
        "H2",
        "H3",
        "H4",
        "H5",
        "H6",
        "H7",
        "H8",
        "REFLOW",
      ];
    }
    listErrorNotConfirmModel = await MachineStatusGetData().getListConfirm();
    setState(() {});
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
        return _buildPortrait();
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
          "Machine Status",
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
              child: MachineStatusTable(
                lineNames: listLine,
                columnNames: listLocation,
                machines: listMachineStatusModel?.data ?? [],
              ),
            ),
            InkWell(
              onTap: () => goToErrorTableScreen(context),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                    padding: EdgeInsets.symmetric(
                      vertical: 24.h,
                      horizontal: 32.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white, fontSize: 48.sp),
                    ),
                  ),
                  if (listErrorNotConfirmModel?.data != null &&
                      listErrorNotConfirmModel!.data!.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 32.r,
                        backgroundColor: Colors.red,
                        child: Text(
                          (listErrorNotConfirmModel?.data?.length ?? 0)
                              .toString(),
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: Colors.white,
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
        // title: Text(
        //   "Machine Status",
        //   style: TextStyle(
        //     fontSize: 24.sp,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.white,
        //   ),
        // ),
        actions: [
          InkWell(
            onTap: () => goToErrorTableScreen(context),
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.h, 12.w, 0),
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  ),
                ),
                if (listErrorNotConfirmModel?.data != null &&
                    listErrorNotConfirmModel!.data!.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 42.r,
                      backgroundColor: Colors.red,
                      child: Text(
                        (listErrorNotConfirmModel?.data?.length ?? 0)
                            .toString(),
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
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
              child: MachineStatusTableLandscapeWidget(
                lineNames: listLine,
                columnNames: listLocation,
                machines: listMachineStatusModel?.data ?? [],
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
                      getCountStatus("RUN").toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  "RUN",
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
                        Color(0xFFFF5F6D), // đỏ dâu
                        Color(0xFF920E19), // cam sáng
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      getCountStatus("ERROR").toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  "ERROR",
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
                        Color(0xFFFFD200), // vàng tươi
                        Color(0xFFF7971E), // cam đậm
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      getCountStatus("OFF").toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  "STOP",
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
                      getCountStatus(null).toString(),
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
          count: getCountStatus("RUN"),
        ),
        Text(
          " Run   ",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
        buildLight(
          colors: [
            Color(0xFFFFD200), // vàng tươi
            Color(0xFFF7971E), // cam đậm
          ],
          count: getCountStatus("OFF"),
        ),
        Text(
          " Stop   ",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
        buildLight(
          colors: [
            Color(0xFFFF5F6D), // đỏ dâu
            Color(0xFF920E19), // cam sáng
          ],
          count: getCountStatus("ERROR"),
        ),
        Text(
          " Error   ",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
        buildLight(
          colors: [
            Color(0xFFBDC3C7), // xám bạc
            Color(0xFF2C3E50), // xám than
          ],
          count: getCountStatus("NA"),
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

  getCountStatus(status) {
    int t =0;
    for (MachineStatusModel item in (listMachineStatusModel?.data ?? [])) {
      final map = item.toJson(); // chuyển model thành Map
      int count = 0;

      for (var value in map.values) {
        if (value.toString().contains(status.toString())) {
          count++;
        }
      }
      t+=count;
    }
    return t;
  }

  goToErrorTableScreen(context) async {
    if (listErrorNotConfirmModel?.data == null ||
        listErrorNotConfirmModel!.data!.isEmpty) {
      showDialogMessage(message: "Không có lỗi nào cần xác nhận");
      return;
    }
    if (listErrorNotConfirmModel != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ErrorStableScreen(
            listErrorNotConfirmModel: listErrorNotConfirmModel!,
          ),
        ),
      ).then((v) {
        initData();
      });
    }
  }
}
