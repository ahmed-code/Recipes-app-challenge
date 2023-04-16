import 'package:hive/hive.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 1)
class RecipeModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? thumbnailUrl;
  @HiveField(3)
  int? totalTimeMinutes;
  @HiveField(4)
  Map<String, dynamic>? userRatings;
  @HiveField(5)
  List<dynamic>? instructions;
  @HiveField(6)
  List<dynamic>? components;
  @HiveField(7)
  bool? isFavorite;

  RecipeModel({
    this.id,
    this.name,
    this.thumbnailUrl,
    this.totalTimeMinutes,
    this.userRatings,
    this.instructions,
    this.components,
    this.isFavorite,
  });

  RecipeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
    totalTimeMinutes = json['total_time_minutes'];
    userRatings = json['user_ratings'];
    instructions = json['instructions'];
    components = json['sections'][0]['components'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['thumbnail_url'] = this.thumbnailUrl;
  //   data['total_time_minutes'] = this.totalTimeMinutes;
  //   data['user_ratings'] = this.userRatings;
  //   data['instructions'] = this.instructions;
  //   data['sections'] = this.components;
  //   // data['isFavorite'] = this.isFavorite;

  //   return data;
  // }
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