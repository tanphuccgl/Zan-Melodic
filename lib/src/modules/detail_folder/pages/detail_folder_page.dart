import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';

// add dependancy in pubspec.yaml

import 'dart:io' as io;

class DetailFolderPage extends StatefulWidget {
  const DetailFolderPage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<DetailFolderPage> createState() => _DetailFolderPageState();
}

class _DetailFolderPageState extends State<DetailFolderPage> {
  late final String directory;
  late List<FileSystemEntity> files = [];

  void getFiles() async {
    //asyn function to get list of files
    // List<StorageInfo> storageInfo = await PathProvider.getStorageInfo();
    // var root = storageInfo[0].rootDir;
    //   var root = await getExternalStorageDirectory();
    // var root = await getExternalStorageDirectory();

    //storageInfo[1] for SD card, geting the root directory
    // var fm = FileManager(root: root); //
    // files = await fm.filesTree(
    //   excludedPaths: ["/storage/emulated/0/Android"],
    //   extensions: ["mp3"] //optional, to filter files, list only mp3 files
    // );
    // setState(() {}); //update the UI
  }
  void _listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      files = io.Directory("/storage/emulated/0/NCT")
          .listSync(); //use your folder name insted of resume.
    });
    files.map((e) {
      // print(e.uri);
      // print(e.path);
      // print(e.parent);
      // print(e.uri.authority);
      // print(e.uri.data);
      // print(e.uri.fragment);
      // print(e.uri.scheme);
      // print(e.uri.queryParametersAll);
      // print(e.uri.host);
      // print(e.uri.origin);
      // print(e.uri.path);
      // print(e.uri.pathSegments);
      // print(e.uri.port);
      // print(e.uri.userInfo);
      // print(e.uri.query);
      // print(e.uri.queryParameters);
    }).first;
    final OnAudioQuery _audioQuery = OnAudioQuery();

    List<SongModel> something = await _audioQuery.querySongs();
    var a = something.where((e) => e.fileExtension == 'mp3').toList();
    log("levi" + a.toString());
  }

  someName() async {}

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.
    super.initState();
    _listofFiles();
    someName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: files.isEmpty
            ? const Text("Searching Files")
            : ListView.builder(
                //if file/folder list is grabbed, then show here
                itemCount: files.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.amber,
                    child: Card(
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(
                            files[index].path,
                          ),
                          leading: const Icon(Icons.audiotrack),
                          trailing: const Icon(
                            Icons.play_arrow,
                            color: Colors.redAccent,
                          ),
                          onTap: () async {
                            final player = AudioPlayer();
                            await player.setAudioSource(
                                AudioSource.uri(Uri.file(files[index].path)),
                                initialPosition: Duration.zero,
                                preload: true);
                            await player.play();

                            // you can add Play/push code over here
                          },
                        )),
                  );
                },
              ));
  }
}
