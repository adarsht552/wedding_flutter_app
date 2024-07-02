import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirstPage extends StatelessWidget {
  final String imagePath =
      'homePage1/vertical-1606200906-transformed 1.png'; // Path relative to Firebase Storage bucket

  Future<String> getDownloadUrl() async {
    try {
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error getting download URL: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: getDownloadUrl(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No image found'));
          } else {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data!),
                      fit: BoxFit.cover, // Cover the entire container
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20, // Adjust as needed
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Text(
                        'Create 𝒎𝒆𝒎𝒐𝒓𝒊𝒆𝒔 that last a life time',
                        style: TextStyle(
                            color: Color.fromARGB(237, 226, 244, 226),
                            fontSize: 25,
                            fontFamily: AutofillHints.birthday),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 50),
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 215, 217, 222),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () async {
                              // Handle button 1 action
                              await FirebaseAuth.instance.signOut();
                            },
                            child: const Text(
                              'Join Us',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 50),
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 215, 217, 222),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              // Handle button 2 action
                              Navigator.pushNamed(context, '/SingUp');
                            },
                            child:
                                Text('Sign In', style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
