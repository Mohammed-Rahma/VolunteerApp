import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/drawer/drawer_screen.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  File? image;

  Future PickedImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Faild to pick image : $e');
    }
  }

  late TextEditingController _experienceTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _experienceTextController = TextEditingController();
  }

  @override
  void dispose() {
    _experienceTextController.dispose();
    super.dispose();
  }

  List<String> _experiences = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'الملف الشخصي',
          style: GoogleFonts.cairo(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(
                    Icons.dehaze_rounded,
                    color: Color(0xFF003F75),
                    size: 35.sp,
                  ));
            },
          ),
        ],
      ),
      endDrawer: DrawerScreen(),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),

              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  //white image
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              65.0)), // Set rounded corner radius
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black26,
                                offset: Offset(1, 1))
                          ] // Make rounded corner of border
                          ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 64,
                      )),
                  //image
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/person.png'),
                    // NetworkImage(snapshot.data.data()['userimage'] ?? 'images/person.png'),
                  ),
                  //white
                  const Positioned(
                      top: 90.0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                      )),
                  //mainColor Blue
                  const Positioned(
                      top: 93.0,
                      right: 3,
                      child: CircleAvatar(
                        backgroundColor: mainColor,
                        radius: 15,
                      )),
                  //icon white
                  Positioned(
                    top: 85.0,
                    right: -5,
                    child: IconButton(
                        onPressed: () {
                          PickedImage();
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  ),
                  // name text
                  Positioned(
                    top: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: const Text(
                          'ايمن ابراهيم العطي',
                          textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 10.h,
              ),

              // image!=null ? Image.file(image!): Text('No selected image'),

              SizedBox(
                height: 80.h,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //متابعاتي
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/follow_screen');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 115.h,
                        width: 165.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(22.0.r),
                          border: Border.all(color: const Color(0xff707070)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 95.0.w,
                          height: 40.h,
                          child: Text(
                            'متابعاتي',
                            style: GoogleFonts.cairo(
                              fontSize: 22.sp,
                              color: const Color(0xff0843b4),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //فعالياتي
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/event_screen');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 115.h,
                        width: 165.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(22.0.r),
                          border: Border.all(color: const Color(0xff707070)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 95.0.w,
                          height: 40.0.h,
                          child: Text(
                            'فعالياتي',
                            style: GoogleFonts.cairo(
                              fontSize: 22.sp,
                              color: const Color(0xff0843b4),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'معلومات التواصل',
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(left: 20.h, right: 20.r),
                clipBehavior: Clip.antiAlias,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 80.w,
                            ),
                            Text(
                              '0594258327',
                              style: GoogleFonts.cairo(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email),
                            SizedBox(
                              width: 80.w,
                            ),
                            Text(
                              'ayman@gmail.com',
                              style: GoogleFonts.cairo(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'إضافة مهارة',
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),

              TextField(
                controller: _experienceTextController,
                onSubmitted: (String value) => _performSave(),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                style: GoogleFonts.cairo(),
                maxLength: 15,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'ادخل مهاراتك',
                  hintStyle: GoogleFonts.cairo(),
                  prefixIcon: Icon(Icons.work),
                  suffixIcon: IconButton(
                    onPressed: () => _performSave(),
                    icon: Icon(Icons.save),
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                children: _experiences.map((e) {
                  return Chip(
                    deleteIcon: Icon(Icons.close),
                    deleteIconColor: Colors.red.shade300,
                    onDeleted: () => _delete(e),
                    backgroundColor: Color(0xFF2B4865),
                    labelStyle: GoogleFonts.cairo(color: Color(0xFFE8F9FD)),
                    elevation: 5,
                    avatar: Icon(
                      Icons.work,
                      size: 18,
                      color: Color(0xFFE8F9FD),
                    ),
                    label: Text(e),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _delete(String experience) {
    setState(() => _experiences.remove(experience));
  }

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_experienceTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('! يجب إدخال المهارات'),
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }

  void _save() {
    setState(() => _experiences.add(_experienceTextController.text));
    _experienceTextController.clear();
  }
}
