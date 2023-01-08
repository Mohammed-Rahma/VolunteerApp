import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/controller/categories_controller.dart';
import 'package:volunteer/controller/posts_controller.dart';
import 'package:volunteer/model/institute_model.dart';
import 'package:volunteer/model/posts_model.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/app/post/desc_post_screen.dart';

class ProfileOrgScreen extends StatefulWidget {
  ProfileOrgScreen(
      {required this.post, required this.instituation, this.path, Key? key})
      : super(key: key);
  final String? path;
  final Instituation instituation;
  final PostsModel post;
  @override
  State<ProfileOrgScreen> createState() => _ProfileOrgScreenState();
}

class _ProfileOrgScreenState extends State<ProfileOrgScreen> {
  // final controller = Get.find<InstituteController>();

  var likeColor = Colors.white;
  var joinColor = Colors.indigo;
  var joinColor2 = Colors.white;
  String joinText = "انضم الان";
  bool isLike = false;
  bool isJoin = false;
  final controller = Get.find<PostsController>();
  final controlleins = Get.find<CategoriesController>();
  bool click = true;

  @override
  void initState() {
    widget.path != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            centerTitle: true,
            title: Image.asset('images/logo.png', width: 60.w),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_forward_ios),
                color: Color(0xFF004AAD),
              ),
            ]),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            );
          } else {
            return ListView(
              children: [
                Column(
                  children: [
                    //First Part
                    Container(
                      width: double.infinity,
                      height: 130.0,
                      child: Image.network(
                        widget.instituation.imageCover,
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: Colors.blueAccent),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 7,
                              spreadRadius: 0.7,
                              offset: Offset(0, 2),
                            )
                          ]),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    //Second Part
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          //Follow
                          TextButton(
                            onPressed: () {
                              setState(() {
                                click = !click;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  click ? mainColor : Colors.grey),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            child: Text(
                              click ? "متابعة" : 'الغاء المتابعة',
                              style: GoogleFonts.cairo(),
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          //name of company
                          Container(
                            child: Text(
                              widget.instituation.name,
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Spacer(flex: 1),
                          //img of company
                          CircleAvatar(
                              radius: 35.r,
                              backgroundImage:
                                  NetworkImage(widget.instituation.imageLogo)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        widget.instituation.description,
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          color: Color(0xff0843b4),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    //Third Part
                    SizedBox(
                      height: 15.h,
                    ),

                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 1,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsetsDirectional.only(
                                    bottom: index == 5 ? 0 : 15),
                                height: 340.h,
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
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.instituation.name,
                                        style: GoogleFonts.cairo(
                                            color: Color(0xFF004AAD),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 10.h),
                                        child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                widget.instituation.imageLogo)),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.network(
                                          controller.postsList[index].imageUrl,
                                          height: 174.h,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(17.r),
                                      ),
                                      Positioned(
                                        right: 0.w,
                                        bottom: 30.h,
                                        child: Opacity(
                                          opacity: 0.8,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.blue,
                                            ),
                                            child: Text(
                                              controller
                                                  .postsList[index].description,
                                              style: GoogleFonts.cairo(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 9.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.access_alarm,
                                          color: Color(0xFF0440B9),
                                          size: 16,
                                        ),
                                        Text(
                                          controller.postsList[index].createdAt,
                                          style: GoogleFonts.cairo(
                                              color: Color(0xFF0440B9)),
                                        ),
                                        Spacer(),
                                        Text(
                                          'مفعل',
                                          style: GoogleFonts.cairo(
                                              color: Color(0xFF0440B9)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 9.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.location_on,
                                              color: Color(0xFF0440B9),
                                              size: 16),
                                          Text(
                                            controller
                                                .postsList[index].location,
                                            style: GoogleFonts.cairo(
                                                color: Color(0xFF0440B9),
                                                fontSize: 12),
                                          ),
                                          Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return PostDescriptionScreen(
                                                      post: controller
                                                          .postsList[index],
                                                      instituation: controlleins
                                                              .instituationList[
                                                          index],
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'التفاصيل',
                                              style: GoogleFonts.cairo(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF004AAD),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                ),
                                                minimumSize: Size(115.w, 40.h)),
                                          ),
                                        ]),
                                  ),
                                ]),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        }));
  }
}
