import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/controller/posts_controller.dart';
import 'package:volunteer/model/posts_model.dart';

class description extends StatefulWidget {
  description({
    required this.post,
    this.path,
    Key? key,
  }) : super(key: key);
  final String? path;
  final PostsModel post;
  @override
  State<description> createState() => _descriptionState();
}


class _descriptionState extends State<description> {
  var controller = Get.find<PostsController>();

  @override
  void initState() {
    widget.path != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 10.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'الوصف',
              style: GoogleFonts.cairo(
                  color: Color(0xFF004AAD),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 310.w,
              height: 240.h,
              child: Text(
                widget.post.description,
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
