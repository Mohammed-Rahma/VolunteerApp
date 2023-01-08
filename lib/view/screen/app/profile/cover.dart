







import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? image;

  Future PickedImage()async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image==null)return;
      final imageTemp=File(image.path);
      setState(() => this.image=imageTemp);


    }on PlatformException catch(e){
      print('Faild to pick image : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(children: [

                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/person.png'),

                ),
               Positioned(
                 right: 20,
                 child: IconButton(
                     onPressed: (){ PickedImage();},
                     icon:Icon(Icons.edit,color: Colors.red,size: 30,)
                 ),
               ),
             ],),

             //  MaterialButton(onPressed: (){
             //    PickedImage();
             //  } , child: Text('Click !'),),
              SizedBox(height: 20,),
              image!=null ? Image.file(image!): Text('No selected image'),
              // testing for child widget which is using FlutterLogo
//               CircularProfileAvatar(
//                 '',
//                 child: FlutterLogo(),
//                 borderColor: Colors.purpleAccent,
//                 borderWidth: 2,
//                 elevation: 5,
//                 radius: 50,
//               ),
//               CircularProfileAvatar(
//                 '',
//                 child: Icon(
//                   Icons.person,
//                   size: 140,
//                 ),
//                 borderColor: Colors.black,
//                 borderWidth: 3,
//                 elevation: 5,
//                 radius: 75,
//               ),
//               CircularProfileAvatar(
// //                  'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWtMDksH9GzFdMinyAkGbtLJNx6xynLETTNN5akjxirL3QD5Rj',
//                 errorWidget: (context, url, error) => Container(
//                   child: Icon(Icons.error),
//                 ),
//                 placeHolder: (context, url) => Container(
//                   width: 50,
//                   height: 50,
//                   child: CircularProgressIndicator(),
//                 ),
//                 radius: 90,
//                 backgroundColor: Colors.transparent,
//                 borderWidth: 10,
// //                  initialsText: Text(
// //                    "AD",
// //                    style: TextStyle(fontSize: 40, color: Colors.white),
// //                  ),
//                 borderColor: Colors.red,
//                 imageFit: BoxFit.fitHeight,
//                 elevation: 5.0,
//                 onTap: () {
//                   print('adil');
//                 },
//                 cacheImage: true,
//                 showInitialTextAbovePicture: false,
//               ),
            ],
          ),
        ));
  }
}










//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
//
// import 'package:form_builder_image_picker/form_builder_image_picker.dart';
// import 'package:image_picker/image_picker.dart';
//
//
//
//
// class ApiImage {
//   final String imageUrl;
//   final String id;
//   ApiImage({
//     required this.imageUrl,
//     required this.id,
//   });
// }
//
// class MyHomePage extends StatelessWidget {
//   final _formKey = GlobalKey<FormBuilderState>();
//
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FormBuilderImagePicker Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: FormBuilder(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   // FormBuilderImagePicker(
//                   //   name: 'photos',
//                   //   displayCustomType: (obj) =>
//                   //   obj is ApiImage ? obj.imageUrl : obj,
//                   //   decoration: const InputDecoration(labelText: 'Pick Photos'),
//                   //   maxImages: 5,
//                   //   previewAutoSizeWidth: true,
//                   //   previewMargin: const EdgeInsetsDirectional.only(end: 8),
//                   //   fit: BoxFit.cover,
//                   //   initialValue: [
//                   //     'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//                   //     const Text('this is an image\nas a widget !'),
//                   //     ApiImage(
//                   //       id: 'whatever',
//                   //       imageUrl:
//                   //       'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
//                   //     ),
//                   //   ],
//                   // ),
//                   const SizedBox(height: 15),
//                   FormBuilderImagePicker(
//                     name: 'singlePhotoWithDecoration',
//                     displayCustomType: (obj) =>
//                     obj is ApiImage ? obj.imageUrl : obj,
//                     decoration: const InputDecoration(
//                       labelText: 'Pick Single Photo With Decoration Visible',
//                     ),
//                     showDecoration: true,
//                     maxImages: 1,
//                     previewAutoSizeWidth: true,
//                     initialValue: const [
//                       'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   // const Text(
//                   //     'Single Photo with no decoration, and previewAutoSizeWidth=true'),
//                   // FormBuilderImagePicker(
//                   //   name: 'singlePhoto',
//                   //   displayCustomType: (obj) =>
//                   //   obj is ApiImage ? obj.imageUrl : obj,
//                   //   // decoration: const InputDecoration(
//                   //   //   labelText: 'Pick Photos',
//                   //   // ),
//                   //   showDecoration: false,
//                   //   maxImages: 1,
//                   //   previewAutoSizeWidth: true,
//                   //   initialValue: const [
//                   //     'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//                   //   ],
//                   // ),
//                   const SizedBox(height: 15),
//
//                   FormBuilderImagePicker(
//                     name: 'singleAvatarPhoto',
//                     displayCustomType: (obj) =>
//                     obj is ApiImage ? obj.imageUrl : obj,
//                     decoration: const InputDecoration(
//                       labelText: 'Pick Photos',
//                     ),
//                     transformImageWidget: (context, displayImage) => Card(
//                       shape: const CircleBorder(),
//                       clipBehavior: Clip.antiAlias,
//                       child: SizedBox.expand(
//                         child: displayImage,
//                       ),
//                     ),
//                     showDecoration: false,
//                     maxImages: 1,
//                     previewAutoSizeWidth: false,
//                     initialValue: const [
//                       'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//                     ],
//                   ),
//                   // const SizedBox(height: 15),
//                   // ElevatedButton(
//                   //   child: const Text('Submit'),
//                   //   onPressed: () {
//                   //     if (_formKey.currentState?.saveAndValidate() == true) {
//                   //       debugPrint(_formKey.currentState!.value.toString());
//                   //     }
//                   //   },
//                   // ),
//                   // ElevatedButton(
//                   //   child: const Text('Reset'),
//                   //   onPressed: () {
//                   //     _formKey.currentState?.reset();
//                   //   },
//                   // )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }