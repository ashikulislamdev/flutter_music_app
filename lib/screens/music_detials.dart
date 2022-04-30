import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/modals/music_modal.dart';


class MusicDetails extends StatefulWidget {
  const MusicDetails({ Key? key, required this.musics }) : super(key: key);

  final Music musics;

  @override
  State<MusicDetails> createState() => _MusicDetailsState();
}

class _MusicDetailsState extends State<MusicDetails> {
  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer(); 
    Duration duration = Duration.zero;
    Duration position = Duration.zero;
    bool isPlaying = false;

    @override
    void initState() {
      audioPlayer.onPlayerStateChanged.listen((audioState) {
        setState(() async {
          isPlaying = audioState==PlayerState.PLAYING;
        });
      });

      audioPlayer.onDurationChanged.listen((audioDuration) { 
        setState(() {
          duration = audioDuration;
        });
      });

      audioPlayer.onAudioPositionChanged.listen((audioPosition) { 
        setState(() {
          position=audioPosition;
        });
      });
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.musics.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(widget.musics.image),
              ),
              const SizedBox(height: 25),
              ListTile(
                title: Text(widget.musics.title),
                subtitle: Text("Author : " + widget.musics.singer),
                trailing: IconButton(
                  onPressed: () async {
                    if (isPlaying==true) {
                      await audioPlayer.pause();
                    }else{
                      await audioPlayer.play(widget.musics.url);
                    }
                  }, 
                  icon: Icon(isPlaying? Icons.pause_circle : Icons.play_circle, color: Colors.white, size: 40,)
                ),
              ),
              const SizedBox(height: 10),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(), 
                onChanged: (value) async{
                  position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                },
              )
            ],
          ),
        )
      ),
    );
  }
}