import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Import Firebase Messaging
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String profileImagePath;

  const HomePage({
    Key? key,
    required this.username,
    required this.profileImagePath,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // ดึง FCM Token
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
      // คุณสามารถเพิ่มโค้ดเพื่อจัดเก็บ Token ในฐานข้อมูลได้
    });

    // จัดการข้อความที่มาถึงขณะเปิดแอป (Foreground Notification)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received in foreground: ${message.notification?.title}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${message.notification?.body}'),
        ),
      );
    });

    // จัดการเมื่อคลิกแจ้งเตือน (เปิดจาก Background/Notification Tray)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
      // คุณสามารถเพิ่มการนำทางไปยังหน้าเฉพาะได้
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('pic/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Greeting and Robot Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'pic/ai.png',
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello ${widget.username}',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'How can I assist you right now?',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // CHAT with DINN Button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 119, 240),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Goto Chat',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'DinDin Chatbot',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'pic/chat.png',
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Other buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Report Button
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/report');
                        },
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 105, 173, 173),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Report',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Report a problem',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // MFU NEWS and History buttons
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          // MFU NEWS Button
                          GestureDetector(
                            onTap: () async {
                              final Uri url = Uri.parse('https://en.mfu.ac.th/en-news.html');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url, mode: LaunchMode.externalApplication);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Could not launch the URL.'),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 70,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 224, 88, 88),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'MFU NEWS',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Icon(Icons.newspaper, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // History Button
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/history');
                            },
                            child: Container(
                              height: 70,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 238, 161, 74),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'History',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Icon(Icons.history, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Logout button in the top-right corner
          Positioned(
            top: 30,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.black),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
