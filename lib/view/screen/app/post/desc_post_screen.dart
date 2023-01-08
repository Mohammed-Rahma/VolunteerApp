import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/controller/categories_controller.dart';
import 'package:volunteer/controller/posts_controller.dart';
import 'package:volunteer/model/institute_model.dart';
import 'package:volunteer/model/posts_model.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/app/post/tabs/cartirea_screen.dart';
import 'package:volunteer/view/screen/app/post/tabs/contact_us_screen.dart';
import 'package:volunteer/view/screen/app/post/tabs/description_screen.dart';
import 'package:volunteer/view/screen/app/post/tabs/location_screen.dart';
import 'package:volunteer/view/screen/app/profile/profile_org_screen.dart';

import '../notifications/local_notification_service.dart';

class PostDescriptionScreen extends StatefulWidget {
  PostDescriptionScreen(
      {required this.instituation, required this.post, this.path, Key? key})
      : super(key: key);
  final String? path;
  final PostsModel post;
  final Instituation instituation;
  @override
  State<PostDescriptionScreen> createState() => _PostDescriptionScreenState();
}

class _PostDescriptionScreenState extends State<PostDescriptionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final controller = Get.find<PostsController>();
  final controlleins = Get.find<CategoriesController>();

  String text = 'انظم الان';
  bool click = true;

  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    notificationService.initialiseNotifications();
    widget.path != null;
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 3);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            centerTitle: true,
            title: Image.asset("images/logo.png", width: 60.w),
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
            return Column(
              children: [
                Image.network(
                  widget.post.imageUrl,
                  width: double.infinity,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileOrgScreen(
                            post: widget.post,
                            instituation: widget.instituation,
                          );
                        },
                      ),
                    );
                  },
                  child: Row(
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
                            horizontal: 20.w, vertical: 20.h),
                        child: CircleAvatar(
                            radius: 30.r,
                            backgroundImage:
                                NetworkImage(widget.instituation.imageLogo)),
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(offset: Offset(0, 1), blurRadius: 1)
                      ]),
                  child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                          color: Color(0xFF004AAD),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 3),
                                blurRadius: 4),
                          ]),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      onTap: (int tabIndex) {
                        setState(() => _tabController.index = tabIndex);
                      },
                      tabs: [
                        Tab(
                          text: 'تواصل معنا',
                        ),
                        Tab(
                          text: 'الموقع',
                        ),
                        Tab(
                          text: 'المعايير',
                        ),
                        Tab(
                          text: 'التفاصيل',
                        ),
                      ]),
                ),
                Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        contact_us_screen(
                          instituation: widget.instituation,
                        ),
                        const LocationScreen(),
                        criterea(post: widget.post),
                        description(post: widget.post),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ElevatedButton(
                    onPressed: () async {
                      notificationService.sendNotifications('mohammed', 'test');
                      setState(() {
                        click = !click;
                        click ? '' : _showLanguageSheet();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: click ? mainColor : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      elevation: 6,
                      minimumSize: Size(325.w, 50.h),
                    ),
                    child: Text(
                      click ? 'انظم الان' : 'الغاء الانظمام',
                      style: GoogleFonts.cairo(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }));
  }

  void _showLanguageSheet() {
    showModalBottomSheet<String>(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        clipBehavior: Clip.antiAlias,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 5.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Image.asset(
                      'images/done.png',
                      height: 120.h,
                    ),
                    Text(
                      ' ! تم الانضمام بنجاح',
                      style: GoogleFonts.cairo(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004AAD)),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
