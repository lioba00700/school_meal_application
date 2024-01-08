import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_meal_application/controller/school_controller.dart';
import 'package:school_meal_application/model/school_info.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _name = '';
  final List<SchoolInfo> _data = [];

  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState(){
    super.initState();

    _scrollController.addListener(() {
      if(_scrollController.offset >= 
        _scrollController.position.maxScrollExtent){
          SchoolController controller = Get.find<SchoolController>();

          controller.index = controller.index + 1;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) => _name = value,
              ),  
              ),
              IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _data.clear();
                  
                  Get.find<SchoolController>().index = 1;
                  Get.find<SchoolController>().name = _name;
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () {
              SchoolController schoolController =  Get.find<SchoolController>();

              return FutureBuilder(
                builder:(context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                  _data.addAll(snapshot.data ?? []);
                  
              }
              return ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (context, index) => ListTile(
                  title: Text(_data[index].name),
                  onTap: () => Get.back(result: _data[index]),
                  ),
                  itemCount: _data.length,
                );
              },
                future:schoolController.getSchools(schoolController.index, schoolController.name),
              );
            }  
          ),
        ),
      );
    }
}