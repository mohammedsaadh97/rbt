import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//import 'dart:js' as js;

class PlayButton extends StatefulWidget {
  const PlayButton({super.key});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  static const platform = MethodChannel("com.mobiotics.media");

  void onPlay() async {
    if (kIsWeb) {
      const playerUrl = "https://google.com";
      //js.context.callMethod('open', [playerUrl, '_self']);
      // html.window.open(playerUrl, "_self");
    } else {
      try {
        final String result = await platform.invokeMethod("openPlayer");
      } on PlatformException catch (e) {
        //handle platfrom exception here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPlay,
      child: const Text("Test video player"),
    );
  }
}
