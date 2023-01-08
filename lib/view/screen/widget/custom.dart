import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomBioCard extends StatelessWidget {
  const CustomBioCard({
    Key? key,
    required IconData ledingIcon,
    required String Title ,
    required String SubTitle,
    required IconData TraillingIcon,
    required this.onActionPressed,
    double marginBottom = 0 ,


  }) : _ledingIcon = ledingIcon ,
        _Title = Title ,
        _SubTitle = SubTitle ,
        _TraillingIcon = TraillingIcon ,
        _marginBottom = marginBottom,
        super(key: key);


  final IconData _ledingIcon;
  final String _Title ;
  final String _SubTitle ;
  final IconData _TraillingIcon;
  final double _marginBottom;
  final void Function() onActionPressed ;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20 , right: 20  , bottom: _marginBottom),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(_ledingIcon),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_Title,
                  style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(_SubTitle,
                  style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed:onActionPressed,
              icon: Icon(_TraillingIcon),
            ),
          ],
        ),
      ),
    );
  }
}