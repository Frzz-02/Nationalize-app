import '../../domain/entities/country.dart';

class CountryModel extends Country {
 CountryModel({
    required super.countryId,
    required super.probability,
  });


  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      countryId: map['country_id'] as String,
      probability: (map['probability'] as num).toDouble(),
    );
  }
}
