import 'package:get/get.dart';

import '../Model/Post.dart';

class HomePageController extends GetxController{
  RxString title = RxString("test");
  RxList<String> storySlider = RxList([]);
  RxList<String> tabSlider = RxList([]);
  RxList<Post> tab1 = RxList([]);
  RxList<Post> tab2 = RxList([]);
  RxList<Post> tab3 = RxList([]);
  RxList<Post> tab4 = RxList([]);
  RxInt selectedIndex = RxInt(0);

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
    storySlider = RxList<String>(['https://via.placeholder.com/150', // Replace with actual image URLs
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',]);

    tabSlider = RxList<String>(["SM Space", "Competitions", "Mentors", "Schedule"]);

    tab1= RxList<Post>([
      Post(comments: 10, imageDescription: "Wonderfull nature", likes: 10, name: "John Smith", nickname: "john_smith", postImage: "assets/images/image1.jpg", userImage: "assets/images/baby.jpg"),
      Post(comments: 20, imageDescription: "Wisps of mist cling to the valleys below", likes: 20, name: "Pet Commins", nickname: "commins_pet", postImage: "assets/images/image2.jpg", userImage: "assets/images/baby.jpg"),
    ]);

    tab2= RxList<Post>([
      Post(comments: 30, imageDescription: "a river meanders through the countryside", likes: 30, name: "MSD", nickname: "ms_dhoni", postImage: "assets/images/image3.jpg", userImage: "assets/images/baby.jpg"),
    ]);

    tab3= RxList<Post>([
      Post(comments: 50, imageDescription: "the sun climbs higher in the sky", likes: 40, name: "Test", nickname: "test_user", postImage: "assets/images/image4.jpg", userImage: "assets/images/baby.jpg"),
      Post(comments: 60, imageDescription: ", casting long shadows across the land", likes: 50, name: "Virat", nickname: "chiku", postImage: "assets/images/image5.jpg", userImage: "assets/images/baby.jpg"),
      Post(comments: 70, imageDescription: "future generations to enjoy.", likes: 60, name: "Ravindra jadeja", nickname: "jaddu", postImage: "assets/images/image6.jpg", userImage: "assets/images/baby.jpg"),
      Post(comments: 60, imageDescription: ", casting long shadows across the land", likes: 70, name: "Rohit sharma", nickname: "hitman", postImage: "assets/images/image7.jpg", userImage: "assets/images/baby.jpg"),
    ]);

    tab4= RxList<Post>([
      Post(comments: 70, imageDescription: "future generations to enjoy.", likes: 80, name: "Iyer", nickname: "sr_iyer", postImage: "assets/images/image8.jpg", userImage: "assets/images/baby.jpg"),
      Post(comments: 80, imageDescription: ", casting long shadows across the land", likes: 90, name: "Kishan", nickname: "i_s_k", postImage: "assets/images/image9.jpg", userImage: "assets/images/baby.jpg"),
    ]);
  }
}