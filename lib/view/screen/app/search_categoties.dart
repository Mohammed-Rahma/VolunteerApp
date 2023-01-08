import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:volunteer/controller/categories_controller.dart';
import 'package:volunteer/share/constant/constant.dart';

class SearchTextForm extends StatelessWidget {
  SearchTextForm({Key? key}) : super(key: key);

  final controller = Get.find<CategoriesController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
        builder: (context) => Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 5),
                ],
              ),
              child: TextField(
                controller: controller.searchTextController,
                onChanged: (searchName) => {
                  controller.addSearchToList(searchName),
                },
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'بحث',
                  hintStyle: const TextStyle(color: mainColor),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: mainColor,
                  ),
                  prefixIcon: controller.searchTextController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            controller.clearSearch();
                          },
                          icon: const Icon(Icons.close),
                          color: mainColor,
                        )
                      : null,
                ),
              ),
            ));
  }
}

// InkWell(
//   onTap: () {
//     // showSearch(context: context, delegate:DataSearch());
//   },
//   child: Container(
//     padding: const EdgeInsets.all(15),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(color: Colors.black12, spreadRadius:1,blurRadius: 5),
//       ],
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         Icon(Icons.search , color:mainColor,),
//         Spacer(),
//         Text('عن ماذا تبحث اليوم ؟',style: TextStyle(color:mainColor),)
//       ],
//     ),
//   )
// ),

//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:volunteer_app/controller/categories_controller.dart';
//
//
//
// class SearchTextForm extends StatelessWidget {
//
//   SearchTextForm({Key? key}) : super(key: key);
//
//   final controller = Get.find<CategoriesController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black45,
//       appBar: AppBar(
//         backgroundColor:Colors.white,
//         elevation: 0.0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             const Text('عن ماذا تبحث اليوم', style: TextStyle(color: Colors.grey , fontSize: 20,fontWeight: FontWeight.bold ),)
//             ,const SizedBox(height: 20.0,),
//             TextField(
//               onChanged: (value)=>controller.categoriesList(),
//               style: TextStyle(color: Colors.white),
//               textAlign: TextAlign.right,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.deepPurple,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide.none,
//                 ),
//                 hintText:'عن ماذا تبحث اليوم',
//                 prefixIcon: Icon(Icons.search),
//                 prefixIconColor: Colors.white,
//
//               ),
//
//
//             ),
//             Expanded(
//                 child: controller.categoriesList.isEmpty ? const Center(child: Text('لا توجد نتائج البحث',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),)
//                     :ListView.builder(
//                     itemCount: controller.categoriesList.length,
//                     itemBuilder: (context , index)=>ListTile(
//                       contentPadding: const EdgeInsets.all(8.0),
//                       title: Text(controller.categoriesList[index].name! , style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
//                       ),
//
//                       leading:GestureDetector(
//                         behavior: HitTestBehavior.translucent,
//                         onTap: () {
//                         },
//                         child: Container(
//                             width: 48,
//                             height: 48,
//                             padding: const EdgeInsets.symmetric(vertical: 4.0),
//                             alignment: Alignment.center,
//                             child:  CircleAvatar(
//                               backgroundColor: Colors.white,
//                               backgroundImage:NetworkImage(controller.categoriesList[index].imageUrl!,),
//                             )
//                         ),
//                       ),
//                       // dense: false,
//                     )
//
//                 )
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../../../model/institute_model.dart';
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//
//   static List<InstituteModel> main_institute_list=[
//     InstituteModel("مؤسسة الامل","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//     InstituteModel("مؤسسة ابو عماد","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//     InstituteModel("مؤسسة عم امجد","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//     InstituteModel("مؤسسة كيمو","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//     InstituteModel("مؤسسة عم ايمن","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//     InstituteModel("مؤسسة المجدلاوي","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//     InstituteModel("مؤسسة سايبر","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//     InstituteModel("مؤسسة فلاتر","https://m.media-amazon.com/images/I/51CjYz4iQHL._SL75_.jpg"),
//
//   ];
//   List<InstituteModel>display_List=List.from(main_institute_list);
//   void updateList(String value ){
//     setState(() {
//       display_List=main_institute_list.where((element) => element.institute_name!.toLowerCase().contains(value.toLowerCase())).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black45,
//       appBar: AppBar(
//         backgroundColor:Colors.white,
//         elevation: 0.0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text('عن ماذا تبحث اليوم', style: TextStyle(color: Colors.grey , fontSize: 20,fontWeight: FontWeight.bold ),)
//             ,SizedBox(height: 20.0,),
//             TextField(
//               onChanged: (value)=>updateList(value),
//               style: TextStyle(color: Colors.white),
//               textAlign: TextAlign.right,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.deepPurple,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide.none,
//                 ),
//                 hintText:'عن ماذا تبحث اليوم',
//                 prefixIcon: Icon(Icons.search),
//                 prefixIconColor: Colors.white,
//
//               ),
//
//
//             ),
//             Expanded(child: display_List.length==0?Center(child: Text('Now Result Found',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),)
//                 :ListView.builder(
//                 itemCount: display_List.length,
//                 itemBuilder: (context , index)=>ListTile(
//                   contentPadding: EdgeInsets.all(8.0),
//                   title: Text(display_List[index].institute_name! , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
//                   ),
//
//                   leading:GestureDetector(
//                     behavior: HitTestBehavior.translucent,
//                     onTap: () {},
//                     child: Container(
//                         width: 48,
//                         height: 48,
//                         padding: const EdgeInsets.symmetric(vertical: 4.0),
//                         alignment: Alignment.center,
//                         child:  CircleAvatar(
//                           backgroundColor: Colors.white,
//                           backgroundImage:NetworkImage(display_List[index].image_url!,),
//                         )
//                     ),
//                   ),
//                   // dense: false,
//                 )
//
//             )
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
