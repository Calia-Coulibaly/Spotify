class AlbumDetail {
  String id = "";
  String name = "";
  String artist = "";
  List titre = [];
  String pocket = "";
  String idArtist = "";

  AlbumDetail(this.id, this.name, this.artist, this.titre, this.pocket, this.idArtist);

  factory AlbumDetail.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') &&
        json.containsKey('name') &&
        json.containsKey('artists') &&
        json.containsKey('name') &&
        json.containsKey('images') &&
        json.containsKey('id') ) {

  List<String> liste = [];
    for (var i=0; i<json['tracks'].length; i++) {
      liste.add(json['tracks']['items'][i]['name']);
    }
      return AlbumDetail(json['id'], json['name'], json['artists'][0]['name'],
          liste, json['images'][0]['url'], json['artists'][0]['id']);
    } else {
      throw ArgumentError("json format incorrect");
    }
  }

  // -- surcharge méthode toString()
  @override
  String toString() {
    return 'id: $id, name: $name, artist: $artist,  pocket: $pocket, idArtist: $idArtist';
  }
}

