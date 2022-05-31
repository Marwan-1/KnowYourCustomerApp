import 'package:flutter/material.dart';
import 'package:knowurcustomer/pages/upload.dart';
class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Upload()),);
            // Navigate to the second screen when tapped.
          },


          child: const Text('Know Your Customer'),
            style: ElevatedButton.styleFrom
              (
                primary: Colors.deepOrange,
               // onPrimary: Colors.blueGrey,
               // onSurface: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                textStyle: const TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            )
            ),
        ),
      ),
    );
  }
}



