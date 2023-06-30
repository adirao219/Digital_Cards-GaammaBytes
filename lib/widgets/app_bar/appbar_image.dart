import 'dart:io';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/environment/env_config.dart';

// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage(
      {required this.height,
      required this.width,
      this.imagePath,
      this.svgPath,
      this.margin,
      this.onTap});

  double height;

  double width;

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      // _scaffoldKey.currentState?.openDrawer();
      // },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class MoreOptionMenu extends StatelessWidget {
  MoreOptionMenu({this.isGreeting = false});
  bool isGreeting;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.more_vert,
        size: 30,
        color: ColorConstant.pink900,
      ),
      onSelected: (item) {
        switch (item) {
          case 1:
            launchHelpURL();
            // Navigator.of(context).pushNamed(AppRoutes.helponeScreen);
            break;
          case 2:
            launchYoutubeVideo();
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 1,
            child: Row(children: [
              Icon(
                Icons.help,
                color: ColorConstant.pink900,
                size: 20,
              ),
              Text(' Help')
            ])),
        PopupMenuItem<int>(
            value: 2,
            child: Row(children: [
              Icon(
                Icons.videocam_rounded,
                color: ColorConstant.pink900,
                size: 20,
              ),
              Text(' Watch Video')
            ])),
      ],
    );
  }

  launchHelpURL() async {
    String greetingHelpURL = EnvConfig.config.greetingHelpURL;

    if (await canLaunch(greetingHelpURL)) {
      await launch(greetingHelpURL);
    } else {
      throw 'Could not launch ' + greetingHelpURL;
    }
  }

  launchYoutubeVideo() async {
    String youtubeURL = "youtube://www.youtube.com/watch?v=AhcIpebJIqc";
    String httpURL = "https://www.youtube.com/watch?v=AhcIpebJIqc";
    if (isGreeting) {
      youtubeURL = "youtube://www.youtube.com/watch?v=LdLbbNeilGU";
      httpURL = "https://www.youtube.com/watch?v=LdLbbNeilGU";
    }
    if (Platform.isIOS) {
      if (await canLaunch(youtubeURL)) {
        await launch(youtubeURL, forceSafariVC: false);
      } else {
        if (await canLaunch(httpURL)) {
          await launch(httpURL);
        } else {
          throw 'Could not launch ' + httpURL;
        }
      }
    } else {
      if (await canLaunch(httpURL)) {
        await launch(httpURL);
      } else {
        throw 'Could not launch ' + httpURL;
      }
    }
  }
}

class CommonMoreOptionMenu extends StatelessWidget {
  CommonMoreOptionMenu();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.more_vert,
        size: 30,
        color: ColorConstant.pink900,
      ),
      onSelected: (item) {
        switch (item) {
          case 1:
            launchHelpURL();
            // Navigator.of(context).pushNamed(AppRoutes.helponeScreen);
            break;
          case 2:
            launchDigitalCardYoutubeVideo();
            break;
          case 3:
            launchGreetingYoutubeVideo();
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 1,
            child: Row(children: [
              Icon(
                Icons.help,
                color: ColorConstant.pink900,
                size: 20,
              ),
              Text(' Help')
            ])),
        PopupMenuItem<int>(
            value: 2,
            child: Row(children: [
              Icon(
                Icons.videocam_rounded,
                color: ColorConstant.pink900,
                size: 20,
              ),
              Text(' Watch Digital Card Video')
            ])),
        PopupMenuItem<int>(
            value: 2,
            child: Row(children: [
              Icon(
                Icons.videocam_rounded,
                color: ColorConstant.pink900,
                size: 20,
              ),
              Text(' Watch E-Greeting Video')
            ])),
      ],
    );
  }

  launchHelpURL() async {
    String greetingHelpURL = EnvConfig.config.greetingHelpURL;

    if (await canLaunch(greetingHelpURL)) {
      await launch(greetingHelpURL);
    } else {
      throw 'Could not launch ' + greetingHelpURL;
    }
  }

  launchDigitalCardYoutubeVideo() async {
    String youtubeURL = "youtube://www.youtube.com/watch?v=AhcIpebJIqc";
    String httpURL = "https://www.youtube.com/watch?v=AhcIpebJIqc";


    if (Platform.isIOS) {
      if (await canLaunch(youtubeURL)) {
        await launch(youtubeURL, forceSafariVC: false);
      } else {
        if (await canLaunch(httpURL)) {
          await launch(httpURL);
        } else {
          throw 'Could not launch ' + httpURL;
        }
      }
    } else {
      if (await canLaunch(httpURL)) {
        await launch(httpURL);
      } else {
        throw 'Could not launch ' + httpURL;
      }
    }
  }

  launchGreetingYoutubeVideo() async {
    String youtubeURL = "youtube://www.youtube.com/watch?v=LdLbbNeilGU";
    String httpURL = "https://www.youtube.com/watch?v=LdLbbNeilGU";

    if (Platform.isIOS) {
      if (await canLaunch(youtubeURL)) {
        await launch(youtubeURL, forceSafariVC: false);
      } else {
        if (await canLaunch(httpURL)) {
          await launch(httpURL);
        } else {
          throw 'Could not launch ' + httpURL;
        }
      }
    } else {
      if (await canLaunch(httpURL)) {
        await launch(httpURL);
      } else {
        throw 'Could not launch ' + httpURL;
      }
    }
  }
}

class ShareAndOpenMenu extends StatelessWidget {
  ShareAndOpenMenu({this.publishURL = "", this.cardId = 0});
  String publishURL;
  int cardId;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PopupMenuButton<int>(
        padding: getPadding(right: 20, bottom: 15),
        iconSize: 25,
        icon: Icon(
          Icons.more_vert,
          // size: 20,
          color: ColorConstant.pink900,
        ),
        onSelected: (item) {
          switch (item) {
            case 1:
              onPreview(context);
              break;
            case 2:
              onShare();
              break;
            case 3:
              launchCardURL();
              break;
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem<int>(
              value: 3,
              child: Row(children: [
                Icon(
                  Icons.open_in_new,
                  color: ColorConstant.pink900,
                  size: 18,
                ),
                Text('   Open Published Card',
                    style: TextStyle(
                        color: ColorConstant.pink900,
                        fontWeight: FontWeight.bold,
                        fontSize: 13))
              ])),
          PopupMenuItem<int>(
              value: 2,
              child: Row(children: [
                Icon(
                  Icons.share,
                  color: ColorConstant.pink900,
                  size: 18,
                ),
                Text(
                  '   Share',
                  style: TextStyle(
                      color: ColorConstant.pink900,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                )
              ])),
          PopupMenuItem<int>(
              value: 1,
              child: Row(children: [
                Icon(
                  Icons.remove_red_eye,
                  color: ColorConstant.pink900,
                  size: 18,
                ),
                Text(
                  '   Preview',
                  style: TextStyle(
                      color: ColorConstant.pink900,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                )
              ])),
        ],
      ),
      Container(
          padding: getPadding(top: 27, right: 10),
          child: Text('More',
              style: TextStyle(
                  color: ColorConstant.pink900,
                  fontWeight: FontWeight.bold,
                  fontSize: 10)))
    ]);
  }

  onPreview(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.cardPreviewScreen,
        arguments: {"CardID": this.cardId, "isDigitalCard": true});
  }

  launchCardURL() async {
    String cardURL = this.publishURL;

    if (await canLaunch(cardURL)) {
      await launch(cardURL);
    } else {
      throw 'Could not launch ' + cardURL;
    }
  }

  onShare() {
    Share.share(publishURL);
  }

  launchYoutubeVideo() async {
    String youtubeURL = "youtube://www.youtube.com/watch?v=AhcIpebJIqc";
    String httpURL = "https://www.youtube.com/watch?v=AhcIpebJIqc";
    if (Platform.isIOS) {
      if (await canLaunch(youtubeURL)) {
        await launch(youtubeURL, forceSafariVC: false);
      } else {
        if (await canLaunch(httpURL)) {
          await launch(httpURL);
        } else {
          throw 'Could not launch ' + httpURL;
        }
      }
    } else {
      if (await canLaunch(httpURL)) {
        await launch(httpURL);
      } else {
        throw 'Could not launch ' + httpURL;
      }
    }
  }
}
