import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/error_cause_solution_model.dart';
import '../../../../core/model/pickup_rate_abnormal_handle_model.dart';
import '../../../repositories/pickup_rate/pickuprate_repository_impl.dart';
import 'widget/drop_down_button.dart';
import '../../../data_mau/constants.dart';

class ErrorPickupTableScreen extends StatefulWidget {
  final List<DataAbnormal> listDataAbnormal;
  final List<String> listLine;
  const ErrorPickupTableScreen({
    super.key,
    required this.listDataAbnormal,
    required this.listLine,
  });

  @override
  State<ErrorPickupTableScreen> createState() => _ErrorPickupTableScreenState();
}

class _ErrorPickupTableScreenState extends State<ErrorPickupTableScreen> {
  DataErrorCauseSolutionModel? dataErrorCauseSolutionModel;
  List<DataAbnormal> listDataAbnormalFilter = [];
  String selectedValue = "All";

  @override
  void initState() {
    initData();
    listDataAbnormalFilter = widget.listDataAbnormal;
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

  Widget selectLineWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1), // Viền đen
        borderRadius: BorderRadius.circular(24.r), // Bo góc (tuỳ chọn)
      ),
      child: DropdownButton<String>(
        iconEnabledColor: Colors.white,
        dropdownColor: Colors.blueAccent,
        borderRadius: BorderRadius.circular(24.r),
        style: TextStyle(color: Colors.white, fontSize: 48.sp),
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
            if (newValue == "All") {
              listDataAbnormalFilter = widget.listDataAbnormal;
            } else {
              listDataAbnormalFilter = widget.listDataAbnormal
                  .where(
                    (e) => (e.sTATION ?? "").contains(
                      Constants.lineNameConvert[newValue].toString(),
                    ),
                  )
                  .toList();
            }
          });
        },
        items: ["All", ...widget.listLine].map<DropdownMenuItem<String>>((
          String value,
        ) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
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
              Row(
                children: [
                  Text(
                    "Tổng số lỗi: ${listDataAbnormalFilter.length ?? 0}",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 32.w),
                  selectLineWidget(),
                ],
              ),
              SizedBox(height: 32.h),
              ...List.generate(listDataAbnormalFilter.length ?? 0, (index) {
                return DropDownButton(
                  dataAbnormal: listDataAbnormalFilter[index],
                  dataErrorCauseSolutionModel: dataErrorCauseSolutionModel,
                  onConfirmSuccess: () {
                    setState(() {
                      widget.listDataAbnormal.removeWhere(
                        (e) => e.iD == listDataAbnormalFilter[index].iD,
                      );
                      listDataAbnormalFilter.removeAt(index);
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
