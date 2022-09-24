import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/newsapp_controller.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';
import 'view/news_home.dart';

void main() {
//WidgetsFlutterBinding.ensureInitialized();


  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: (){
        DioHelper.init();
        NewsAppController controller =Get.put(NewsAppController());
        controller..getBusinessData()..getSportData()..getHealthData()..getGeneralData();

      },
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.customDarkThemeGetx,
      theme: Themes.customLightThemeGetx,
      home:     const NewsLayout(),
    );
  }
}
