
import 'package:flutter/material.dart';
import 'package:flutter_music_app/modals/music_modal.dart';
import 'package:flutter_music_app/screens/music_detials.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List musics;

  @override
  void initState() {
    musics = getMusicList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Music App"),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
          ),
          ListView.builder(
            itemCount: musics.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MusicDetails(musics: musics[index], )));
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: ListTile(
                    title: Text(musics[index].title),
                    subtitle: Text(musics[index].singer),
                    leading: Image.network(musics[index].image, fit: BoxFit.cover,),
                    trailing: IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.play_circle, color: Colors.white, size: 33,)
                    ),
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
  }
}