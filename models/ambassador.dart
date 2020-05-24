import 'package:flutter/material.dart';

class Analytics {
  int totalLikes;
  int totalComments;
  int totalPosts;
  int totalVideos;
  int totalViews;
  int followers;
  int following;
  List<int> postsTimestamps;
  List<String> postsUrl;
  double engagementRatio;
  double averageCommentsPerPost;
  double averageLikesPerPost;
  double averageViewsPerVideo;
  double averagePostsPerWeek;
  List<DateTime> postsDateTime;
  List<int> likesGraph;
  List<int> commentsGraph;

  Analytics({
    @required this.totalLikes,
    @required this.totalComments,
    @required this.totalViews,
    @required this.followers,
    @required this.following,
    @required this.postsTimestamps,
    @required this.postsUrl,
    @required this.totalPosts,
    @required this.totalVideos,
    this.engagementRatio,
    this.averageCommentsPerPost,
    this.averageLikesPerPost,
    this.averageViewsPerVideo,
    this.averagePostsPerWeek,
    this.postsDateTime,
    this.likesGraph,
    this.commentsGraph,
  });

  calcEngagementRatio() {
    this.engagementRatio =
        ((this.totalLikes + this.totalComments + this.totalViews) /
                this.followers *
                100) /
            (this.totalPosts + this.totalVideos);
  }

  calcAverageCommentsPerPost() {
    this.averageCommentsPerPost =
        this.totalComments / (this.totalPosts + this.totalVideos);
  }

  calcAverageLikesPerPost() {
    this.averageLikesPerPost =
        this.totalLikes / (this.totalPosts + this.totalVideos);
  }

  calcAverageViewsPerVideo() {
    this.averageViewsPerVideo = this.totalViews / this.totalVideos;
  }

  convertTimestampsToDateTimes() {
    this.postsDateTime = [];
    for (int timestamp in this.postsTimestamps) {
      this
          .postsDateTime
          .add(new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
    }
  }

  calcAveragePostsPerWeek() {
    DateTime firstPostDate = new DateTime.fromMillisecondsSinceEpoch(
        this.postsTimestamps[this.postsTimestamps.length - 1] * 1000);
    int datesDiffInDays = DateTime.now().difference(firstPostDate).inDays;
    //print('DAYS DIFFERENCE: $datesDiffInDays');
    this.averagePostsPerWeek =
        (this.totalPosts + this.totalVideos) / datesDiffInDays;
  }

  findMaxLikesPerPost() {
    int maxLikes = 0;
    for (int likes in this.likesGraph) {
      if (likes > maxLikes) {
        maxLikes = likes;
      }
    }
    return maxLikes;
  }

  findMinLikesPerPost() {
    int maxLikes = 0;
    for (int likes in this.likesGraph) {
      if (likes > maxLikes) {
        maxLikes = likes;
      }
    }
    int minLikes = maxLikes;
    for (int likes in this.likesGraph) {
      if (likes < minLikes) {
        minLikes = likes;
      }
    }
    return minLikes;
  }

  findMaxCommentsPerPost() {
    int maxComments = 0;
    for (int coms in this.commentsGraph) {
      if (coms > maxComments) {
        maxComments = coms;
      }
    }
    return maxComments;
  }

  findMinCommentsPerPost() {
    int maxComments = 0;
    for (int coms in this.commentsGraph) {
      if (coms > maxComments) {
        maxComments = coms;
      }
    }
    int minComments = maxComments;
    for (int coms in this.commentsGraph) {
      if (coms < minComments) {
        minComments = coms;
      }
    }
    return minComments;
  }
}

class Ambassador {
  String id;
  String name;
  String username;
  String mail;
  int age;
  String gender;
  bool verified;
  String location;
  String description;
  String imageUrl;
  String instaPicUrl;
  int salaryExpectation;
  List<String> references = [];
  List<String> companiesIdLiked = [];
  List<String> companiesIdMatched = [];
  List<String> companiesIdDisliked = [];
  List<String> companiesIdPool = [];
  List<String> chatsActiveId = [];
  Analytics analytics;

  Ambassador({
    @required this.id,
    @required this.username,
    @required this.mail,
    @required this.age,
    @required this.references,
    @required this.salaryExpectation,
    this.gender,
    this.verified,
    this.location,
    this.description,
    this.imageUrl,
    this.instaPicUrl,
    @required this.companiesIdLiked,
    @required this.companiesIdMatched,
    @required this.companiesIdDisliked,
    @required this.companiesIdPool,
    @required this.chatsActiveId,
    this.analytics,
  });
}

List<Ambassador> ambassadors = [
  Ambassador(
    id: '1',
    username: 'mariapombo',
    mail: 'm.pombo123@mail.com',
    age: 32,
    verified: true,
    location: 'Mataro, Bcn',
    description:
        'Let your plans be dark and impenetrable as night, and when you move, fall like a thunderbolt.⛷⛷',
    imageUrl:
        'https://i.pinimg.com/originals/9d/9d/8e/9d9d8e26601d329b3143993d21ae2bce.jpg',
    references: ['running', 'crossfit'],
    companiesIdLiked: [],
    companiesIdMatched: [],
    companiesIdDisliked: [],
    companiesIdPool: [],
    chatsActiveId: [],
    salaryExpectation: 100,
    analytics: Analytics(
        followers: 6007,
        following: 430,
        totalComments: 4725,
        totalLikes: 10215,
        totalViews: 15952,
        totalPosts: 31,
        totalVideos: 9,
        postsTimestamps: [
          1589997532,
          1589479619,
          1589220530,
          1588788364,
          1588614576,
          1588355967,
          1588183610,
          1588010779,
          1587752699,
          1587579626,
          1587406444,
          1586975176,
          1586196306,
          1586109786,
          1585850539,
          1585751316,
          1585593967,
          1584972198,
          1584972180,
          1584972164,
          1584904080,
          1584730618,
          1584558071,
          1583870159,
          1583697572,
          1583349071,
          1582657994,
          1582293545,
          1582139459,
          1581968009,
          1581691504,
          1581278897,
          1580757875,
          1580412165,
          1580327644,
          1580220060,
          1579962995,
          1579873991,
          1579010395,
          1578945198,
        ],
        engagementRatio: 12.85666722157483,
        averageCommentsPerPost: 118.125,
        averageLikesPerPost: 255.375,
        averageViewsPerVideo: 1772.4444444444443,
        //postsDateTime:
        likesGraph: [
          98,
          240,
          177,
          129,
          181,
          160,
          202,
          268,
          275,
          215,
          251,
          235,
          314,
          194,
          221,
          244,
          224,
          169,
          1037,
          113,
          272,
          322,
          296,
          180,
          193,
          321,
          163,
          138,
          154,
          281,
          211,
          169,
          305,
          164,
          242,
          247,
          232,
          307,
          430,
          641
        ],
        commentsGraph: [
          2,
          9,
          3,
          7,
          7,
          2,
          10,
          8,
          16,
          7,
          9,
          9,
          0,
          4,
          3,
          5,
          4,
          0,
          4537,
          0,
          14,
          3,
          8,
          10,
          3,
          3,
          4,
          9,
          7,
          2,
          6,
          4,
          1,
          2,
          0,
          2,
          0,
          0,
          1,
          4
        ],
        averagePostsPerWeek: 0.3053435114503817,
        postsUrl: [
          'https://www.larazon.es/resizer/wwoN9Hnju2lff86JbtCE5oGBdsw=/1260x840/filters:focal(522x533:532x523)/arc-photo-larazon.s3.amazonaws.com/eu-central-1-prod/public/MTIDO5TXV5BUHDRAUGR3KU6KLA.jpg',
          'https://i.pinimg.com/originals/59/68/49/596849fabaab643e6aab51b7e5aa3399.jpg',
          'https://i.blogs.es/604d70/img_8292/450_1000.jpg',
          'https://estaticos.delooks.es/media/cache/1140x_thumb/uploads/images/gallery/5db83c1c5cafe89703cf9bad/so-brero-maria-pombo_0.jpg',
          'https://www.ocio.net/wp-content/uploads/2019/11/Maria-Pombo.png',
          'https://www.economiadehoy.es/fotos/8/COUTUREPOLARIZADOMARIAPOMBO.jpg',
          'https://www.mujerhoy.com/noticias/201902/18/media/cortadas/zapatillas-maria-pombo-parecer-mas-alta-kBhB-U70694176186bPE-476x714@MujerHoy.jpg',
          'https://estaticos.delooks.es/media/cache/1140x_thumb/uploads/images/article/5d8f3e9f5cafe80bfec8fa1d/maria-pombo_0.jpg',
        ]),
  ),
  Ambassador(
    id: '2',
    username: 'Sandra',
    mail: 'sandru23@mail.com',
    age: 23,
    verified: false,
    location: 'Selva de Mar, Girona',
    description:
        'Supreme excellence consists of breaking the enemys resistance without fighting.⚾',
    imageUrl:
        'https://cdn.21buttons.com/posts/1080x1350/76afe020c4ba4bac8283e5b8c5c7f353_1080x1350.jpg',
    references: ['crossfit', 'triathlon'],
    companiesIdLiked: [],
    companiesIdMatched: [],
    companiesIdDisliked: [],
    companiesIdPool: [],
    chatsActiveId: [],
    salaryExpectation: 100,
  ),
  Ambassador(
    id: '3',
    username: 'Jon',
    mail: 'jonny23@mail.com',
    age: 18,
    verified: false,
    location: 'Castelldefels, Bcn',
    description:
        'Victorious warriors win first and then go to war, while defeated warriors go to war first and then seek to win⛷⛺',
    imageUrl:
        'https://i.pinimg.com/736x/19/e5/39/19e539125437cfd4f22c3b8b80bacb99.jpg',
    references: ['swimming', 'triathlon'],
    companiesIdLiked: [],
    companiesIdMatched: [],
    companiesIdDisliked: [],
    companiesIdPool: [],
    chatsActiveId: [],
    salaryExpectation: 100,
  ),
  Ambassador(
    id: '4',
    username: 'Derik',
    mail: 'moni666@mail.com',
    age: 28,
    verified: true,
    location: 'Sabadell',
    description:
        'There is no instance of a nation benefitting from prolonged warfare.⛹⛹⛹',
    imageUrl:
        'https://estaticos.elperiodico.com/resources/jpg/2/9/zentauroepp48260237-mas-periodico-instagramer-influencer-pepe-barroso-silva190523120841-1558606296392.jpg',
    references: ['running', 'crossfit'],
    companiesIdLiked: [],
    companiesIdMatched: [],
    companiesIdDisliked: [],
    companiesIdPool: [],
    chatsActiveId: [],
    salaryExpectation: 100,
  ),
];
