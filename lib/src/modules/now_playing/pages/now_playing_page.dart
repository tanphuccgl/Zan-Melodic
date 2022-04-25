import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({@PathParam('id') required this.id, this.data, Key? key})
      : super(key: key);
  final XTracks? data;
  final String id;

  @override
  Widget build(BuildContext context) {
    final _pTop = MediaQuery.of(context).padding.top;
    final _tracks = data ?? XTracks.empty();
    return Scaffold(
      backgroundColor: MyColors.colorBackground,
      body: Padding(
          padding: EdgeInsets.fromLTRB(40, _pTop, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Now Playing',
                style: Style.textTheme().displaySmall,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(_tracks.image), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(20, 30),
                          color: MyColors.colorShadowImageNowPlaying
                              .withOpacity(0.25),
                        )
                      ]),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: '${_tracks.name}\n',
                    style: Style.textTheme().displayLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: _tracks.author,
                          style: Style.textTheme().titleMedium!.copyWith(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: MyColors.colorGray))
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shuffle,
                        size: 20,
                        color: MyColors.colorWhite,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.loop,
                        size: 20,
                        color: MyColors.colorWhite,
                      ))
                ],
              )
            ],
          )),
    );
  }
}
