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
}
