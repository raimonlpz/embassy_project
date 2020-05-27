import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import '../widgets/toggle_light.dart';
import '../widgets/nav_drawer.dart';
import '../widgets/clock.dart';
import '../widgets/home_menu.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

/* TESTS */
import '../services/insta_api.dart';
import '../models/ambassador.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/homepage';
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Analytics createAnalytics(
      List<InstaDetailsPostInfo> posts, InstaBasicInfo basicInfo) {
    int _totalLikes = 0;
    int _totalComments = 0;
    int _totalViews = 0;
    int _totalPosts = 0;
    int _totalVideos = 0;
    List<int> _timestampsPosts = List();
    List<int> _likesGraph = List();
    List<int> _commentsGraph = List();
    List<String> _postsUrl = List();

    posts.map((post) {
      _totalLikes += post.likesCount;
      _totalComments += post.commentsCounter;
      _totalViews += post.videoViewCount != null ? post.videoViewCount : 0;
      _timestampsPosts.add(post.timestamp);
      _likesGraph.add(post.likesCount);
      _commentsGraph.add(post.commentsCounter);
      post.isVideo ? _totalVideos += 1 : _totalPosts += 1;
      post.isVideo
          ? _postsUrl.add(post.urlVideoPost)
          : _postsUrl.add(post.urlImgPost);
    }).toList();

    return new Analytics(
      totalViews: _totalViews,
      totalComments: _totalComments,
      totalLikes: _totalLikes,
      totalPosts: _totalPosts,
      totalVideos: _totalVideos,
      postsTimestamps: _timestampsPosts,
      postsUrl: _postsUrl,
      followers: basicInfo.followersCount,
      following: basicInfo.followingCount,
      likesGraph: _likesGraph,
      commentsGraph: _commentsGraph,
    );
  }

  Future<Ambassador> fetchInsta() async {
    InstaApi instaApi = InstaApi();
    InstaBasicInfo basicInfoData =
        await instaApi.fetchInstaBasicInfo('originbuds_es');
    print(basicInfoData.idInsta);
    return Future.value(null);

    /* ************* AMBASSADOR INSTANCE + ANALYTICS TEST ********* */

    // List<InstaDetailsPostInfo> fullPostsData =
    //     await instaApi.fetchFullPostsData(basicInfoData.idInsta);

    // Analytics _analytics = createAnalytics(fullPostsData, basicInfoData);

    // Ambassador newAmbassador = new Ambassador(
    //   id: DateTime.now().toString(),
    //   username: basicInfoData.username,
    //   mail: 'origin22@fmfs.com',
    //   age: 32,
    //   references: ['sport', 'moda'],
    //   salaryExpectation: 222,
    //   companiesIdLiked: [],
    //   companiesIdMatched: [],
    //   companiesIdDisliked: [],
    //   companiesIdPool: [],
    //   chatsActiveId: [],
    //   analytics: _analytics,
    //   verified: basicInfoData.isVerified,
    //   location: 'Barcelona',
    //   description: basicInfoData.biography,
    //   imageUrl: basicInfoData.profilePic,
    //   instaPicUrl: basicInfoData.profilePic,
    // );

    // newAmbassador.analytics.calcEngagementRatio();
    // newAmbassador.analytics.calcAverageCommentsPerPost();
    // newAmbassador.analytics.calcAverageLikesPerPost();
    // newAmbassador.analytics.calcAverageViewsPerVideo();
    // newAmbassador.analytics.convertTimestampsToDateTimes();
    // newAmbassador.analytics.calcAveragePostsPerWeek();

    // print('USERNAME: ${newAmbassador.username}');
    // print('POSTS_URL: ${newAmbassador.analytics.postsUrl}');
    // print('FOLLOWERS: ${newAmbassador.analytics.followers}');
    // print('FOLLOWING: ${newAmbassador.analytics.following}');
    // print('COMMENTS: ${newAmbassador.analytics.totalComments}');
    // print('LIKES: ${newAmbassador.analytics.totalLikes}');
    // print('VIEWS: ${newAmbassador.analytics.totalViews}');
    // print('POSTS: ${newAmbassador.analytics.totalPosts}');
    // print('VIDEOS: ${newAmbassador.analytics.totalVideos}');
    // print('TIMESTAMPS POSTS: ${newAmbassador.analytics.postsTimestamps}');
    // print('VERIFIED?: ${newAmbassador.verified}');
    // print('BIO: ${newAmbassador.description}');
    // print('PIC: ${newAmbassador.instaPicUrl}');

    // print('ENGAGEMENT RATIO: ${newAmbassador.analytics.engagementRatio}');
    // print(
    //     'AVERAGE COMMENTS X POST: ${newAmbassador.analytics.averageCommentsPerPost}');
    // print(
    //     'AVERAGE LIKES X POST: ${newAmbassador.analytics.averageLikesPerPost}');
    // print(
    //     'AVERAGE VIEWS X VIDEO: ${newAmbassador.analytics.averageViewsPerVideo}');
    // print('POSTS DATETIME: ${newAmbassador.analytics.postsDateTime}');
    // print('LIKES GRAPH: ${newAmbassador.analytics.likesGraph}');
    // print('COMMENTS GRAPH: ${newAmbassador.analytics.commentsGraph}');
    // print(
    //     'AVERAGE POSTS X WEEK: ${newAmbassador.analytics.averagePostsPerWeek}');

    // return newAmbassador;
    /* ************************************************* */
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  initState() {
    super.initState();
    fetchInsta();
  }

  @override
  Widget build(BuildContext ctx) {
    return NeumorphicTheme(
      usedTheme: UsedTheme.LIGHT,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
        //intensity: 0.3,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.35,
      ),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            key: scaffoldKey,
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: NeumorphicTheme.baseColor(context),
              ),
              child: NavDrawer(),
            ),
            backgroundColor: NeumorphicTheme.baseColor(context),
            body: Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: FlutterGradients.forestInei(),
                    ),
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: WaveClipperOne(reverse: true, flip: true),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: FlutterGradients.forestInei(),
                      ),
                      height: 130,
                    ),
                  ),
                ),
                Container(
                  child: HomeMenu(),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 330),
                  child: Center(
                    child: Clock(),
                  ),
                ),
                Center(
                  child: Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width - 60,
                    margin: EdgeInsets.only(bottom: 40),
                    child: Neumorphic(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15)),
                        style: NeumorphicStyle(
                          border: NeumorphicBorder(
                            color: NeumorphicTheme.isUsingDark(context)
                                ? Colors.grey[800]
                                : Colors.white,
                            width: 0.5,
                          ),
                          shape: NeumorphicShape.convex,
                          depth: 8,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Stack(children: [
                          TextLiquidFill(
                            text: '',
                            waveColor: Colors.pink[50],
                            boxBackgroundColor: Colors.transparent,
                            boxHeight: 300.0,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 40),
                              child: Text(
                                'embassy',
                                style: TextStyle(
                                  color: NeumorphicTheme.baseColor(context),
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.5, .5),
                                      blurRadius: 1.0,
                                      color: Color.fromARGB(235, 0, 0, 0),
                                    ),
                                  ],
                                  fontSize: 43,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Grifter2',
                                ),
                              ),
                            ),
                          ),
                        ])),
                  ),
                ),
                ToggleLights(),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: NeumorphicProgressIndeterminate(
                    style: ProgressStyle(
                        accent: Colors.pink[100],
                        variant: Colors.tealAccent,
                        border: NeumorphicBorder(
                          width: 3,
                          color: NeumorphicTheme.baseColor(context),
                        )),
                    height: 55,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 40,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 40,
                      color: NeumorphicTheme.isUsingDark(context)
                          ? Colors.yellow[100]
                          : Colors.black,
                    ),
                    onPressed: () => scaffoldKey.currentState.openDrawer(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
