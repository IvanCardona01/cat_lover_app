// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
  id: json['id'] as String,
  name: json['name'] as String,
  temperament: json['temperament'] as String,
  origin: json['origin'] as String,
  description: json['description'] as String,
  lifeSpan: json['life_span'] as String,
  indoor: (json['indoor'] as num?)?.toInt(),
  lap: (json['lap'] as num?)?.toInt(),
  adaptability: (json['adaptability'] as num?)?.toInt(),
  affectionLevel: (json['affection_level'] as num?)?.toInt(),
  childFriendly: (json['child_friendly'] as num?)?.toInt(),
  dogFriendly: (json['dog_friendly'] as num?)?.toInt(),
  energyLevel: (json['energy_level'] as num?)?.toInt(),
  intelligence: (json['intelligence'] as num?)?.toInt(),
  socialNeeds: (json['social_needs'] as num?)?.toInt(),
  strangerFriendly: (json['stranger_friendly'] as num?)?.toInt(),
  rare: (json['rare'] as num?)?.toInt(),
  wikipediaUrl: json['wikipedia_url'] as String?,
  referenceImageId: json['reference_image_id'] as String?,
);

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'life_span': instance.lifeSpan,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'intelligence': instance.intelligence,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'rare': instance.rare,
      'wikipedia_url': instance.wikipediaUrl,
      'reference_image_id': instance.referenceImageId,
    };
