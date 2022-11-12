import 'package:adv_random_pepole_app/helpers/Api_helpers.dart';
import 'package:flutter/material.dart';

import '../models/randomuserModels.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle subTitleTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22);
  TextStyle textStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);
  TextStyle titleTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          "Random People Data ",
          style: TextStyle(color: Colors.pink),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: FutureBuilder(
          future: APIHelper.apiHelper.getUsersData(),
          builder: (context, AsyncSnapshot<List<RandomUser>?> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                children: snapshot.data!
                    .map(
                      (e) => SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          color: Colors.cyan,
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(e.imageUrl),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${e.name} ${e.firstName} ${e.lastName}",
                                style: const TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(e.email,
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                padding: const EdgeInsets.all(30),
                                height:
                                    MediaQuery.of(context).size.height * 0.47,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(top: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Gender",
                                            style: subTitleTextStyle),
                                        Text(
                                          e.gender,
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Age", style: subTitleTextStyle),
                                        Text(
                                          "${e.age}",
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Address", style: subTitleTextStyle),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${e.area}, ${e.city}, ${e.state}, ${e.country} ${e.pincode}",
                                      style: textStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Contact Number",
                                        style: subTitleTextStyle),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      e.phone,
                                      style: textStyle,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ),
                    )
                    .toList(),
              );
            } else {
              return const Center(
                child: const CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
