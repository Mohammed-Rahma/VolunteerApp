import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/controller/categories_controller.dart';
import 'package:volunteer/controller/posts_controller.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/app/post/post_screen.dart';
import 'package:volunteer/view/screen/app/profile/profile_org_screen.dart';
import 'package:volunteer/view/screen/app/search_categoties.dart';
import 'package:volunteer/view/screen/drawer/drawer_screen.dart';
import 'package:volunteer/view/screen/widget/home_section.dart';

final List<Image> imgList = [
  Image.asset(
    'images/v1.png',
  ),
  Image.asset(
    'images/logo_org.jpeg',
  ),
  Image.asset(
    'images/v10.jpeg',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<CategoriesController>();
  final controllerPost = Get.find<PostsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset("images/logo.png", width: 60.w),
        elevation: 1,
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(
                    Icons.dehaze_rounded,
                    color: const Color(0xFF003F75),
                    size: 35.sp,
                  ));
            },
          ),
        ],
      ),
      endDrawer: const DrawerScreen(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            children: [
              SearchTextForm(),
              SizedBox(
                height: 5.h,
              ),
              CarouselSlider(
                  items: imgList.toList(),
                  options: CarouselOptions(
                    height: 150.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(
                height: 5.h,
              ),
              const HomeSection(
                title: 'مؤسسة نشرت حديثا',
                Subtitle: 'رؤية الكل',
                ico: Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.blueAccent,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 120.h,
                ),
                child: GridView.builder(
                    reverse: true,
                    itemCount: controller.instituationList.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      childAspectRatio: 87.h / 141.w,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProfileOrgScreen(
                                    instituation:
                                        controller.instituationList[index],
                                    post: controllerPost.postsList[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                controller.instituationList[index].imageLogo,
                                height: 60.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  controller.instituationList[index].name,
                                  style: GoogleFonts.cairo(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
              const HomeSection(
                title: 'أختر نوع التطوع',
              ),
              controller.searchList.isEmpty &&
                      controller.searchTextController.text.isNotEmpty
                  ? Center(
                      child: Text(
                      '! لا توجد نتائج البحث ',
                      style: GoogleFonts.cairo(),
                    ))
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.searchList.isEmpty
                          ? controller.categoriesList.length
                          : controller.searchList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.h,
                        mainAxisSpacing: 10.w,
                        childAspectRatio: 170.w / 150.h,
                      ),
                      itemBuilder: (context, index) {
                        if (controller.searchList.isEmpty) {
                          return InkWell(
                            onTap: () {
                              controllerPost.getCategoryPost(
                                  controller.categoriesList[index].id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PostScreen(
                                      category:
                                          controller.categoriesList[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    controller.categoriesList[index].imageUrl,
                                    height: 107.h,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller.categoriesList[index].name,
                                        style: GoogleFonts.cairo(
                                            color: const Color(0xFF4871C0),
                                            fontSize: 22.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: () {
                              controllerPost.getCategoryPost(
                                  controller.categoriesList[index].id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PostScreen(
                                      category:
                                          controller.categoriesList[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    controller.searchList[index].imageUrl,
                                    height: 107.h,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller.searchList[index].name,
                                        style: GoogleFonts.cairo(
                                            color: const Color(0xFF4871C0),
                                            fontSize: 22.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      })
            ],
          );
        }
      }),
    );
  }
}
