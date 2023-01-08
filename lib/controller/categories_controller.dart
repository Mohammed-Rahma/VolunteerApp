import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:volunteer/api/categories_api.dart';
import 'package:volunteer/api/institution_api.dart';
import 'package:volunteer/model/institute_model.dart';
import '../model/categories_model.dart';

class CategoriesController extends GetxController {
  var categoriesList = <CategoriesModels>[].obs;
  var isLoading = true.obs;
  var instituationList = <Instituation>[].obs;

  //search
  var searchList=<CategoriesModels>[].obs;
  TextEditingController searchTextController=TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getCategories();
    readInstituat();
  }

  getCategories() async {
   var category= await CategoriesServices.getCategories();

    try {
      isLoading.value = true;
      if (category.isNotEmpty) {
        categoriesList.addAll(category);
      }
    } finally {
      isLoading(false);
    }
  }


  readInstituat() async {
    var instituate= await InstitutionsServices().getInstituation();

    try {
      isLoading.value = true;
      if (instituate.isNotEmpty) {
        instituationList.addAll(instituate);
      }
    } finally {
      isLoading(false);
    }
  }

  void addSearchToList(String searchName){

    searchList.value=categoriesList.where((search) =>search.name.contains(searchName)).toList();
    update();
  }
  void clearSearch(){
    searchTextController.clear();
    addSearchToList('');
  }




}

