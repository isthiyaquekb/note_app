import 'dart:developer';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/history_controller.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_theme.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldDarkBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColor.hintTextColor.withOpacity(0.9),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.white54,
                    blurRadius: 6.0,
                    offset: Offset(0.0, 6.0),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      Text(DateTime.now().toString()),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: AppColor.primaryColor,
                      selectedTextColor: AppColor.textColor,
                      onDateChange: (date) {
                        // New date selected
                        log("Selected date:$date");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 16.0,bottom: 16.0),
                  child: Text("Today's Post",
                      style: AppTheme.darkTheme.textTheme.bodySmall),
                ),
                Expanded(child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Container(
                          height: 120,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColor.accentColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Title of the poem"),
                              Text("How many liked this poem"),
                            ],
                          ),
                        ),
                      );
                    }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
