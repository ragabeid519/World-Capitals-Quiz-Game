import 'package:flutter/material.dart';
import 'package:flutter_app2_g2/quation.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var question = ''.obs;
  var questionCount = ''.obs;

  final quations = [
    Quation(country: 'egypt', capital: 'cairo'),
    Quation(country: 'usa', capital: 'ws'),
    Quation(country: 'france', capital: 'paris'),
    Quation(country: 'uk', capital: 'london'),
  ];
  final items = [
    'cairo',
    'baghdad',
    'ws',
    'khartoum',
    'paris',
    'tokyo',
    'london',
    'ankarra',
  ];

  final answerController = TextEditingController();

  var index = 0, score = 0;
  var started = false.obs; // reactive boolean

  @override
  Widget build(BuildContext context) {
    final name = Get.arguments;
    //cache entries
    final entries = <DropdownMenuEntry>[].obs;
    return Scaffold(
      appBar: AppBar(title: Text('Hello $name')),
      body: Column(
        spacing: 16,
        children: [
          Obx(() {
            return Text(
              '$question',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Obx(() {
              return DropdownMenu(
                menuHeight: 150,
                enabled: started.value,
                width: double.infinity,
                controller: answerController,
                hintText: 'select city',
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                dropdownMenuEntries: entries,
              );
            }),
          ),
          // start button=======================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  ///////////////// task /////////////////
                  items.shuffle();
                  entries.clear();
                  entries.addAll([
                    for (var city in items)
                      DropdownMenuEntry(value: city, label: city),
                  ]);
                  started.value = true;
                  index = 0;
                  score = 0;
                  ///////////// task .///////////////////
                  quations.shuffle();
                  question.value =
                      'what is the capital of ${quations[index].country}';
                  questionCount.value = 'Question 1 of ${quations.length}';
                },
                child: Text('start'),
              ),
              // next button ===================================================
              Obx(() {
                return ElevatedButton(
                  onPressed: started.value
                      ? () {
                          if (index >= quations.length) {
                            return;
                          }

                          if (answerController.text.toLowerCase().trim() ==
                              quations[index].capital.toLowerCase().trim()) {
                            score++;
                            entries.removeWhere(
                              (entry) => entry.value == answerController.text,
                            );
                          }
                          index++;
                          if (index < quations.length) {
                            question.value =
                                'what is the capital of ${quations[index].country}';
                            questionCount.value =
                                'Question ${index + 1} of ${quations.length}';
                          } else {
                            //snackbar-toast-alert
                            Get.back(result: score);
                            Get.snackbar(
                              'score',
                              'score=$score',
                              backgroundColor: Colors.white,
                              colorText: Colors.blueGrey,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            started.value = false;
                            //playerpage=><=homepage
                          }
                          answerController.clear();
                        }
                      : null,
                  child: Text('next'),
                );
              }),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Obx(() {
              return Text(
                '$questionCount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              );
            }),
          ),
        ],
      ),
    );
  }

  void test() {
    final age = 20;
    var message = '';
    if (age > 15) {
      message = 'old';
    } else {
      message = 'young';
    }
    //short if ternary op
    message = age > 15 ? 'old' : 'young';
  }

  void test1() {
    //structured-oop-functional
    final names = ['ahmed', 'said', 'tamer', 'ali'];
    // final r=names.firstWhere((value)=>value=='tamer');
    final r = names.any((value) => value == 'tamer');

    for (var value in names) {
      if (value == 'tamer') {
        //filter - where
        print('found');
        break;
      }
    }
  }
}
