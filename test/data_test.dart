import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nationalize_app/features/home_page/data/repositories/people_data_repository_impl.dart';
import 'package:nationalize_app/features/home_page/domain/use_cases/get_data_use_case.dart';

void main() {
  test('Ambil data dari API Nationalize.io', () async {
    final dio = Dio();
    final repository = PeopleDataRepositoryImpl(dio: dio);
    final getData = GetDataUseCase(repository: repository);

    // Panggil API langsung
    final result = await getData("Haryo");

    // Print untuk ngecek
    print(result);

    // Pastikan hasilnya sesuai
    expect(result, isNotNull);
  });
}
