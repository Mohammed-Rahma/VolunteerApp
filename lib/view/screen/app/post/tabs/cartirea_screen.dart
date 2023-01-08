import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/model/posts_model.dart';

class criterea extends StatefulWidget {
  const criterea({
    required this.post,
    this.path,
    Key? key,
  }) : super(key: key);
  final String? path ;
  final PostsModel post ;

  @override
  State<criterea> createState() => _critereaState();
}

class _critereaState extends State<criterea> {

  @override
  void initState() {
    widget.path != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55.w,vertical: 10.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'المعايير',
              style: GoogleFonts.cairo(
                  color: Color(0xFF004AAD),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Text(
                widget.post.description ,
                textAlign :TextAlign.right,
                style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500
                ),
              ),
              width: 310.w,
              height: 240.h,
            ),
          ),
        ],
      ),
    );
  }
}
