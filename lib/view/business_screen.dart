import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/components/components.dart';
import '../controller/newsapp_controller.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


        return GetBuilder<NewsAppController>(
          init: NewsAppController(),
          builder: ( controller) =>ConditionalBuilder(
            condition:controller.business.isNotEmpty
            ,fallback: (context)=>const Center(
            child: CircularProgressIndicator(),
          ),
            builder:(context)=> ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context ,index)=>buildArticlesItem(controller.business[index],context),
                separatorBuilder: (context,index)=>divider()
                , itemCount: controller.business.length),
          ),
        );
      }

  }

