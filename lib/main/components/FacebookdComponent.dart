import 'dart:io';

import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppConstants.dart';

bool _isInterstitialAdLoaded = false;

// Load InterstitialAd
void loadFacebookInterstitialAd() {
  FacebookInterstitialAd.loadInterstitialAd(
    placementId: kReleaseMode
        ? getInterstitialFacebookAdUnitId()!
        : isAndroid
            ? fbInterstitialId
            : fbInterstitialIdIos,
    listener: (result, value) {
      print(">> FAN > Interstitial Ad: $result --> $value");
      if (result == InterstitialAdResult.LOADED) _isInterstitialAdLoaded = true;

      if (result == InterstitialAdResult.DISMISSED && value["invalidated"] == true) {
        _isInterstitialAdLoaded = false;
        loadFacebookInterstitialAd();
      }
    },
  );
}

// Show InterstitialAd
void showFacebookInterstitialAd() {
  if (_isInterstitialAdLoaded == true)
    FacebookInterstitialAd.showInterstitialAd();
  else
    print("Interstitial Ad not yet loaded!");
}

Widget loadFacebookBannerId() {
  return FacebookBannerAd(
    placementId: kReleaseMode
        ? getBannerFacebookAdUnitId()!
        : isAndroid
            ? fbBannerId
            : fbBannerIdIos,
    bannerSize: BannerSize.STANDARD,
    listener: (result, value) {
      print("Banner Ad: $result -->  $value");
    },
  );
}

String? getInterstitialFacebookAdUnitId() {
  if (Platform.isIOS) {
    return fbInterstitialIdIos;
  } else if (Platform.isAndroid) {
    return fbInterstitialId;
  }
  return null;
}

String? getBannerFacebookAdUnitId() {
  if (Platform.isIOS) {
    return fbBannerIdIos;
  } else if (Platform.isAndroid) {
    return fbBannerId;
  }
  return null;
}
