import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_downloader/screen/HomeScreen/model/YouTubeModel.dart';
import 'package:video_downloader/utils/ApiHelper.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController txtSearch = TextEditingController();
  YouTubeModel? youTubeModel = YouTubeModel();
  Results result = Results();
  String search = "";
  double progres=0;
  YoutubePlayerController? controller;

  Future<void> SearchVideo() async {
    search = txtSearch.text;
    notifyListeners();
  }

  void AddValue({required Results data}) {
    result = data;
    notifyListeners();
  }

  void loadVideo()
  {
    controller = YoutubePlayerController(
      initialVideoId: result.id!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
    notifyListeners();
  }




}
