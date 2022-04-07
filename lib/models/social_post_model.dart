class SocialPostsResponse {
  List<Post>? posts;
  int? nextPage;

  SocialPostsResponse({this.posts, this.nextPage});

  SocialPostsResponse.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Post>[];
      json['posts'].forEach((v) {
        posts!.add(Post.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class Post {
  String? uid;
  String? displayName;
  String? photoURL;
  Trip? trip;
  Statistics? statistics;
  String? startDate;

  Post(
      {this.uid,
      this.displayName,
      this.photoURL,
      this.trip,
      this.statistics,
      this.startDate});

  Post.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    photoURL = json['photoURL'];
    trip = json['trip'] != null ? Trip.fromJson(json['trip']) : null;
    statistics = json['statistics'] != null
        ? Statistics.fromJson(json['statistics'])
        : null;
    startDate = json['startDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['photoURL'] = photoURL;
    if (trip != null) {
      data['trip'] = trip!.toJson();
    }
    if (statistics != null) {
      data['statistics'] = statistics!.toJson();
    }
    data['startDate'] = startDate;
    return data;
  }
}

class Trip {
  String? sId;
  String? name;
  List<String>? citiesAround;
  List<String>? categories;
  List<String>? tags;
  List<String>? markers;
  GeoJson? geoJson;
  double? length;
  String? creatorId;
  String? createdAt;

  Trip(
      {this.sId,
      this.name,
      this.citiesAround,
      this.categories,
      this.tags,
      this.markers,
      this.geoJson,
      this.length,
      this.creatorId,
      this.createdAt});

  Trip.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    citiesAround = json['citiesAround'].cast<String>();
    categories = json['categories'].cast<String>();
    tags = json['tags'].cast<String>();
    markers = json['markers'].cast<String>();
    geoJson =
        json['geoJson'] != null ? GeoJson.fromJson(json['geoJson']) : null;
    length = json['length'];
    creatorId = json['creatorId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['citiesAround'] = citiesAround;
    data['categories'] = categories;
    data['tags'] = tags;
    data['markers'] = markers;
    if (geoJson != null) {
      data['geoJson'] = geoJson!.toJson();
    }
    data['length'] = length;
    data['creatorId'] = creatorId;
    data['createdAt'] = createdAt;
    return data;
  }
}

class GeoJson {
  String? type;
  List<Features>? features;

  GeoJson({this.type, this.features});

  GeoJson.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  Geometry? geometry;

  Features({this.type, this.geometry});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    return data;
  }
}

class Geometry {
  List<dynamic>? coordinates;
  String? type;

  Geometry({this.coordinates, this.type});

  Geometry.fromJson(Map<String, dynamic> json) {
    if (json['coordinates'] != null) {
      coordinates = json['coordinates'];
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coordinates != null) {
      data['coordinates'] = coordinates?.toList();
    }
    data['type'] = type;
    return data;
  }
}

class Statistics {
  int? time;
  double? avgSpeed;

  Statistics({this.time, this.avgSpeed});

  Statistics.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    avgSpeed = json['avgSpeed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['avgSpeed'] = avgSpeed;
    return data;
  }
}
