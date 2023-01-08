import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:volunteer/controller/posts_controller.dart';

import '../../../share/constant/constant.dart';

class SearchPosts extends StatelessWidget {
  SearchPosts({Key? key}) : super(key: key);

  final controller = Get.find<PostsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostsController>(
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
