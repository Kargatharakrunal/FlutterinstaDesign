import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/HomePage.dart';
import '../pages/MenuPage.dart';
import '../pages/NotificationPage.dart';
import '../pages/ProfilePage.dart';
import '../pages/SearchPage.dart';

class HomeScreenController extends GetxController{
  RxInt pageIndex = RxInt(0);
  RxList<Widget> views = RxList([const HomePage(), const SearchPage(), const ProfilePage(), const NotificationPage(), const MenuPage()]);
}