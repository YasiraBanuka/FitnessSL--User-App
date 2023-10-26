import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitnesssl/constants.dart';
import 'package:fitnesssl/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text(
          'Messenger',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.52,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage: const AssetImage(
                      'images/profile.png',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Username",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                    Card(
                      color: Colors.grey,
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: FutureBuilder<String?>(
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text(
                                'Full Name Loading...',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              );
                            } else if (snapshot.hasError || !snapshot.hasData) {
                              return const Text(
                                'Name Error',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              );
                            } else {
                              return Text(
                                'firstName lastName',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                    Card(
                      color: Colors.grey,
                      margin: const EdgeInsets.only(
                        top: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: FutureBuilder<String?>(
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text(
                                'Email address Loading...',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              );
                            } else if (snapshot.hasError || !snapshot.hasData) {
                              return const Text(
                                'Email address: Error',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              );
                            } else {
                              return Text(
                                'Email',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 5,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Text(
                          "65kg",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 5,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Text(
                          "160cm",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Height",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 5,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Text(
                          "20yo",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 17, 0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Text("edit profile page"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 225, 1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 55,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
