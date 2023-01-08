
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/view/screen/widget/custom.dart';
import 'package:volunteer/view/screen/widget/custom_list.dart';



class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEBEBEB),
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        backgroundColor: Color(0xFFFEBEBEB),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,'/profile_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 27,
            color: Color(0xFFFA076E8),
          ),
        ),
        title:  Text(
          'About',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFA076E8)
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.orange,
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Color(0xFFFEBEBEB),
                Color(0xFFFEBEBEB),
              ]
          ),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            const Spacer(),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('images/logo.png'),
            ),
            const SizedBox(height: 10,),
            Text('ayman Ibrahem',
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('0594258327',
              style: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  height: 0.8
              ),
            ),
            Divider(
              thickness: 0.3,
              color: Colors.deepPurpleAccent.shade200,
              indent: 40,
              endIndent: 40,
              height: 50,
            ),
            CustomBioCard(
                ledingIcon: Icons.phone_android_outlined,
                Title: 'Mobile',
                SubTitle: '+9720594258327',
                TraillingIcon: Icons.call,
                marginBottom: 10,
                onActionPressed :(){
                  _ShowMessage(context,message: 'Open Mobile');
                }
            ),

            CustomListTileCard(
              LeaddingIcon: Icons.email,
              Title: "Email",
              subTitle: "ayman@gmail.com",
              Trailingicon: Icons.send,
              marginBottom: 10,
              onActionPressed:(){
                print('Send Email');
                _ShowMessage(context,message: 'Open Gmail');
              },

            ),

            CustomListTileCard(
              LeaddingIcon: Icons.location_history,
              Title: "Location",
              subTitle: "Gaza",
              Trailingicon: Icons.map,
              onActionPressed: (){
                print('Send Loaction');
                _ShowMessage(context,message: 'Find Location');
              },
            ),

            const Spacer(),
            const SizedBox(height: 10,),
            // CustomBioCard(
            //    ledingIcon: Icons.email,
            //    Title: 'Email',
            //    SubTitle: 'ayman812001@gmail.com',
            //    TraillingIcon: Icons.send
            // ),
          ],
        ),
      ),
    );
  }
  void _ShowMessage (BuildContext context,{required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onVisible: ()=>print('On Visible'),
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.all(10),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: (){},
          textColor: Colors.white,
        ),
      ),
    );
  }
}
