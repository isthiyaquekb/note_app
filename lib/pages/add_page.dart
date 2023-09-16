import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/addController.dart';
import 'package:note_app/core/app_assets.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_theme.dart';
import 'package:note_app/widgets/dialogs/tags_dialog.dart';

import '../widgets/circular_button.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final addController = Get.find<AddController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldDarkBackground,
      /*appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Write a poem",
          style: AppTheme.darkTheme.textTheme.headlineMedium,
        ),
        actions: [],
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Text(
              "Write a poem",
              style: AppTheme.darkTheme.textTheme.displayMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    height: 100,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                        onTap: () {

                        },
                        child: SvgPicture.asset(
                          AppAssets.galleryAdd,
                          color: Colors.white,
                          height: 40,
                          width: 40,
                        )),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: AppColor.hintTextColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          maxLines: 3,
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: "Your title",
                            floatingLabelStyle: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                            labelStyle: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColor.primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColor.primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: AppColor.darkError),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: AppColor.darkError),
                            ),
                          ),
                          onSaved: (String? value) {},
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                children: [
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      minLines: 1,
                      maxLines: null,
                        textCapitalization:TextCapitalization.sentences,
                      style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Your poem will be write over here",
                        labelStyle: const TextStyle(
                            color: AppColor.hintTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.darkError),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.darkError),
                        ),
                      ),
                      onSaved: (String? value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Tags :",
                          style: AppTheme.darkTheme.textTheme.bodySmall,
                        ),
                        InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return TagsDialog();
                                  });
                            },
                            child: SvgPicture.asset(
                              AppAssets.hashTagAdd,
                              color: Colors.white,
                              height: 34,
                              width: 34,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: CircularButton(
                height: 42,
                width: MediaQuery.of(context).size.width * 0.6,
                color: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                text: "Submit",
                textColor: AppColor.deepBlue,
                onClicked: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
