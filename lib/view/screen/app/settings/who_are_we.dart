import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/share/constant/constant.dart';

class HowAreWe extends StatelessWidget {
  const HowAreWe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Text(
            'من نحن',
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
      body: SafeArea(
        child:Container(
          height: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
                blurRadius: 9,
                offset: Offset(3,3),
            )],
          ),
          child: Text('بسم الله الذي أتم علينا تلك النعم التي لا حصر لها\n'
              ' ولا عدد وهو السميع العليم، الحضور الكرام.. أهلًا ومرحبًا بكم في هذا'
              'اليوم، سنحاول جاهدين أن نعرض'
              ' معكم كافة المحاور الأساسية التي اشتمل عليها موضوع هذا'
              ' المشروع على أمل أن ينال رضا سيادتكم، وأن يتضمن المنفعة والإفادة لكل من يطلع عليه',
              textDirection: TextDirection.rtl,
            maxLines:30,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
              style: new TextStyle(fontSize: 20.0,),
          ),),
      ) ,
    );
  }
}
