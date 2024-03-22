class Track {
  String name = "";

  Track(this.name);

  factory Track.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('name')) {
      return Track(json['name']);
    } else {
      throw ArgumentError("json format incorrect");
    }
  }

  // -- surcharge méthode toString()
  @override
  String toString() {
    return 'name: $name';
  }
}


