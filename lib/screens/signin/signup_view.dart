// ignore_for_file: prefer_const_literals_to_create_immutables
 
import 'package:carpto/services/auth.dart';
import 'package:flutter/material.dart';
 
class SignUp extends StatelessWidget {
  final AuthService _auth = AuthService();
  String email = "";
  String handle = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Welcome to CarpTo!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Sign up to start CARPooling.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
 
            const SizedBox(height: 35),
            //LOGO HERE or above the welcome?
            //Image(image: image)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'email address'
 
                  ),
                      onChanged: (newValue) {
                        email = newValue??email;
                      },
                ),
              ),
            ),
            const SizedBox(height: 10),
 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'username',
                   
                      ),
                      onChanged: (newValue) {
                        handle = newValue??handle;
                      },
                    )
                  
                  ),
                 
                ),
                 const SizedBox(height: 10),
 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'password',
                   
                      ),
                      onChanged: (newValue) {
                        password = newValue??password;
                      },
                    )
 
                  ),
                  
                ),
 
                 const SizedBox(height: 25),
 
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.green),
                ),
              ),
              onPressed: () async {
                  dynamic result =
                      await _auth.registerWithEmailAndPassword(email, password, handle);
                },
              child: const Center(
               
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
              ),
            ),
           
          ),
        );
  }
}