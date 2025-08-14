import 'package:nationalize_app/features/home_page/domain/entities/country.dart';

class PeopleData {
  final int count;
  final String name;
  final List<Country> countries;

  PeopleData({
    required this.count,
    required this.name,
    required this.countries,
  });

}
