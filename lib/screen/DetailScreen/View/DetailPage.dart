
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/screen/HomeScreen/provider/HomeProvider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  HomeProvider? providerTrue;
  HomeProvider? providerFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<HomeProvider>(context, listen: true);
    providerFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${providerTrue!.result.title}"),
        ),
        body: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.red,
              child: YoutubePlayer(
                controller: providerTrue!.controller!,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                progressColors: ProgressBarColors(
                    playedColor: Colors.red, handleColor: Colors.red.shade900),
                onReady: () {
                  providerTrue!.controller!.addListener(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
