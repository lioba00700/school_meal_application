import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_meal_application/controller/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              text: '안녕하세요.\n',
              style: Theme.of(context).textTheme.titleLarge,
              children: const [
                TextSpan(
                  text: '경북소프트웨어고등학교',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '입니다'),
              ],
            ),
          ),
        ),
      ),
      Expanded(
          flex: 4,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.find<MainController>().previousMealType();
                },
                icon: const Icon(Icons.chevron_left),
              ),
              Expanded(
                child: Card(
                  child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Obx(() {
                    MainController controller = Get.find<MainController>();

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          controller.mealType.name,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        FutureBuilder<String>(
                          future: controller.getMeal(controller.mealType),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? '',
                            );
                          },
                        )
                      ],
                    );
                  }),
                )),
              ),
              IconButton(
                onPressed: () {
                  Get.find<MainController>().nextMealType();
                  },
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ))
    ]));
  }
}
