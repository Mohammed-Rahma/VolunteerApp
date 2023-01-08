import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/controller/categories_controller.dart';
import 'package:volunteer/controller/posts_controller.dart';
import 'package:volunteer/model/categories_model.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/app/post/desc_post_screen.dart';
import 'package:volunteer/view/screen/app/profile/profile_org_screen.dart';
import 'package:volunteer/view/screen/app/search_posts.dart';

class PostScreen extends StatefulWidget {
  PostScreen({required this.category, this.path, Key? key}) : super(key: key);
  final String? path;
  final CategoriesModels category;

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final controller = Get.find<PostsController>();
  final controlleins = Get.find<CategoriesController>();

  @override
  void initState() {
    widget.path != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Image.asset("images/logo.png", width: 60.w),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward_ios),
            color: Color(0xFF004AAD),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            children: [
              SearchPosts(),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  widget.category.name,
                  style: GoogleFonts.cairo(
                      color: Color(0xFF004AAD),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                child: controller.searchList.isEmpty &&
                        controller.searchTextController.text.isNotEmpty
                    ? Center(
                        child: Text(
                        '! لا توجد نتائج البحث ',
                        style: GoogleFonts.cairo(),
                      ))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.searchList.isEmpty
                            ? controller.postsListCategory.length
                            : controller.searchList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          if (controller.searchList.isEmpty) {
                            return Container(
                              margin: EdgeInsetsDirectional.only(
                                  bottom: index == 5 ? 0 : 15),
                              height: 340.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.black45,
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              child: Column(children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ProfileOrgScreen(
                                            post: controller
                                                .postsListCategory[index],
                                            instituation: controlleins
                                                .instituationList[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        controlleins
                                            .instituationList[index].name,
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
                                                controlleins
                                                    .instituationList[index]
                                                    .imageLogo)),
                                      ),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    ClipRRect(
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: BorderRadius.circular(17.r),
                                      child: Image.network(
                                        controller
                                            .postsListCategory[index].imageUrl,
                                        height: 174.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
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
                                            controller.postsListCategory[index]
                                                .description,
                                            style: GoogleFonts.cairo(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp,
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
                                      const Icon(
                                        Icons.access_alarm,
                                        color: Color(0xFF0440B9),
                                        size: 16,
                                      ),
                                      Text(
                                        controller
                                            .postsListCategory[index].createdAt,
                                        style: GoogleFonts.cairo(
                                            color: Color(0xFF0440B9)),
                                      ),
                                      Spacer(),
                                      Text(
                                        controller
                                            .postsListCategory[index].status,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(Icons.location_on,
                                            color: Color(0xFF0440B9), size: 16),
                                        Text(
                                          controller.postsListCategory[index]
                                              .location,
                                          style: GoogleFonts.cairo(
                                              color: Color(0xFF0440B9),
                                              fontSize: 12),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF004AAD),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                              ),
                                              minimumSize: Size(115.w, 40.h)),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return PostDescriptionScreen(
                                                      post: controller
                                                              .postsListCategory[
                                                          index],
                                                      instituation: controlleins
                                                              .instituationList[
                                                          index],
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            child: Text(
                                              ' التفاصيل',
                                              style: GoogleFonts.cairo(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ]),
                            );
                          } else {
                            //search
                            return Container(
                              margin: EdgeInsetsDirectional.only(
                                  bottom: index == 5 ? 0 : 15),
                              height: 340.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.black45,
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              child: Column(children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ProfileOrgScreen(
                                            post: controller.searchList[index],
                                            instituation: controlleins
                                                .instituationList[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        controlleins
                                            .instituationList[index].name,
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
                                                controlleins
                                                    .instituationList[index]
                                                    .imageLogo)),
                                      ),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    ClipRRect(
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: BorderRadius.circular(17.r),
                                      child: Image.network(
                                        controller.searchList[index].imageUrl,
                                        height: 174.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
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
                                                .searchList[index].description,
                                            style: GoogleFonts.cairo(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp,
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
                                      const Icon(
                                        Icons.access_alarm,
                                        color: Color(0xFF0440B9),
                                        size: 16,
                                      ),
                                      Text(
                                        controller.searchList[index].createdAt,
                                        style: GoogleFonts.cairo(
                                            color: Color(0xFF0440B9)),
                                      ),
                                      Spacer(),
                                      Text(
                                        controller.searchList[index].status,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(Icons.location_on,
                                            color: Color(0xFF0440B9), size: 16),
                                        Text(
                                          controller.searchList[index].location,
                                          style: GoogleFonts.cairo(
                                              color: Color(0xFF0440B9),
                                              fontSize: 12),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF004AAD),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                              ),
                                              minimumSize: Size(115.w, 40.h)),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return PostDescriptionScreen(
                                                      post: controller
                                                          .searchList[index],
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
                                          ),
                                        )
                                      ]),
                                ),
                              ]),
                            );
                          }
                        }),
              ),
            ],
          );
        }
      }),
    );
  }
}
