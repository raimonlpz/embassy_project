import 'package:flutter/material.dart';
import '../../models/ambassador.dart';

import 'package:flutter_instagram_image_picker/InstagramAuth.dart';
//import 'package:flutter_instagram_image_picker/flutter_instagram_image_picker.dart';
import 'package:flutter_instagram_image_picker/screens.dart';

class Profile extends StatefulWidget {
  final dynamic ctx;
  final Ambassador ambassador;

  Profile(this.ctx, this.ambassador);
  createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var accessToken;
  InstagramAuth session = InstagramAuth();

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      alignment: Alignment.center,
      child: Column(
        children: [
          RaisedButton(
            child: Text('Log in with Instagram',
                style: TextStyle(fontFamily: 'Grifter')),
            onPressed: () async {
              accessToken = await InstagramAuth().accessToken;

              if (accessToken == null) {
                accessToken = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InstagramWebViewLoginPage(),
                    ));

                if (accessToken == null) return;

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => InstagramImagePicker(
                //               accessToken,
                //               showLogoutButton: true,
                //               onDone: (items) {
                //                 Navigator.pop(context);
                //               },
                //               onCancel: () => Navigator.pop(context),
                //             )));
              }
            },
          ),
          RaisedButton(
            child: Text('Log out', style: TextStyle(fontFamily: 'Grifter')),
            onPressed: () async {
              print('TOKEN: $accessToken');
              // https://api.instagram.com/v1/users/self/?access_token=5628246800.1677ed0.c35656215ed64c35af123cfca769251d
              session.logout();
            },
          ),
        ],
      ),
    );
  }
}
