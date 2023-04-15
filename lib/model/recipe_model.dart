class RecipeModel {
  int? id;
  String? name;
  String? thumbnailUrl;
  int? totalTimeMinutes;
  Map<String, dynamic>? userRatings;
  List<dynamic>? instructions;
  List<dynamic>? topics;
  bool? isFavorite;

  RecipeModel({
    this.id,
    this.name,
    this.thumbnailUrl,
    this.totalTimeMinutes,
    this.userRatings,
    this.instructions,
    this.topics,
    this.isFavorite,
  });

  RecipeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
    totalTimeMinutes = json['total_time_minutes'];
    userRatings = json['user_ratings'];
    instructions = json['instructions'];
    topics = json['topics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['total_time_minutes'] = this.totalTimeMinutes;
    data['user_ratings'] = this.userRatings;
    data['instructions'] = this.instructions;
    data['topics'] = this.topics;
    // data['isFavorite'] = this.isFavorite;

    return data;
  }
}


// {
//     "name": "",
//     "thumbnail_url": "",
//     "user_ratings": "",
//     "instructions": [
//         ""
//     ],
//     "topics": [
//         ""
//     ]
// }