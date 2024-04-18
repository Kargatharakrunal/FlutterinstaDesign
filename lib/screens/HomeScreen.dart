import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/HomeScreenController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: GetX<HomeScreenController>(
            init: HomeScreenController(),
            builder: (controller) {
              return controller.views[controller.pageIndex.value];
            }),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}

Widget bottomNavBar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.sp),
    height: 60.sp,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(00.sp), topLeft: Radius.circular(00.sp))),
    child: GetX<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ///Home
              home(controller),
              search(controller),
              profile(controller),
              notification(controller),
              menu(controller),
            ],
          );
        }),
  );
}

Widget home(HomeScreenController controller) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        controller.pageIndex.value = 0;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_filled,
              color: controller.pageIndex.value == 0
                  ? Colors.indigo
                  : Colors.black,
              size: 24.sp,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget search(HomeScreenController controller) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        controller.pageIndex.value = 1;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: controller.pageIndex.value == 1
                  ? Colors.indigo
                  : Colors.black,
              size: 24.sp,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget profile(HomeScreenController controller) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        controller.pageIndex.value = 2;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_2_rounded,
              color: controller.pageIndex.value == 2
                  ? Colors.indigo
                  : Colors.black,
              size: 24.sp,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget notification(HomeScreenController controller) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        controller.pageIndex.value = 3;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications,
              color: controller.pageIndex.value == 3
                  ? Colors.indigo
                  : Colors.black,
              size: 24.sp,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget menu(HomeScreenController controller) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        controller.pageIndex.value = 4;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: controller.pageIndex.value == 4
                  ? Colors.indigo
                  : Colors.black,
              size: 24.sp,
            ),
          ],
        ),
      ),
    ),
  );
}
