import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../provider/AlbumProvider.dart';
import 'package:projet_spotify_gorouter/models/ArtistDetail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/Tracklist.dart';

// -- detail d'un artiste
class ArtistDetailScreen extends StatefulWidget {
  String? id;
  ArtistDetailScreen({super.key, this.id});

  @override
  State<ArtistDetailScreen> createState() => _ArtistDetailScreenState();
}

class _ArtistDetailScreenState extends State<ArtistDetailScreen> {
  AlbumProvider albumProvider = AlbumProvider();
  ArtistDetail _detailartist = ArtistDetail("", "", 0, 0, "");
  List<Track> _tracklist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Artist Info')),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          CachedNetworkImage(
            fit: BoxFit.fitHeight,
            imageUrl: _detailartist.pocket,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(_detailartist.name),
          Text('N°' + _detailartist.popular.toString()),
          Text('Nombre de follower : ' + _detailartist.follower.toString()),
          Text('Liste des chansons'),
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _tracklist.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_tracklist[index].name),
              );
            },
            shrinkWrap: true,
          ),
        ]))));
  }

  @override
  void initState() {
    _get();
    _getTrack();
  }

  void _get() async {
    ArtistDetail detail = await albumProvider.fetchArtistDetail(widget.id);
    print(detail);
    setState(() {
      _detailartist = detail;
    });
  }

  void _getTrack() async {
    List<Track> liste = [];
    liste = await albumProvider.fetchTracklist(widget.id);
    print(liste);
    setState(() {
      _tracklist.addAll(liste);
    });
  }
}
