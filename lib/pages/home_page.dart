import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/home_controller.dart';
import 'package:note_app/core/app_assets.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldDarkBackground,
      body: ListView(
        children: [
          //HEADER
          Container(
            width: double.maxFinite,
            decoration:
                const BoxDecoration(color: AppColor.scaffoldDarkBackground),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: const Image(
                        image: AssetImage(AppAssets.accountPlaceHolder),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hi Good Morning",
                            style: AppTheme.darkTheme.textTheme.displaySmall),
                        Text("Isthiyaque",
                            style: AppTheme.darkTheme.textTheme.displayMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //TAB BAR
          Container(
            width: 120,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppColor.hintTextColor,
                borderRadius: BorderRadius.circular(6)),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(6)),
              indicatorColor: Colors.transparent,
              labelColor: AppColor.black,
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: AppColor.white,
              unselectedLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              controller: homeController.tabController,
              tabs: homeController.myTabs,
            ),
          ),
          //TAB VIEW
          SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                        controller: homeController.tabController,
                        children: [
                          Stack(children: [
                            StreamBuilder(
                                stream: homeController.getAllNotes(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const ClampingScrollPhysics(),
                                      pageSnapping: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) =>
                                          AnimatedBuilder(
                                        animation:
                                            homeController.pageController,
                                        builder: (context, child) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 320,
                                              width: 240,
                                              decoration: BoxDecoration(
                                                  color: AppColor.cardBg,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.black45,
                                                        offset:
                                                            Offset(0.4, 0.4),
                                                        blurRadius: 6.0)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 60.0,
                                                            left: 16),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          snapshot.data![index].title,
                                                          style: AppTheme
                                                              .darkTheme
                                                              .textTheme
                                                              .displayLarge,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: snapshot.data![index].tags.asMap().entries.map((e) => Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                  8.0),
                                                              child:
                                                              Container(
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: AppColor
                                                                        .textColor,
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        10)),
                                                                child:
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      8.0),
                                                                  child:
                                                                  Center(
                                                                    child:
                                                                    Text(
                                                                      e.value.tagName,
                                                                      style: AppTheme
                                                                          .darkTheme
                                                                          .textTheme
                                                                          .bodySmall,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),).toList(),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index].content,
                                                          style: AppTheme
                                                              .darkTheme
                                                              .textTheme
                                                              .bodySmall,
                                                          maxLines: 5,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Today at 6:30 PM",
                                                                style: AppTheme
                                                                    .darkTheme
                                                                    .textTheme
                                                                    .bodySmall,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  width: 40,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      color: Colors
                                                                          .black),
                                                                  child:
                                                                      const Center(
                                                                          child:
                                                                              Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 0,
                                                      right: 0,
                                                      child: Container(
                                                        height: 60,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: AppColor
                                                                    .scaffoldDarkBackground,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black38)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 4.0,
                                                                  bottom: 4.0),
                                                          child: Container(
                                                              height: 40,
                                                              width: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: AppColor
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topRight:
                                                                            Radius.circular(20),
                                                                        bottomLeft:
                                                                            Radius.circular(15),
                                                                      ),
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black38)),
                                                              child: SvgPicture
                                                                  .asset(
                                                                AppAssets
                                                                    .heartUnfilled,
                                                                height: 32,
                                                                width: 32,
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                              )),
                                                        ),
                                                      )),
                                                  Positioned(
                                                      top: 10,
                                                      left: 10,
                                                      child: SvgPicture.asset(
                                                        AppAssets.instagramLogo,
                                                        height: 32,
                                                        width: 32,
                                                        fit: BoxFit.scaleDown,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      controller: homeController.pageController,
                                      onPageChanged: (index) {
                                        homeController.changePageIndex(index);
                                      },
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                }),
                            Positioned(
                                right: 0,
                                left: 0,
                                bottom: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: SmoothPageIndicator(
                                      controller: homeController.pageController,
                                      count: 6,
                                      effect: const ExpandingDotsEffect(
                                        dotHeight: 8,
                                        dotWidth: 8,
                                        dotColor: AppColor.white,
                                        activeDotColor: AppColor.primaryColor,
                                        expansionFactor: 4,
                                        // strokeWidth: 5,
                                      ),
                                    ),
                                  ),
                                ))
                          ]),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80,
                                        width: 320,
                                        decoration: BoxDecoration(
                                            color: Colors.amber.shade300,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    );
                                  })),
                        ]),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
