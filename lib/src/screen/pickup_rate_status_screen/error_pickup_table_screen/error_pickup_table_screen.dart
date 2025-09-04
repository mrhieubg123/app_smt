import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/error_cause_solution_model.dart';
import '../../../../core/model/pickup_rate_abnormal_handle_model.dart';
import '../../../repositories/pickup_rate/pickuprate_repository_impl.dart';
import 'widget/drop_down_button.dart';

class ErrorPickupTableScreen extends StatefulWidget {
  final List<DataAbnormal> listDataAbnormal;
  const ErrorPickupTableScreen({super.key, required this.listDataAbnormal});

  @override
  State<ErrorPickupTableScreen> createState() => _ErrorPickupTableScreenState();
}

class _ErrorPickupTableScreenState extends State<ErrorPickupTableScreen> {
  DataErrorCauseSolutionModel? dataErrorCauseSolutionModel;

  @override
  void initState() {
    initData();
    super.initState();
    // 🔒 Khoá hướng dọc
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Future initData() async {
    dataErrorCauseSolutionModel = await PickupRateRepositoryImpl()
        .getDataErrorCauseSolutionPickup();
    setState(() {});
  }

  @override
  void dispose() {
    // 🔓 Reset lại cho phép xoay mọi hướng (hoặc hướng bạn muốn)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 64.h, color: Colors.white),
        ),
        title: Text(
          "Danh sách lỗi",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kToolbarHeight + 120.h),
              Text(
                "Tổng số lỗi: ${widget.listDataAbnormal.length ?? 0}",
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 32.h),
              ...List.generate(widget.listDataAbnormal.length ?? 0, (index) {
                return DropDownButton(
                  dataAbnormal: widget.listDataAbnormal[index],
                  dataErrorCauseSolutionModel: dataErrorCauseSolutionModel,
                  onConfirmSuccess: () {
                    setState(() {
                      widget.listDataAbnormal.removeAt(index);
                    });
                  },
                  onAddSolution: initData,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
