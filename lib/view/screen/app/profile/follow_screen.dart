import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/controller/categories_controller.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({Key? key}) : super(key: key);

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  final controller = Get.find<CategoriesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Text(
            'أيمن',
            style: GoogleFonts.cairo(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward_ios),
              color: Color(0xFF004AAD),
            ),
          ]),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w, top: 10.h),
                child: Container(
                  child: Text(
                    'متابع',
                    style: GoogleFonts.cairo(
                      fontSize: 32.sp,
                      color: const Color(0xff004aad),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                      height: 1.2058823529411764,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 740.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 3,
                          color: Colors.grey,
                          spreadRadius: 2,
                          offset: Offset(0, 3))
                    ]),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.instituationList.length,
                    padding: EdgeInsets.only(
                        left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsetsDirectional.only(
                            bottom: index == 5 ? 0 : 15),
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black45,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 17.h),
                          child: ListTile(
                            leading: TextButton(
                              onPressed: () {},
                              child: Text(
                                "الغاء المتابعة",
                                style: GoogleFonts.cairo(fontSize: 15.sp),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                            ),
                            title: Container(
                              child: Text(
                                controller.instituationList[index].name,
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            trailing: CircleAvatar(
                                radius: 45.r,
                                backgroundImage:
                                    AssetImage('images/logo_org.jpeg')),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
