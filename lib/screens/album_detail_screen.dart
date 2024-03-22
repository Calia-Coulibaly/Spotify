import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_spotify_gorouter/models/AlbumDetail.dart';
import '../provider/AlbumProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// The details screen
class AlbumDetailScreen extends StatefulWidget {
  String? id;
  AlbumDetailScreen({super.key, this.id});

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  AlbumProvider albumProvider = AlbumProvider();
  AlbumDetail _detailalbum = AlbumDetail("", "", "", [], "", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Album Detail Screen')),
        body: Center(
            child: Column(children: [
          CachedNetworkImage(
            fit: BoxFit.fitHeight,
            imageUrl: _detailalbum.pocket,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(_detailalbum.name),
          GestureDetector(
            onTap: () => context.go('/a/artistedetails/${_detailalbum.idArtist}') ,
            child: Text(_detailalbum.artist),
          ),
          Text('Liste des chansons'),
          Text(_detailalbum.titre.toString()),
        ])));
  }

  @override
  void initState() {
    _get();
  }

  void _get() async {
    AlbumDetail detail = await albumProvider.fetchAlbumDetail(widget.id);
    print(detail);
    print(_detailalbum.idArtist);
    setState(() {
      _detailalbum = detail;
    });
  }
}
