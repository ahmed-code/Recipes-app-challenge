class RecipeModel {
  String? name;
  String? thumbnailUrl;
  Map<String, dynamic>? userRatings;
  List<dynamic>? instructions;
  List<dynamic>? topics;

  RecipeModel(
      {this.name,
      this.thumbnailUrl,
      this.userRatings,
      this.instructions,
      this.topics});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
    userRatings = json['user_ratings'];
    instructions = json['instructions'];
    topics = json['topics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['user_ratings'] = this.userRatings;
    data['instructions'] = this.instructions;
    data['topics'] = this.topics;
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





