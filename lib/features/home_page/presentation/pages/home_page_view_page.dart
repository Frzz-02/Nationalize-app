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
          title: const Text('HomePage'),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,)
        ),

      
      body: Center(
        
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                            Container(
                                margin: EdgeInsets.only(right: 0),
                                height: 49,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF748DAE),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(13),
                                    bottomLeft: Radius.circular(13)
                                  )
                                ),
                                child: Icon(Icons.search, color: const Color.fromARGB(203, 255, 255, 255),)
                              ),




                          Container(
                            margin: EdgeInsets.only(left: 0),
                            height: 50,
                            width: 400,
                            child: TextField(
                            controller: search,
                            decoration: InputDecoration(
                              labelText: 'Masukkan nama',
                              
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(13),
                                  bottomRight: Radius.circular(13)
                                )
                              ),

                              
                            ),
                                                  ),
                          ),
                
                
                        SizedBox(width: 10,),
                        
                        
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
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
              ),
                  
                  
                  
                  
                  
              
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
