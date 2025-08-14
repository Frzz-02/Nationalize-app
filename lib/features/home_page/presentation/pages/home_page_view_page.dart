import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nationalize_app/features/home_page/domain/entities/people_data.dart';
import 'package:nationalize_app/features/home_page/presentation/blocs/data_bloc.dart';
import 'package:nationalize_app/features/home_page/presentation/widgets/data_box_widget.dart';

class HomePageViewPage extends StatefulWidget {
  const HomePageViewPage({super.key});

  static const String routeName = '/home_page_view';

  @override
  State<HomePageViewPage> createState() => _HomePageViewPageState();
}





class _HomePageViewPageState extends State<HomePageViewPage> {
  TextEditingController search = TextEditingController();
  
  PeopleData localData = PeopleData(
      count: 0, 
      name: "", 
      countries: []
    );
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: const Text('HomePageView'),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,)
        ),

      
      body: Center(
        
        child: SingleChildScrollView(
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                        Container(
                          height: 50,
                          width: 300,
                          child: TextField(
                          controller: search,
                          decoration: const InputDecoration(
                            labelText: 'Masukkan nama',
                            border: OutlineInputBorder(),
                          ),
                                                ),
                        ),


                      SizedBox(width: 3,),
                      
                      
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                        ),
                        child: const Text('Search'),
                        onPressed: () {
                          if (search.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please enter a name')),
                            );
                            return;
                          }
                          context.read<DataBloc>().fetchDataByName(search.text);
                          // Ambil nilai dari controller
                          // String nama = search.text;
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('Halo, $nama!')),
                          // );
                        },
                      ),



                      
                  ]),
                  
                  
                  
                  
                  
              
              SizedBox(height: 10, width: 2,),



              Container(
                width: 800,
                height: 700,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                // margin: const EdgeInsets.only(top: 30),
                child: Stack(
                
                  children: [
                    BlocBuilder<DataBloc, DataState>(
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, status){
                        if (status is DataLoading) {
                          return const Center(child: CircularProgressIndicator());
                          
                          
                          
                        } if (status is DataLoaded) {
                          localData = status.data;
              
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                DataBoxWidget(localData: localData)
                            
                              ],);
                        } 
                        
              
                        if (status is FailureState) {
                          return Center(child: Text(status.message));
                        }
                        
                        
                        return const SizedBox(height: 20,);
                        
                        
                        
                      },
                    )
                  ],
                  
                ),
              ),
            ],
          ),
        )
        
      ),
    );
  }
}
