import 'dart:convert';

class Post {
  String? userImage;
  String? name;
  String? nickname;
  String? postImage;
  int? likes = 0;
  int? comments;
  String? imageDescription;
  bool? isLikes = false;

  Post({
    this.userImage,
    this.name,
    this.nickname,
    this.postImage,
    this.likes,
    this.comments,
    this.imageDescription,
    this.isLikes,
  });

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    userImage: json["user_image"],
    name: json["name"],
    nickname: json["nickname"],
    postImage: json["post_image"],
    likes: json["likes"],
    comments: json["comments"],
    imageDescription: json["image_description"],
    isLikes: json["isLikes"],
  );

  Map<String, dynamic> toMap() => {
    "user_image": userImage,
    "name": name,
    "nickname": nickname,
    "post_image": postImage,
    "likes": likes,
    "comments": comments,
    "image_description": imageDescription,
    "isLikes": isLikes,
  };
}
