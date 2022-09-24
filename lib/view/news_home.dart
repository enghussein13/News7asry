import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/shared/styles/themes.dart';

import '../controller/newsapp_controller.dart';
import 'search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsAppController>(
      init: NewsAppController(),
        builder: (controller)=>Scaffold(
            appBar: AppBar(
              title:   Text(controller.categories[controller.currentIndex]),
              actions: [
                IconButton(onPressed:(){


                }, icon:const Icon(Icons.language_outlined)),
                IconButton(onPressed:(){
                  // AppCubit.get(context).darkMode();
                  if(Get.isDarkMode){
                    Get.changeTheme(Themes.customLightThemeGetx);
                  }else {
                    Get.changeTheme(Themes.customDarkThemeGetx);
                  }

                }, icon:const Icon(Icons.brightness_4_outlined))
              ],
            ),

            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(title: const Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),onTap: (){ },trailing: const Icon(Icons.arrow_forward_ios),),
                  ListTile(title: const Text('Register',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),onTap: (){},trailing: const Icon(Icons.arrow_forward_ios),),
                  ListTile(title: const Text('English',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),onTap: (){},trailing: const Icon(Icons.arrow_forward_ios),),
                  ListTile(title: const Text('اللغة العربية',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),onTap: (){},trailing: const Icon(Icons.arrow_forward_ios),),
                  ListTile(title: const Text('Settings',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),onTap: (){},trailing: const Icon(Icons.arrow_forward_ios),),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Search',
              onPressed: (){

                Get.to(SearchScreen());
            },child: const Icon(Icons.search_outlined),),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.currentIndex
                ,onTap: (index){
               controller.bottomNavChange(index);
            },
                items:controller.bottomItems
            ),

            body:controller.screensToggle[controller.currentIndex]
        ));
        }



  }
