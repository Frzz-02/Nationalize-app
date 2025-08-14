import 'package:dio/dio.dart';
import 'package:nationalize_app/core/dio_client.dart';
import 'package:nationalize_app/features/home_page/data/models/peopleData_model.dart';
import 'package:nationalize_app/features/home_page/domain/entities/people_data.dart';
import 'package:nationalize_app/features/home_page/presentation/pages/home_page.dart';

import '../../domain/repositories/home_page_repository.dart';

class PeopleDataRepositoryImpl implements PeopleDataRepository {
  final Dio dio;
  PeopleDataRepositoryImpl({required this.dio});
  // const HomePageRepositoryImpl();

  // @override
  // Future<List<HomePage>> getHomePageData() async {
    
  // }
  @override
  Future<PeopleData> getHomePageById(String name) async {
    
    final response = await dio.get("https://api.nationalize.io",
        queryParameters: {'name': name}
    );

    return PeopleDataModel.fromMap(response.data);
  }
}
