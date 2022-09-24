import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../view/business_screen.dart';
import '../view/health_screen.dart';
import '../view/general_screen.dart';
import '../view/sport_screen.dart';

class NewsAppController extends GetxController
{

  List<String> categories=['General','Business','Sport','Health'];

  List <BottomNavigationBarItem> bottomItems=[
    const BottomNavigationBarItem(icon:Icon(Icons.newspaper),label:'General'),
    const BottomNavigationBarItem(icon:Icon(Icons.business_center_rounded),label:'Business'),
    const BottomNavigationBarItem(icon:Icon(Icons.sports_soccer),label:'Sport'),
    const BottomNavigationBarItem(icon:Icon(Icons.medical_information),label:'Health')
  ];

  int currentIndex=0;
  List<Widget> screensToggle=[
    const GeneralScreen(),
    const BusinessScreen(),
    const SportScreen(),
    const HealthScreen(),

  ];


  void bottomNavChange(index){
    currentIndex=index;
    update();
  }


  //-----------------DarkMOde--------------

  bool isDark=false;

//-------------------------------------------------------------------------


//------------------Api Lessons--------
  int index=0;
  List <dynamic>business=[];
  List <dynamic>sport=[];
  List <dynamic>health=[];
  List <dynamic>general=[];


  void getGeneralData(){


    DioHelper.getData(url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'language':'ar',
          'category':'general',
          'apiKey':'14877010685342efb02fc7d80ee55fd8'
        }
    ).then((value) {
      general=value.data['articles'];
      update();
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
    });
  }

  void getBusinessData(){


    DioHelper.getData(url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'language':'ar',
          'category':'business',
          'apiKey':'14877010685342efb02fc7d80ee55fd8'
        }
    ).then((value) {
      business=value.data['articles'];
      update();
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
    });
  }
  void getSportData(){
    DioHelper.getData(url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'language':'ar',
          'category':'sports',
          'apiKey':'14877010685342efb02fc7d80ee55fd8'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      sport=value.data['articles'];
      //print(business[0]['title']);
      update();
    }).catchError((error){

      if (kDebugMode) {
        print(error);
      }
    });
  }
  void getHealthData(){
    DioHelper.getData(url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'language':'ar',
          'category':'health',
          'apiKey':'14877010685342efb02fc7d80ee55fd8'
        }
    ).then((value) {
      health=value.data['articles'];
      update();
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
    });}

  //------------Search Function-----
  List <dynamic> ?search  =[];


  void getSearchData(String value){
    DioHelper.getData(url: 'v2/everything',
        query:{
          'q':value,
          'language':'ar',
          'apiKey':'14877010685342efb02fc7d80ee55fd8'
        }
    ).then((value) {

      search= value.data['articles'];
      if (kDebugMode) {
        print(value);
      }
      update();
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
    });}







}









