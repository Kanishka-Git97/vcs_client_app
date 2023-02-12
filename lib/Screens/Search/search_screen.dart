import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vcs_client_app/Components/profile_card.dart';
import 'package:vcs_client_app/Models/doctor.dart';
import 'package:vcs_client_app/Provider/doctor_provider.dart';
import 'package:vcs_client_app/Screens/User/doctor_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<List<Doctor>> result = context.watch<DoctorProvider>().setDoctors();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Text(
                    "Discover the Nearest and Professional Veterinarian"),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    context.read<DoctorProvider>().searchDoctors(value);
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<DoctorProvider>().sort();
                        },
                        icon: const Icon(Icons.sort),
                        splashRadius: 2,
                      ),
                      hintText: "Search",
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _resultList()
              ],
            )
          ],
        ),
      ),
    );
  }

  _resultList() {
    return Builder(builder: (context) {
      var _state = context.watch<DoctorProvider>().homeState;
      if (_state == HomeState.Loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (_state == HomeState.Error) {
        return const Center(child: Text("An Error Occurred!"));
      }
      List<Doctor> doctors = context.watch<DoctorProvider>().doctors;
      print(doctors.length);
      return SizedBox(
        height: 300,
        child: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 2)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        clipBehavior: Clip.antiAlias,
                        child: Image.memory(
                          Base64Decoder()
                              .convert(doctors[index].img.toString()),
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.redAccent,
                          // image: DecorationImage(
                          //   image: NetworkImage(location.image.toString()),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Todo: Get Data from Provider or Previous Screen
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      doctors[index].title.toString() +
                                          " " +
                                          doctors[index].firstName.toString() +
                                          " " +
                                          doctors[index].lastName.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(children: [
                                      Icon(Icons.location_on),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(doctors[index].address.toString()),
                                    ]),
                                    Text('LKR ' +
                                        doctors[index].onlineFee.toString()),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DoctorScreen(
                                                      doctor: doctors[index],
                                                    )));
                                      },
                                      child: const CircleAvatar(
                                          child:
                                              Icon(Icons.more_vert_outlined))),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
