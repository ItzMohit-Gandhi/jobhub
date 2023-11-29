import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/height_spacer.dart';

import '../../common/app_style.dart';
import '../../common/reusable_text.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key, required this.title, required this.id});

  final String title;
  final String id;
  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Entypo.bookmark),
              )
            ],
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_left),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                HeightSpacer(size: 30),
                Container(
                  width: width,
                  height: hieght * 0.27,
                  color: Color(kLightGrey.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      const HeightSpacer(size: 10),
                      ReusableText(
                          text: "Senior Flutter developer",
                          style: appstyle(
                              20, Color(kDark.value), FontWeight.w600)),
                      HeightSpacer(size: 5),
                      ReusableText(
                          text: "Bangalore",
                          style: appstyle(
                              18, Color(kDark.value), FontWeight.w600)),
                      const HeightSpacer(size: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                              text: "Full- time",
                              color: Color(kOrange.value),
                              width: width * 0.26,
                              height: hieght * 0.04,
                              color2: Color(kLight.value),
                            ),
                            Row(
                              children: [
                                ReusableText(
                                    text: "80k",
                                    style: appstyle(18, Color(kDark.value),
                                        FontWeight.w600)),
                                SizedBox(
                                  child: ReusableText(
                                      text: "/monthly",
                                      style: appstyle(18, Color(kDark.value),
                                          FontWeight.w600)),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                HeightSpacer(size: 20),
                ReusableText(
                    text: "Job Description",
                    style: appstyle(20, Color(kDark.value), FontWeight.w600)),
                HeightSpacer(size: 10),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style:
                      appstyle(16, Color(kDarkGrey.value), FontWeight.normal),
                ),
                HeightSpacer(size: 20),
                ReusableText(
                    text: "Requirements",
                    style: appstyle(20, Color(kDark.value), FontWeight.w600)),
                HeightSpacer(
                  size: 10,
                ),
                SizedBox(
                  height: hieght * 0.6,
                  child: ListView.builder(
                      itemCount: requirements.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final req = requirements[index];
                        String bullet = "\u2022";
                        return Text(
                          "$bullet $req\n",
                          maxLines: 9,
                          textAlign: TextAlign.justify,
                          style: appstyle(
                              16, Color(kDarkGrey.value), FontWeight.normal),
                        );
                      }),
                ),
                HeightSpacer(size: 20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomOutlineBtn(
                  onTap: () {},
                  color2: Color(kOrange.value),
                  width: width,
                  height: hieght * 0.06,
                  text: "Apply Now",
                  color: Color(kLight.value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
