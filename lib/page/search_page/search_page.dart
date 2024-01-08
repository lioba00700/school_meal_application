import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_meal_application/controller/school_controller.dart';
import 'package:school_meal_application/model/school_info.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
              child: TextField(),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            builder:(context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                List<SchoolInfo> data = snapshot.data ?? [];

                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                  title: Text(data[index].name),
                ),
                itemCount: data.length,
                );
              }
              return const Center(child: CircularProgressIndicator(),);
            },
            future: Get.find<SchoolController>().getSchools(),
          ),
        ),
      );
    }
}