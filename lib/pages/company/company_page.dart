import 'package:fitnesssl/constants.dart';
import 'package:fitnesssl/pages/home/home_screen.dart';
import 'package:fitnesssl/pages/messenger/chat_home.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      // Appbar section
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text(
          'BodyDoc Gym',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.48,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(), // navigate to all gym page
              ),
            );
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),

      // body section
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            // gym image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/gym.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),

            SizedBox(height: 50),

            // information section
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.business_outlined,
                      color: yellow,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "No. 24, Athurugiriya Road, Malabe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: yellow,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "011 222 2200 / 077 222 7788",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: yellow,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "contact@bodydoc.lk",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 80),

            // 3 icon buttons section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 78,
                    width: 78,
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.event_note_rounded,
                      color: Colors.black54,
                      size: 42,
                    ),
                  ),
                ),
                // location button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 78,
                    width: 78,
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.black54,
                      size: 44,
                    ),
                  ),
                ),
                // messenger button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatHome(),
                      ),
                    );
                  },
                  child: Container(
                    height: 78,
                    width: 78,
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.forum_rounded,
                      color: Colors.black54,
                      size: 42,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
