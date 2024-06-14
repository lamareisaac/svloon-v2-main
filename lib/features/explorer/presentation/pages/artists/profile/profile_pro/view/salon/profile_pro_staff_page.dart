import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svloon2/features/explorer/data/model/salon_model.dart';


class ProfileProStaffPage extends StatefulWidget {
  List<Staff> staff;
  ProfileProStaffPage({super.key, required this.staff});

  @override
  State<ProfileProStaffPage> createState() => _ProfileProStaffPageState();
}

class _ProfileProStaffPageState extends State<ProfileProStaffPage> {
  @override
  Widget build(BuildContext context) {
    return widget.staff.isNotEmpty ? 
    Container(
          padding: EdgeInsets.all(15),
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.staff.length,
            itemBuilder: (context, index) {
              var staff = widget.staff[index];
              return Container(
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              "${staff.imageUrl ?? "https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg"}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.staff[index].fullname,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.staff[index].fonction,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ): Center(
                child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 80, 8, 8),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.62,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(234, 234, 234, 1),
                          ),
                          child: const Center(
                            child: Text(
                              "Ce salon n'a pas de staff",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
              );
    
  
}
}