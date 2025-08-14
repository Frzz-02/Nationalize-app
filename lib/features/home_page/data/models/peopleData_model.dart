import 'package:nationalize_app/features/home_page/data/models/country_model.dart';

import '../../domain/entities/people_data.dart';

class PeopleDataModel extends PeopleData {
  PeopleDataModel({
    // ini adalah constructor dari class TodosModel yang merupakan turunan dari class Todos
    // constructor ini akan memanggil constructor dari class Todos dengan menggunakan super
    // dan mengisi parameter-parameter yang ada di constructor Todos
    // constructor ini juga memiliki parameter yang sama dengan constructor Todos dan sekaligus membuat field-field yang sama yang di class Todos
    required super.count,
    required super.name,
    required super.countries,
  });




// ini untuk mengonversi data(dari format json/map) dari database ke dalam bentuk objek model (dalam hal ini adalah TodosModel)
  factory PeopleDataModel.fromMap(Map<String, dynamic> map) { //factory ini juga adalah jenis konstructor
    return PeopleDataModel( 
      /*ini artinya kita memanggil kembali constructor TodosModel dan mengisi parameter-parameter yang ada 
        di constructor tersebut untuk memberikan nilai pada setiap field yang ada di class TodosModel*/
      count: map['count'] as int, //baris ini artinya kita memberi tahu dart bahwa map['id'] adalah String (bukan mengkonversi)
      name: map['name'] as String,
      countries: (map['country'] as List)
                    .map((e) => CountryModel.fromMap(e as Map<String, dynamic>))
                    .toList(), //mengkonversi List<dynamic> menjadi List<String>
    );
  }




// // ini untuk mengonversi objek model ke dalam bentuk map untuk dapat disimpan ke dalam database
//   Map<String, dynamic> toMap() {
//     return {
//       'count': count,
//       'name': name,
//       'country': countries,
//     };
//   }
}
