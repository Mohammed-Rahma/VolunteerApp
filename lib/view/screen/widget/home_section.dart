
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSection extends StatelessWidget {

  final String title;
  final String Subtitle;
  final Icon? ico ;

  const HomeSection({
    Key? key,
    required this.title,
     this.Subtitle="",
     this.ico   ,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(child: ico),
        TextButton(
          onPressed: (){},
          child: Text(
            Subtitle,
            style: GoogleFonts.cairo(
            ),
          ),
        ),
        Spacer(),
        Text(
          title,
          style: GoogleFonts.cairo(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),

      ],
    );
  }
}
