import 'package:flutter/material.dart';
import 'package:svloon2/features/explorer/data/model/salon_model.dart';

class MyListItem {
  final String text;
  bool isSelected;

  MyListItem(this.text, {this.isSelected = false});
}

class ProfileArtistBookPage extends StatefulWidget {
  List<Service> services;
   ProfileArtistBookPage({super.key, required this.services});

  @override
  State<ProfileArtistBookPage> createState() => _ProfileArtistBookPageState();
}

class _ProfileArtistBookPageState extends State<ProfileArtistBookPage> {
  List<MyListItem> _items = [
    MyListItem("Tout"),
    MyListItem("Manicure"),
    MyListItem("Pedicure"),
    MyListItem("Autres"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10,
      ),
       Center(
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Container(
            color: Colors.white,
            child: TextFormField(
              autofocus: false,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
                labelText: "Que cherchez vous ?",
                labelStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.all(30),
                border: InputBorder.none,
                focusColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
        ),
      ),
    
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _items.map((item) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _items.forEach((i) => i.isSelected = false);
                      item.isSelected = true;
                    });
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 10, bottom: 10, right: 0, left: 0),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      item.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: item.isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )),
      
      ListView.builder(
                shrinkWrap: true,
                itemCount: widget.services.length,
                itemBuilder: (context, index) {
                  var services = widget.services[index];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                       
                      },
                      child: SizedBox(
                          height: 160,
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5)),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 800 < 321 ? 150 : 185,
                                                maxHeight: 30),
                                            child: Text(
                                              services.name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 800 < 321 ? 150 : 185,
                                                maxHeight: 30),
                                            child: Text(
                                              '${services.description}',
                                              style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius:
                                                        200.0, // shadow blur
                                                    color: Colors
                                                        .black, // shadow color
                                                    offset: Offset(1.0,
                                                        1.0), // how much shadow will be shown
                                                  ),
                                                ],
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 800 < 321 ? 150 : 185,
                                                maxHeight: 30),
                                            child: Text(
                                              '\$${services.price}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Color.fromRGBO(
                                                    119, 103, 89, 1),
                                                fontSize: 18,
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ])),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.31,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(services.imageUrl),
                                        fit: BoxFit.cover),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              )
                            ],
                          )),
                    ),
                  );
                })
    ]);
  }
}
