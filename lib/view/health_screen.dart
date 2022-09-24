import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/components/components.dart';
import '../controller/newsapp_controller.dart';


class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsAppController>(
      init: NewsAppController()..getBusinessData(),
      builder: ( controller) =>ConditionalBuilder(
        condition:controller.health.isNotEmpty,
        fallback: (context)=>const Center(
        child: CircularProgressIndicator(),
      ),
        builder:(context)=> ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context ,index)=>buildArticlesItem(controller.health[index],context),
            separatorBuilder: (context,index)=>divider()
            , itemCount: controller.health.length),
      ),
    );

  }
}
