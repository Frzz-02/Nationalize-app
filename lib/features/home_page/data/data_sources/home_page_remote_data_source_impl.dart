import 'home_page_remote_data_source.dart';

class HomePageRemoteDataSourceImpl implements HomePageRemoteDataSource {
  const HomePageRemoteDataSourceImpl();

  Future<T> _run<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw e;
    }
  }
}
