import 'package:http/http.dart' as http;
import 'package:projet_spotify_gorouter/models/Tracklist.dart';
import 'dart:convert';
import '../models/Album.dart';
import '../models/AlbumDetail.dart';
import '../models/ArtistDetail.dart';

const token =
    'BQDMSMly7S0CzH8XzfaOjVBhYa2HrUSqwmiasNaZRvUxV2lKI-Jd_pOHgYWyCd2kmYhRePX0PU8G-xmJVwU9tBMEoI3RP9T5gJC_4jCNmDcXhF-rTuk';
const apiAlbumDomain = 'api.spotify.com';
const apiAlbum = 'v1/browse/new-releases';

class AlbumProvider {
  Future<List<Album>> fetchAlbum() async {
    var url = Uri.https(apiAlbumDomain, apiAlbum);
    var data = json.decode(
        (await http.get(url, headers: {'Authorization': 'Bearer $token'}))
            .body);
    List<Album> liste = [];
    for (final album in data['albums']['items']) {
      liste.add(Album.fromJson(album));
    }
    return liste;
  }

  Future<AlbumDetail> fetchAlbumDetail(id) async {
    var apiAlbumDetail = 'v1/albums/$id';
    print(id);
    var url = Uri.https(apiAlbumDomain, apiAlbumDetail);
    var data = json.decode(
        (await http.get(url, headers: {'Authorization': 'Bearer $token'}))
            .body);
    AlbumDetail detail = AlbumDetail.fromJson(data);
    return detail;
  }

  Future<ArtistDetail> fetchArtistDetail(id) async {
    var apiArtistDetail = 'v1/artists/$id';
    print(id);
    var url = Uri.https(apiAlbumDomain, apiArtistDetail);
    var data = json.decode(
        (await http.get(url, headers: {'Authorization': 'Bearer $token'}))
            .body);
    ArtistDetail detail = ArtistDetail.fromJson(data);
    return detail;
  }

  Future<List<Track>> fetchTracklist(id) async {
    var apiTacklist = 'v1/artists/$id/top-tracks';
    var url = Uri.https(apiAlbumDomain, apiTacklist);
    var data = json.decode(
        (await http.get(url, headers: {'Authorization': 'Bearer $token'}))
            .body);
    List<Track> liste = [];
    for (final track in data['tracks']) {
      print(track);
      liste.add(Track.fromJson(track));
    }
    return liste;
  }
}
