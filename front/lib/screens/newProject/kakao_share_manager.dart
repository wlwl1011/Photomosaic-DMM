// import 'package:kakao_flutter_sdk/all.dart';
// import 'package:kakao_flutter_sdk/auth.dart';
// import 'package:kakao_flutter_sdk/common.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk_plugin.dart';
// import 'package:kakao_flutter_sdk/link.dart';
// import 'package:kakao_flutter_sdk/local.dart';
// import 'package:kakao_flutter_sdk/push.dart';
// import 'package:kakao_flutter_sdk/search.dart';
// import 'package:kakao_flutter_sdk/story.dart';
// import 'package:kakao_flutter_sdk/talk.dart';
// import 'package:kakao_flutter_sdk/template.dart';
// import 'package:kakao_flutter_sdk/user.dart';
import 'package:kakao_flutter_sdk/link.dart';
import 'package:kakao_flutter_sdk/common.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:front/controller/main_controller.dart';
// import 'package:json_serializable/json_serializable.dart';
import 'package:platform/platform.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:crypto/crypto.dart';
// import 'package:encrypt/encrypt.dart';

class KakaoShareManager {
  static final KakaoShareManager _manager = KakaoShareManager._internal();

  factory KakaoShareManager() {
    return _manager;
  }

  KakaoShareManager._internal() {
    initializeKakaoSDK();
  }

  void initializeKakaoSDK() {
    String kakaoAppKey = "08584176995afe2e0b263e8c404a52ec";
    KakaoContext.clientId = kakaoAppKey;
  }

  Future<bool> isKakaotalkInstalled() async {
    bool installed = await isKakaoTalkInstalled();
    return installed;
  }

  void shareMyCode(String photo_path, String code) async {
    try {
      var dynamicLink = await _getDynamicLink(code);
      var template = _getTemplate(dynamicLink, photo_path);
      var uri = await LinkClient.instance.defaultWithTalk(template);
      await LinkClient.instance.launchKakaoTalk(uri);
    } catch (error) {
      print(error.toString());
      print('error sharemycode');
    }
  }

  Future<Uri> _getDynamicLink(String code) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://photomosaic.page.link/${code}'),
      uriPrefix: 'https://photomosaic.page.link',
      androidParameters: AndroidParameters(
        packageName: 'com.example.front',
        minimumVersion: 1,
      ),
    );
    final Uri dynamicUrl;
    dynamicUrl = await parameters.buildUrl();
    return dynamicUrl;
  }

  DefaultTemplate _getTemplate(Uri dynamicLink, String photo_path) {
    String title = "Shall we go make a new photo mosaic?";

    Uri imageLink = Uri.parse(photo_path);

    Link link = Link(mobileWebUrl: dynamicLink);

    Content content = Content(title, imageLink, link);

    FeedTemplate template = FeedTemplate(
      content,
      buttons: [
        Button('Go to App', link),
      ],
    );
    return template;
  }
}
