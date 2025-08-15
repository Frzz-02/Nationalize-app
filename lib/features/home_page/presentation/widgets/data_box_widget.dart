import 'package:flutter/material.dart';
import 'package:nationalize_app/features/home_page/domain/entities/people_data.dart';

class DataBoxWidget extends StatelessWidget {
  const DataBoxWidget({
    super.key,
    required this.localData,
  });

  final PeopleData localData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 55, 93, 125), width: 1),
        color: const Color(0xFF799EFF),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(148, 0, 0, 0),
              blurRadius: 0,
              offset: const Offset(10, 10), // changes position of shadow
            ),
        ],),
    

    
    
    
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            margin: const EdgeInsets.only(bottom: 35),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(135, 0, 0, 0), width: 1),
              color: const Color.fromARGB(103, 68, 137, 255),
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 220, 230, 255), Color(0xFF4A8BFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Text("Nama : ${localData.name}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
                Text("Jumlah orang : ${localData.count}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          
          // Text("Countries:", style: TextStyle(color: Colors.white),),
      


          ListView(
            shrinkWrap: true,
            children: localData.countries.map((country) {
              
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 166, 172, 176), width: 1),
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 191, 211, 246),
                ),

                
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://flagcdn.com/w320/${country.countryId.toLowerCase()}.png"),
                      radius: 20,
                    ),
                  ),
                  // leading: Icon(Icons.flag, color: const Color.fromARGB(255, 73, 80, 102),),
                  tileColor: const Color.fromARGB(255, 191, 211, 246),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(3),
                  title: Text(country.countryId, style: TextStyle(color: const Color.fromARGB(255, 73, 80, 102), fontWeight: FontWeight.bold),),
                  subtitle: Text("Probability: ${country.probability.toStringAsFixed(2)}", style: TextStyle(color: const Color.fromARGB(255, 73, 80, 102), fontSize: 14),),
                ),
              );

              
            }).toList(),
          ),
          
            
            
        ],
      ),
    );
  }
}
