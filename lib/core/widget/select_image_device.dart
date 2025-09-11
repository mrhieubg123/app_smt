import 'dart:io';

import 'package:app_smt/core/function/dio_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../function/function.dart';

class SelectImageDeviceWidget extends StatefulWidget {
  final String idError;
  const SelectImageDeviceWidget({super.key, required this.idError});

  @override
  State<SelectImageDeviceWidget> createState() =>
      _SelectImageDeviceWidgetState();
}

class _SelectImageDeviceWidgetState extends State<SelectImageDeviceWidget> {
  XFile? fileImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        XFile? result = await FunctionExp().selectImageFromDevice();
        if (result == null) return;
        final resultUpload = await DioFunction().uploadImage(
          idError: widget.idError,
          srcImage: result.path,
        );
        if (resultUpload != true) return;
        setState(() {
          fileImage = result;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.only(top: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.blueAccent),
              color: Colors.white,
            ),
            child: Text(
              "+ Ảnh nguyên nhân",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          if (fileImage != null)
            Container(
              height: 400.h,
              margin: EdgeInsets.only(top: 16.h),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Image.file(File(fileImage!.path)),
            ),
        ],
      ),
    );
  }
}
