import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/ad_mob/ad_helper.dart';

class AdMobStore with ChangeNotifier {
  BannerAd? _ad;
  BannerAd? get ad => _ad;

  AdMobStore() {
    initBanner();
  }


  void initBanner() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _ad = ad as BannerAd;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
          notifyListeners();
        },
      ),
    ).load();
  }
  
}
