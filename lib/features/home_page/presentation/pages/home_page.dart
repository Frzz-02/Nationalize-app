import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nationalize_app/core/dio_client.dart';
import 'package:nationalize_app/features/home_page/data/repositories/people_data_repository_impl.dart';
import 'package:nationalize_app/features/home_page/presentation/blocs/data_bloc.dart';
import 'package:nationalize_app/features/home_page/presentation/pages/home_page_view_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  static const String routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return
     
        BlocProvider(
          create: (_) => DataBloc(peopleDataRepository: PeopleDataRepositoryImpl(dio: Dio()))..fetchData(),
          child: const HomePageViewPage()
        );
      
    
  }
}
