
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/app/settings/change_password_screen.dart';
import 'package:volunteer/view/screen/widget/home_section.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var nameController = TextEditingController();
  bool isButtonSheet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'الاعدادات',
          style: GoogleFonts.cairo(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward_ios),
              color: Color(0xFF004AAD),
            ),
          ]
      ),
      body:Stack(
        children: [
          Container(
            height: 110.h,
            width: double.infinity,
            color: Color(0xFF004AAD),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 50.h, start: 53.w,end: 23.w),
            child: Container(
              width: 325.w ,
              height:123.h ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,0),
                    color: Colors.black45,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 15.h,bottom: 28.h,start: 20.w),
                child: ListTile(
                  leading: CircleAvatar(radius: 30.r,backgroundImage: AssetImage('images/person.png')),
                  title: Text('ايمن ابراهيم العطي',
                    style: GoogleFonts.cairo(fontSize: 14.sp),),
                  subtitle: Text('0594258327',style: GoogleFonts.cairo(),),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 200.h,start: 10.w,end: 10.w),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: HomeSection(title: 'الحساب'),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        ' تغيير كلمة المرور',
                        style: GoogleFonts.cairo(
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.edit,color: Colors.black,),
                  onTap: () {
                    Get.to(()=>ChangePasswordScreen());
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'تعديل رقم الهاتف',
                        style: GoogleFonts.cairo(
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.edit,color: Colors.black,),
                  onTap: () {
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'تعديل الاسم',
                        style: GoogleFonts.cairo(
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: ({isButtonSheet = true}){
                       if(isButtonSheet){
                         scaffoldKey.currentState?.showBottomSheet(
                               (context) => Container(
                                 padding: EdgeInsets.all(20),
                             height: 190,
                             width: double.infinity,
                             child: Column(
                               children: [
                                 TextFormField(
                                   controller: nameController,
                                   decoration: InputDecoration(
                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                                     hintText: "ادخل الاسم الجديد",
                                   ),
                                 ),
                                 TextButton(
                                   style: ButtonStyle(
                                     backgroundColor: MaterialStateProperty.all(mainColor),
                                     overlayColor: MaterialStateProperty.all(Colors.green),
                                   ),
                                     onPressed: (){
                                   setState(() {
                                     isButtonSheet = false;
                                     Navigator.pop(context);
                                   });
                                 }, child: Text("اتمام",
                                 style: TextStyle(
                                   color: Colors.white
                                 ),
                                 )),
                               ],
                             ),
                           ),
                         ).closed.then((value) => isButtonSheet=false);
                       }
                    },
                    icon:Icon(Icons.edit),
                    color: Colors.black,
                  ),
                ),
                Divider(),

              ],
            ),
          ),
        ],
      ),
    );
  }
  void _showLanguageSheet() {
    showModalBottomSheet<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
          ),
        ),
        clipBehavior: Clip.antiAlias,
        context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (context , setState){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Change Language',style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                      ),

                      Text('Choose Sutable Language',style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        height: 1.0.h,
                        fontWeight: FontWeight.w300,
                        color: Colors.black45,
                      ),
                      ),
                      Divider(),
                      RadioListTile<String>(
                          value: 'en',
                          title: Text('English',style: GoogleFonts.cairo(),),
                          groupValue: 'en',
                          onChanged: (String? value){

                          }
                      ),
                      RadioListTile<String>(
                          value: 'ar',
                          title: Text('العربية',style: GoogleFonts.cairo(),),
                          groupValue: 'ar',
                          onChanged: (String? value){
                          }
                      ),
                    ],
                  ),
                );
              }
          );
        }
    );

  }

}
