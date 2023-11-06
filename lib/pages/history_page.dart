import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controllers/history_controller.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_theme.dart';
import 'package:spring/spring.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldDarkBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
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
                      Obx(() => Text(historyController.selectedDate.value),),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: GetBuilder<HistoryController>(builder: (controller)=>ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.allDates.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4),
                              child: InkWell(
                                onTap: (){
                                  controller.setSelectedDate(DateFormat.yMd().format(controller.allDates[index].first.get("created").toDate()),index);
                                },
                                child: Container(
                                  height: 230,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: controller.currentIndex.value==index?AppColor.bottomNavBarColor:AppColor.scaffoldDarkBackground.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(DateFormat.MMM().format(controller.allDates[index].first.get("created").toDate()).toUpperCase(),style: GoogleFonts.quantico(
                                            color: Colors.black,
                                            fontSize: 14,fontWeight: FontWeight.w400
                                        ),),
                                        Text(DateFormat.d().format(controller.allDates[index].first.get("created").toDate()).toUpperCase(),style: GoogleFonts.quantico(
                                            color: Colors.black,
                                            fontSize: 24,fontWeight: FontWeight.w700
                                        ),),
                                        Text(DateFormat.E().format(controller.allDates[index].first.get("created").toDate()).toUpperCase().toUpperCase(),style: GoogleFonts.quantico(
                                            color: Colors.black,
                                            fontSize: 14,fontWeight: FontWeight.w400
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 16.0, bottom: 16.0),
                  child: Text("Today's Post",
                      style: AppTheme.darkTheme.textTheme.bodySmall),
                ),
                GetBuilder<HistoryController>(builder: (historyController)=>ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: historyController.historyFilterNotes.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Spring.slide(
                        slideType: SlideType.slide_in_right,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: AppColor.cardBg,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(historyController.historyFilterNotes[index].get("title"),style: AppTheme
                                      .darkTheme
                                      .textTheme
                                      .displayLarge,),
                                  Text(historyController.historyFilterNotes[index].get("content"),style: AppTheme
                                      .darkTheme
                                      .textTheme
                                      .bodyMedium,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
