
import 'package:nationalize_app/features/home_page/domain/entities/people_data.dart';

abstract interface class PeopleDataRepository {
  
  Future<PeopleData> getHomePageById(String name);

}
