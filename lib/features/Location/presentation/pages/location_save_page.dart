import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/location_saved_cubit.dart';
import 'save_location.dart';

class LocationSavePage extends StatefulWidget {
  const LocationSavePage({super.key});

  @override
  State<LocationSavePage> createState() => _LocationSavePageState();
}

class _LocationSavePageState extends State<LocationSavePage> {

  @override
  void initState() {
    // TODO: implement initState
        BlocProvider.of<LocationSavedCubit>(context).getSavedPlaces();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SaveLocation(),
            ),);
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Emplacements enregistrés',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 18),
          textAlign: TextAlign.left,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<LocationSavedCubit, LocationSavedState>(
            builder: (context, state) {
              if (state is LocationSavedSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.places.length,
                  itemBuilder: (context, index) {
                      var item = state.places[index];

                    return _buildItemPlaceSave(
                        'Maison', '${item.addressName}', '${item.lon}');
                  },
                );
                
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  ListTile _buildItemPlaceSave(String title, String place, String detail) {
    return ListTile(

      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.place, color: Colors.black, size: 50,),
      
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 16),
        textAlign: TextAlign.left,
      ),
      subtitle: Text(
        '$place',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'Poppins',
            fontSize: 16),
        textAlign: TextAlign.left,
      ),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
