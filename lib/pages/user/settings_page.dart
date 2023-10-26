import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesssl/components/bottom_navbar.dart';
import 'package:fitnesssl/constants.dart';
import 'package:fitnesssl/pages/auth/login_page.dart';
import 'package:fitnesssl/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // sign user out
  void signOut(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();

    // Navigate to the login page after signing out
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LoginPage(), // Replace with your login page
    ));
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final User? user = FirebaseAuth.instance.currentUser;
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      backgroundColor: darkBlue,
      // body section
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: users.doc(user!.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (!snapshot.hasData) {
              return Text(
                  "No data available"); // Handle the case where there's no data.
            }

            final data = snapshot.data!.data() as Map<String, dynamic>;
            final name = data['name'] ?? "Name not found";
            final email = data['email'] ?? "Email not found";

            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // profile info section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'images/boy2.jpg',
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.44,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // height, weight & age section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: ShapeDecoration(
                          color: Color(0xFF434B53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '160cm',
                              style: TextStyle(
                                color: Color(0xFFFBB731),
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.44,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Height',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.44,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 90,
                        decoration: ShapeDecoration(
                          color: Color(0xFF434B53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '65kg',
                              style: TextStyle(
                                color: Color(0xFFFBB731),
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.44,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Weight',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.44,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 90,
                        decoration: ShapeDecoration(
                          color: Color(0xFF434B53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '23Y',
                              style: TextStyle(
                                color: Color(0xFFFBB731),
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.44,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Age',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.44,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // next payement date
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Next Payment Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.44,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 22,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // account section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.44,
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                        height: 1,
                        thickness: 1,
                      ),
                      SizedBox(height: 20),
                      // personal data
                      Row(
                        children: [
                          Icon(
                            Icons.person_2_outlined,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Personal Data',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.44,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // achievements
                      Row(
                        children: [
                          Icon(
                            Icons.file_copy_outlined,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Achievements',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.44,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // activity history
                      Row(
                        children: [
                          Icon(
                            Icons.pie_chart_outline_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Activity History',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.44,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // like
                      Row(
                        children: [
                          Icon(
                            Icons.bookmark_border_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Like',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.44,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // notification section
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Notification',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 22,
                  //         fontWeight: FontWeight.w700,
                  //         letterSpacing: -0.44,
                  //       ),
                  //     ),
                  //     SizedBox(height: 8),
                  //     Divider(
                  //       color: Colors.grey,
                  //       height: 1,
                  //       thickness: 1,
                  //     ),
                  //     SizedBox(height: 10),
                  //     // pop-up notification
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           Icons.notifications_none_rounded,
                  //           size: 22,
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(width: 10),
                  //         Text(
                  //           'Pop-up Notification',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 22,
                  //             fontWeight: FontWeight.w400,
                  //             letterSpacing: -0.44,
                  //           ),
                  //         ),
                  //         Spacer(),
                  //         // toggle button
                  //         Transform.scale(
                  //           scale: 0.8,
                  //           child: Switch(
                  //             value: true,
                  //             onChanged: (value) {},
                  //             activeColor: Color(0xFFFBB731),
                  //             activeTrackColor: Color(0xFF434B53),
                  //             inactiveThumbColor: Color(0xFFFBB731),
                  //             inactiveTrackColor: Color(0xFF434B53),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),

                  // SizedBox(height: 8),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(height: 20),

                  // sign out button
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: ElevatedButton(
                      onPressed: () => signOut(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: yellow,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
