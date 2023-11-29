import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:http/http.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/reusable_text.dart';
import 'package:jobhub/views/common/width_spacer.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_bar.dart';
import '../../common/drawer/drawer_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Profile",
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: hieght * 0.12,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: CachedNetworkImage(
                            width: 80.w,
                            height: 100.w,
                            imageUrl:
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                      ),
                      WidthSpacer(width: 20),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: "Ishant Sharma",
                        style:
                            appstyle(20, Color(kDark.value), FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(
                            MaterialIcons.location_pin,
                            color: Color(kDarkGrey.value),
                          ),
                          WidthSpacer(width: 5),
                          ReusableText(
                            text: "Mumbai",
                            style: appstyle(
                                20, Color(kDark.value), FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Feather.edit,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(kLightGrey.value)),
                  width: width,
                  height: hieght * 0.12,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12.w),
                          width: 60.w,
                          height: 70.h,
                          color: Color(kLight.value),
                          child: Icon(FontAwesome5Regular.file_pdf,
                              color: Colors.red, size: 40),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableText(
                                text: "resume from jobhub",
                                style: appstyle(
                                    18, Color(kDark.value), FontWeight.w500)),
                            ReusableText(
                                text: "Jobhub resume",
                                style: appstyle(18, Color(kDarkGrey.value),
                                    FontWeight.w500)),
                          ],
                        ),
                        WidthSpacer(width: 1)
                      ]),
                ),
                Positioned(
                    top: 2.h,
                    right: 5.w,
                    child: GestureDetector(
                      onTap: () {},
                      child: ReusableText(
                          text: "Edit",
                          style: appstyle(
                              15, Color(kOrange.value), FontWeight.w500)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
