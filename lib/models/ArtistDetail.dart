class ArtistDetail {
  String id = "";
  String name = "";
  int popular = 0;
  int follower = 0;
  String pocket = "";

  ArtistDetail(this.id, this.name, this.popular, this.follower, this.pocket);

  factory ArtistDetail.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') &&
        json.containsKey('name') &&
        json.containsKey('popularity') &&
        json.containsKey('followers') &&
        json.containsKey('images')) {
      return ArtistDetail(json['id'], json['name'], json['popularity'],
          json['followers']['total'], json['images'][0]['url']);
    } else {
      throw ArgumentError("json format incorrect");
    }
  }

  // -- surcharge méthode toString()
  @override
  String toString() {
    return 'id: $id, name: $name, popular: $popular, follower:$follower, pocket: $pocket';
  }
}
