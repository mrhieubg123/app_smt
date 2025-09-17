import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/pickup_rate_detail_analysis_model.dart';
import '../../../repositories/pickup_rate/pickuprate_repository_impl.dart';

class PickupRateDetailScreen extends StatefulWidget {
  final String machine;
  final String line;
  const PickupRateDetailScreen({
    super.key,
    required this.machine,
    required this.line,
  });

  @override
  State<PickupRateDetailScreen> createState() => _PickupRateDetailScreenState();
}

class _PickupRateDetailScreenState extends State<PickupRateDetailScreen> {
  PickupRateDetailAnalysisModel pickupRateDetailAnalysisModel =
      PickupRateDetailAnalysisModel();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    initData();
    super.initState();
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

  initData() async {
    pickupRateDetailAnalysisModel = await PickupRateRepositoryImpl()
        .getPickupRateDetailAnalysis(
          body: {
            "machine":widget.line.replaceAll("BN3_", "") ,
            "line": widget.machine,
          },
        );
    setState(() {});
  }

  Widget titleWidget(value) {
    return Text(
      value,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget valueWidget(value) {
    return Text(
      value.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1d22),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 64.h, color: Colors.white),
        ),
        title: Text(
          "Pickup rate detail",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(8.w, kToolbarHeight + 100.h, 8.w, 0),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/background.jpg'),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 0,
            columns: [
              DataColumn(label: titleWidget('Line')),
              DataColumn(label: titleWidget('Machine')),
              DataColumn(label: titleWidget('Mo')),
              DataColumn(label: titleWidget('Slot')),
              DataColumn(label: titleWidget('Feeder sn')),
              DataColumn(label: titleWidget('Part name')),
              DataColumn(label: titleWidget('Total Qty')),
              DataColumn(label: titleWidget('Fail Qty')),
              DataColumn(label: titleWidget('Lost Rate')),
            ],
            rows: [
              ...(pickupRateDetailAnalysisModel.data ?? []).map((e) {
                return DataRow(
                  cells: [
                    DataCell(valueWidget(e.lINENAME)),
                    DataCell(valueWidget(e.mACHINE)),
                    DataCell(valueWidget(e.mO)),
                    DataCell(valueWidget(e.sLOTNO)),
                    DataCell(valueWidget(e.fEEDERSN)),
                    DataCell(valueWidget(e.pARTNAME)),
                    DataCell(valueWidget(e.tOTALQTY)),
                    DataCell(valueWidget(e.fAILQTY)),
                    DataCell(valueWidget("${e.pickupRate}%")),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
