import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:krunaltask/controller/HomePageController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomePageController>(
          init: HomePageController(),
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                  child: Container(
                    height: 80.sp,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 120.sp,
                          height: 30.sp,
                        ),
                        Spacer(),
                        Image.asset(
                          "assets/images/more.png",
                          width: 24.sp,
                          height: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Container(
                  height: 90.sp,
                  padding: EdgeInsets.only(left: 20.sp),
                  child: MediaQuery.removePadding(
                    context: Get.context!,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.storySlider.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(2.sp),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.grey, width: 2.0),
                            ),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundImage:
                                  NetworkImage(controller.storySlider[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                // Tab buttons
                Stack
                  (
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20.sp),
                      height: 50,
                      child: MediaQuery.removePadding(
                        context: Get.context!,
                        removeBottom: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tabSlider.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = index;
                            },
                            child: Obx(() => Column(
                              children: [
                                Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.symmetric(horizontal: 2),
                                      child: Column(
                                        children: [
                                          Text(
                                            controller.tabSlider[index],
                                            style: TextStyle(
                                              color: controller.selectedIndex.value == index
                                                  ? Colors.indigo
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.sp,
                                          ),
                                          Container(
                                            height: 3.sp,
                                            width: Get.width/controller.tabSlider.length,
                                            color: controller.selectedIndex.value == index
                                                ? Colors.indigo
                                                : Colors.white,
                                          ),


                                        ],
                                      ),
                                    ),

                              ],
                            )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 28.sp,
                      child: Container(
                        height: 3.sp,
                        width: Get.width,
                        color: Colors.grey[200],
                      ),
                    ),

                  ],
                ),

                Expanded(
                    child: Obx(() => IndexedStack(
                          index: controller.selectedIndex.value,
                          children: [
                            // Tab 1 content
                            MediaQuery.removePadding(
                              context: Get.context!,
                              removeTop: true,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.tab1.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 10.sp),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 45.sp,
                                              height: 45.sp,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(controller.tab1[index].userImage ?? ''),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 12.sp,
                                            ),
                                            Column(

                                              children: [
                                                Text(controller.tab1[index].name??'', style: TextStyle(fontWeight: FontWeight.bold),),
                                                SizedBox(height:2.sp),
                                                Text(controller.tab1[index].nickname??'', style: TextStyle(color: Colors.grey),),
                                              ],
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                            ),
                                            Spacer(),
                                            Icon(Icons.more_vert)
                                          ],
                                        ),
                                      ),
                                      Image.asset(controller.tab1[index].postImage??'', width: Get.width, height: MediaQuery.of(context).size.height/2, fit: BoxFit.fill,),
                                      SizedBox(height:10.sp),
                                      Container(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                if(controller.tab1[index].isLikes==false){
                                                  controller.tab1[index].isLikes=true;
                                                  controller.tab1[index].likes =(controller.tab1[index].likes ?? 0) + 1;
                                                }else{
                                                  controller.tab1[index].isLikes=false;
                                                  controller.tab1[index].likes =(controller.tab1[index].likes ?? 0) - 1;
                                                }
                                                print(controller.tab1[index].likes );
                                                controller.tab1.refresh();

                                              },
                                              child: Row(
                                                children: [
                                                  controller.tab1[index].isLikes??false ?
                                                  Image.asset("assets/images/like.png", width: 24.sp, height: 24.sp,)
                                                  :Image.asset("assets/images/heart.png", width: 24.sp, height: 24.sp, ),
                                                  SizedBox(width: 4.sp,),
                                                  Text("${controller.tab1[index].likes} likes")

                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 4.sp,),
                                            Row(
                                              children: [
                                                Image.asset("assets/images/chat.png", width: 20.sp, height: 20.sp,),
                                                SizedBox(width: 4.sp,),
                                                Text("${controller.tab1[index].comments.toString()} comments")

                                              ],
                                            ),
                                            Spacer(),
                                            Image.asset("assets/images/send.png", width: 20.sp, height: 20.sp,),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:10.sp),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Text(textAlign: TextAlign.start,controller.tab1[index].imageDescription??'',style: TextStyle( fontWeight: FontWeight.bold,),),
                                      ),
                                    ],
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 16.sp,
                                );
                              },
                              ),
                            ),
                            // Tab 2 content
                            MediaQuery.removePadding(
                              context: Get.context!,
                              removeTop: true,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.tab2.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 10.sp),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 45.sp,
                                              height: 45.sp,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(controller.tab2[index].userImage ?? ''),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 12.sp,
                                            ),
                                            Column(
                                              children: [
                                                Text(controller.tab2[index].name??'', style: TextStyle(fontWeight: FontWeight.bold),),
                                                SizedBox(height:2.sp),
                                                Text(controller.tab2[index].nickname??'', style: TextStyle(color: Colors.grey),),
                                              ],
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                            ),
                                            Spacer(),
                                            Icon(Icons.more_vert)
                                          ],
                                        ),
                                      ),
                                      Image.asset(controller.tab2[index].postImage??'', width: Get.width, height: MediaQuery.of(context).size.height/2, fit: BoxFit.fill,),
                                      SizedBox(height:10.sp),
                                      Container(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                if(controller.tab2[index].isLikes==false){
                                                  controller.tab2[index].isLikes=true;
                                                  controller.tab2[index].likes =(controller.tab2[index].likes ?? 0) + 1;
                                                }else{
                                                  controller.tab2[index].isLikes=false;
                                                  controller.tab2[index].likes =(controller.tab2[index].likes ?? 0) - 1;
                                                }
                                                print(controller.tab2[index].likes );
                                                controller.tab2.refresh();

                                              },
                                              child: Row(
                                                children: [
                                                  controller.tab2[index].isLikes??false ?
                                                  Image.asset("assets/images/like.png", width: 24.sp, height: 24.sp,)
                                                      :Image.asset("assets/images/heart.png", width: 24.sp, height: 24.sp, ),
                                                  SizedBox(width: 4.sp,),
                                                  Text("${controller.tab2[index].likes} likes")

                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 4.sp,),
                                            Row(
                                              children: [
                                                Image.asset("assets/images/chat.png", width: 20.sp, height: 20.sp,),
                                                SizedBox(width: 4.sp,),
                                                Text("${controller.tab2[index].comments.toString()} comments")

                                              ],
                                            ),
                                            Spacer(),
                                            Image.asset("assets/images/send.png", width: 20.sp, height: 20.sp,),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:10.sp),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Text(textAlign: TextAlign.start,controller.tab2[index].imageDescription??'',style: TextStyle( fontWeight: FontWeight.bold,),),
                                      ),
                                    ],
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 16.sp,
                                );
                              },
                              ),
                            ),
                            // Tab 3 content
                            MediaQuery.removePadding(
                              context: Get.context!,
                              removeTop: true,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.tab3.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 10.sp),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 45.sp,
                                              height: 45.sp,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(controller.tab3[index].userImage ?? ''),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 12.sp,
                                            ),
                                            Column(
                                              children: [
                                                Text(controller.tab3[index].name??'', style: TextStyle(fontWeight: FontWeight.bold),),
                                                SizedBox(height:2.sp),
                                                Text(controller.tab3[index].nickname??'', style: TextStyle(color: Colors.grey),),
                                              ],
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                            ),
                                            Spacer(),
                                            Icon(Icons.more_vert)
                                          ],
                                        ),
                                      ),
                                      Image.asset(controller.tab3[index].postImage??'', width: Get.width, height: MediaQuery.of(context).size.height/2, fit: BoxFit.fill,),
                                      SizedBox(height:10.sp),
                                      Container(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                if(controller.tab3[index].isLikes==false){
                                                  controller.tab3[index].isLikes=true;
                                                  controller.tab3[index].likes =(controller.tab3[index].likes ?? 0) + 1;
                                                }else{
                                                  controller.tab3[index].isLikes=false;
                                                  controller.tab3[index].likes =(controller.tab3[index].likes ?? 0) - 1;
                                                }
                                                print(controller.tab3[index].likes );
                                                controller.tab3.refresh();

                                              },
                                              child: Row(
                                                children: [
                                                  controller.tab3[index].isLikes??false ?
                                                  Image.asset("assets/images/like.png", width: 24.sp, height: 24.sp,)
                                                      :Image.asset("assets/images/heart.png", width: 24.sp, height: 24.sp, ),
                                                  SizedBox(width: 4.sp,),
                                                  Text("${controller.tab3[index].likes} likes")

                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 4.sp,),
                                            Row(
                                              children: [
                                                Image.asset("assets/images/chat.png", width: 20.sp, height: 20.sp,),
                                                SizedBox(width: 4.sp,),
                                                Text("${controller.tab3[index].comments.toString()} comments")

                                              ],
                                            ),
                                            Spacer(),
                                            Image.asset("assets/images/send.png", width: 20.sp, height: 20.sp,),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:10.sp),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Text(textAlign: TextAlign.start,controller.tab3[index].imageDescription??'',style: TextStyle( fontWeight: FontWeight.bold,),),
                                      ),
                                    ],
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 16.sp,
                                );
                              },
                              ),
                            ),

                            ///tab 4
                            MediaQuery.removePadding(
                              context: Get.context!,
                              removeTop: true,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.tab4.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 10.sp),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 45.sp,
                                              height: 45.sp,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(controller.tab4[index].userImage ?? ''),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 12.sp,
                                            ),
                                            Column(
                                              children: [
                                                Text(controller.tab4[index].name??'', style: TextStyle(fontWeight: FontWeight.bold),),
                                                SizedBox(height:2.sp),
                                                Text(controller.tab4[index].nickname??'', style: TextStyle(color: Colors.grey),),
                                              ],
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                            ),
                                            Spacer(),
                                            Icon(Icons.more_vert)
                                          ],
                                        ),
                                      ),
                                      Image.asset(controller.tab4[index].postImage??'', width: Get.width, height: MediaQuery.of(context).size.height/2, fit: BoxFit.fill,),
                                      SizedBox(height:10.sp),
                                      Container(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                if(controller.tab4[index].isLikes==false){
                                                  controller.tab4[index].isLikes=true;
                                                  controller.tab4[index].likes =(controller.tab1[index].likes ?? 0) + 1;
                                                }else{
                                                  controller.tab4[index].isLikes=false;
                                                  controller.tab4[index].likes =(controller.tab4[index].likes ?? 0) - 1;
                                                }
                                                print(controller.tab4[index].likes );
                                                controller.tab1.refresh();

                                              },
                                              child: Row(
                                                children: [
                                                  controller.tab4[index].isLikes??false ?
                                                  Image.asset("assets/images/like.png", width: 24.sp, height: 24.sp,)
                                                      :Image.asset("assets/images/heart.png", width: 24.sp, height: 24.sp, ),
                                                  SizedBox(width: 4.sp,),
                                                  Text("${controller.tab4[index].likes} likes")

                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 4.sp,),
                                            Row(
                                              children: [
                                                Image.asset("assets/images/chat.png", width: 20.sp, height: 20.sp,),
                                                SizedBox(width: 4.sp,),
                                                Text("${controller.tab4[index].comments.toString()} comments")

                                              ],
                                            ),
                                            Spacer(),
                                            Image.asset("assets/images/send.png", width: 20.sp, height: 20.sp,),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:10.sp),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                                        child: Text(textAlign: TextAlign.start,controller.tab4[index].imageDescription??'',style: TextStyle( fontWeight: FontWeight.bold,),),
                                      ),
                                    ],
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 16.sp,
                                );
                              },
                              ),
                            ),
                          ],
                        ))),

                SizedBox(height: 65.sp,)
              ],
            );
          }),
    );
  }
}
