import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:flutter/material.dart';

class InstaBasicInfo {
  String biography;
  int followersCount;
  int followingCount;
  String fullname;
  String idInsta;
  bool hasChannel;
  bool isBusinessAccount;
  String businessCategory;
  bool isPrivate;
  bool isVerified;
  String profilePic;
  String username;
  int totalPosts;

  InstaBasicInfo({
    Key key,
    @required this.biography,
    @required this.followersCount,
    @required this.followingCount,
    @required this.fullname,
    @required this.idInsta,
    @required this.hasChannel,
    @required this.isBusinessAccount,
    @required this.businessCategory,
    @required this.isPrivate,
    @required this.isVerified,
    @required this.profilePic,
    @required this.username,
    @required this.totalPosts,
  });
}

class InstaDetailsPostInfo {
  String urlImgPost;
  bool isVideo;
  String urlVideoPost;
  int videoViewCount;
  String captionText;
  int commentsCounter;
  Map<String, String> commentsDetails;
  int likesCount;
  String location;
  int timestamp;

  InstaDetailsPostInfo({
    Key key,
    @required this.urlImgPost,
    @required this.isVideo,
    @required this.urlVideoPost,
    @required this.videoViewCount,
    @required this.captionText,
    @required this.commentsCounter,
    @required this.commentsDetails,
    @required this.likesCount,
    @required this.location,
    @required this.timestamp,
  });
}

class InstaApi {
  Client client = Client();
  Future<InstaBasicInfo> fetchInstaBasicInfo(String instaUser) async {
    final response =
        await client.get('https://www.instagram.com/$instaUser/?__a=1');
    final responseDecoded = json.decode(response.body);
    try {
      final user = responseDecoded['graphql']['user'];
      return new InstaBasicInfo(
        biography: user['biography'],
        followersCount: user['edge_followed_by']['count'],
        followingCount: user['edge_follow']['count'],
        fullname: user['full_name'],
        idInsta: user['id'],
        hasChannel: user['has_channel'],
        isBusinessAccount: user['is_business_account'],
        businessCategory: user['business_category_name'],
        isPrivate: user['is_private'],
        isVerified: user['is_verified'],
        profilePic: user['profile_pic_url_hd'],
        username: user['username'],
        totalPosts: user['edge_owner_to_timeline_media']['count'],
      );
    } catch (err) {
      return null;
    }
  }

  Future<List<InstaDetailsPostInfo>> fetchFullPostsData(String id) async {
    final response = await client.get(
      'https://instagramdimashirokovv1.p.rapidapi.com/feed/$id/optional',
      headers: {
        "x-rapidapi-host": "InstagramdimashirokovV1.p.rapidapi.com",
        "x-rapidapi-key": '/*API KEY*/',
      },
    );

    if (response.statusCode == 200) {
      final responseDecoded = json.decode(response.body);
      List<InstaDetailsPostInfo> responseList = [];
      responseDecoded['edges']
          .map((post) => {
                responseList.add(new InstaDetailsPostInfo(
                  urlImgPost: post['node']['display_url'],
                  isVideo: post['node']['is_video'],
                  urlVideoPost: post['node']['video_url'],
                  videoViewCount: post['node']['video_view_count'],
                  captionText: post['node']['edge_media_to_caption']['edges'][0]
                      ['node']['text'],
                  commentsCounter: post['node']['edge_media_to_comment']
                      ['count'],
                  commentsDetails: new Map.fromIterable(
                      post['node']['edge_media_to_comment']['edges'] as List,
                      key: (item) =>
                          item['node']['owner']['username'] as String,
                      value: (item) => item['node']['text'] as String),
                  likesCount: post['node']['edge_media_preview_like']['count'],
                  location: post['node']['location'],
                  timestamp: post['node']['taken_at_timestamp'],
                ))
              })
          .toList();
      return responseList;
    } else {
      print(response.body);
      print(response.statusCode);
      return null;
    }
  }
}
