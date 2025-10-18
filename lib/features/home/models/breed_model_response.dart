import 'package:json_annotation/json_annotation.dart';

part 'breed_model_response.g.dart';

class BreedModelResponse {
  final List<BreedModel> breeds;

  const BreedModelResponse({
    required this.breeds,
  });

  factory BreedModelResponse.fromJson(List<dynamic> jsonList) =>
      BreedModelResponse(
        breeds: jsonList
            .map((json) => BreedModel.fromJson(json as Map<String, dynamic>))
            .toList(),
      );

  List<Map<String, dynamic>> toJson() =>
      breeds.map((breed) => breed.toJson()).toList();
}

@JsonSerializable()
class BreedModel {
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  @JsonKey(name: 'life_span')
  final String lifeSpan;
  final int? indoor;
  final int? lap;
  final int? adaptability;
  @JsonKey(name: 'affection_level')
  final int? affectionLevel;
  @JsonKey(name: 'child_friendly')
  final int? childFriendly;
  @JsonKey(name: 'dog_friendly')
  final int? dogFriendly;
  @JsonKey(name: 'energy_level')
  final int? energyLevel;
  final int? intelligence;
  @JsonKey(name: 'social_needs')
  final int? socialNeeds;
  @JsonKey(name: 'stranger_friendly')
  final int? strangerFriendly;
  final int? rare;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  const BreedModel({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    this.indoor,
    this.lap,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.intelligence,
    this.socialNeeds,
    this.strangerFriendly,
    this.rare,
    this.wikipediaUrl,
    this.referenceImageId,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) => _$BreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}