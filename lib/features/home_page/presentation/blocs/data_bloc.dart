import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nationalize_app/features/home_page/data/repositories/people_data_repository_impl.dart';
import 'package:nationalize_app/features/home_page/domain/entities/people_data.dart';
import 'package:nationalize_app/features/home_page/domain/repositories/home_page_repository.dart';
import 'package:nationalize_app/features/home_page/presentation/pages/home_page.dart';

part 'data_state.dart';

class DataBloc extends Cubit<DataState> {
  final PeopleDataRepositoryImpl peopleDataRepository;
  DataBloc({required this.peopleDataRepository}) : super(InitialState());



  void fetchData() async {
    emit(DataLoading());

    try {
      
      final data = await peopleDataRepository.getHomePageById("Haryo");
      emit(DataLoaded(data: data));
      
    } catch (e) {
      emit(FailureState("Failed to load data: $e"));
    }
  }
  
  void fetchDataByName(String name) async {
    emit(DataLoading());

    try {
      
      final data = await peopleDataRepository.getHomePageById(name);
      emit(DataLoaded(data: data));
      
    } catch (e) {
      emit(FailureState("Failed to load data: $e"));
    }
  }
}
