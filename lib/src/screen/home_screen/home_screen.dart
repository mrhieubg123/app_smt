import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../machine_status_screen/machine_status_screen.dart';
import '../pickup_rate_status_screen/pickup_rate_status_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1d1d22),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 64.h, color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(36.w, kToolbarHeight + 48.h, 36.w, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: goToMachineStatusScreen,
              child: Container(
                height: 1.sw / 2 - 64.w,
                width: 1.sw / 2 - 64.w,
                decoration: BoxDecoration(
                  color: Color(0xff42424e).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.ballot_outlined, color: Colors.white, size: 300.h),
                    Text(
                      "SMT Machine Status",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: goToPickupRateStatusScreen,
              child: Container(
                height: 1.sw / 2 - 64.w,
                width: 1.sw / 2 - 64.w,
                decoration: BoxDecoration(
                  color: Color(0xff42424e).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.backpack_outlined, color: Colors.white, size: 300.h),
                    Text(
                      "Pickup Rate \nStatus",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), // Hiển thị màn hình dựa trên index
    );
  }

  goToMachineStatusScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (BuildContext context) => MachineStatusApp(),
      ),
    );
  }
  goToPickupRateStatusScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (BuildContext context) => PickupRateStatusStatusApp(),
      ),
    );
  }
}




