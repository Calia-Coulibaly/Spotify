class Album {
  String id = "";
  String name = "";
  String artist = "";
  String date = "";
  String pocket = "";

  Album(this.id, this.name, this.artist, this.date, this.pocket);

  factory Album.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') &&
        json.containsKey('name') &&
        json.containsKey('artists') &&
        json.containsKey('release_date') &&
        json.containsKey('images')) {
      return Album(json['id'], json['name'], json['artists'][0]['name'],
          json['release_date'], json['images'][0]['url']);
    } else {
      throw ArgumentError("json format incorrect");
    }
  }

  // -- surcharge méthode toString()
  @override
  String toString() {
    return 'id: $id, name: $name, artist: $artist, date: $date, pocket: $pocket';
  }
}


