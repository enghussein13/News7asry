import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/components/components.dart';
import '../controller/newsapp_controller.dart';


class SearchScreen extends StatelessWidget {
    const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
            return GetBuilder<NewsAppController>(init:NewsAppController(),
            builder: (controller)=>Scaffold(
              appBar: AppBar(

              ),
              body: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text('Search'),
                          prefixIcon: Icon(Icons.search),
                        ),
                        onFieldSubmitted:(v){
                          controller.getSearchData(v);
                        } ,
                      ),
                    ),
                    Expanded(
                      child: ConditionalBuilder(
                        condition: controller.search!.isNotEmpty,
                        fallback: (context)=>const Center(
                          child: CircularProgressIndicator(),
                        ),
                        builder:(context)=>ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context ,index)=>buildArticlesItem(controller.search![index],context),
                            separatorBuilder: (context,index)=>divider()
                            , itemCount: controller.search!.length),
                      ),
                    )

                  ]

              ),
            ));
          }
      }



