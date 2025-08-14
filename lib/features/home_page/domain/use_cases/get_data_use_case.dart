import 'package:nationalize_app/features/home_page/domain/entities/people_data.dart';

import '../repositories/home_page_repository.dart';

class GetDataUseCase {
  final PeopleDataRepository repository;

  GetDataUseCase({required this.repository});

  Future<PeopleData> call(String name) async {
    return await repository.getHomePageById(name);
  }
}
