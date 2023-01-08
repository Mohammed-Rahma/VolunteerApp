import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volunteer/model/institute_model.dart';
import 'package:volunteer/view/screen/widget/card_w.dart';

class contact_us_screen extends StatefulWidget {
   contact_us_screen({
     required this.instituation,
     this.path,
    Key? key,
  }) : super(key: key);
  final Instituation instituation;
  final String? path;

  @override
  State<contact_us_screen> createState() => _contact_us_screenState();
}

class _contact_us_screenState extends State<contact_us_screen> {

  @override
  void initState() {
    widget.path != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          SizedBox(height: 20.h,),
          card_widdget(
              ledingIcon: Icons.mobile_friendly,
              Title: 'Mobile',
              SubTitle: '+972594567834',
              TraillingIcon: Icons.phone
          ),
          SizedBox(height: 20.h,),

          card_widdget(
              ledingIcon: Icons.email_outlined,
              Title: 'Email',
              SubTitle: widget.instituation.email,
              TraillingIcon: Icons.send
          ),
          SizedBox(height: 20.h,),

        ],
    );
  }
}

