import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? image;
  File? image2;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      //final image = await ImagePicker().getImage(source: ImageSource.camera);
    // ignore: unnecessary_null_comparison
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
        } on PlatformException catch (e) { print('Failed to pick image: $e');}
  }
  Future pickImage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
      //final image = await ImagePicker().getImage(source: ImageSource.camera);
      // ignore: unnecessary_null_comparison
      if (image2 == null) return;
      final imageTemporary = File(image2.path);
      setState(() {
        this.image2 = imageTemporary;
      });
    } on PlatformException catch (e) { print('Failed to pick image: $e');}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:const Text('Upload Page'),
      ),
      body:
         SizedBox.expand(
           child: Container(
             //color: Colors.red,
             child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
     //row1
                 Container(child: Text('Upload Your ID'),),
                 Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Expanded(
                         child: Container(
                        //color: Colors.green,
                           child:image !=null ? Image.file(image!,
                           width: 160,
                           height: 160,
                           fit: BoxFit.cover,) :
                           FlutterLogo(size:160 ,),
                    ),
                  ),
                     ),
                      Spacer(flex: 1,),

                     Expanded(
                       child:
                       // otherwise the logo will be tiny
                         // child: ElevatedButton.icon(
                         //   icon: Icon(
                         //     Icons.add_a_photo_rounded,
                         //     color: Colors.blueGrey,
                         //     size: 18.0,
                         //   ),
                         //   label:Text('ID') ,
                         //   onPressed: () => pickImage(),
                         //
                         //
                         //   style: ElevatedButton.styleFrom(
                         //     primary: Colors.white70,
                         //     onPrimary: Colors.blueGrey,
                         //     onSurface: Colors.blue,
                         //     textStyle:  TextStyle(color: Colors.black, fontSize: 15),
                         //     shape:  new RoundedRectangleBorder(
                         //         borderRadius: new BorderRadius.circular(20.0)
                         //     ),
                         //   ),
                         // )
                          OutlinedButton(
                             onPressed: () =>pickImage(),
                             child: Icon(
                               Icons.add_a_photo_rounded,
                               color: Colors.blueGrey,
                               size: 35.0,
                             ),
                             style: OutlinedButton.styleFrom(
                               shape: CircleBorder(),
                               padding: EdgeInsets.all(15),
                               backgroundColor: Colors.white70,
                               shadowColor: Colors.grey,
                               elevation: 2.0,
                             ),
                       ),


                     )
                   ],
                 ),
                 Divider(),
       //row2
                 Container(child: Text('Upload Your Selfie'),),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Expanded(
                         child: Container(
                           //color: Colors.green,
                           child:image2 !=null ? Image.file(image2!,
                             width: 160,
                             height: 160,
                             fit: BoxFit.cover,) :
                           FlutterLogo(size:160 ,),
                         ),
                       ),
                     ),
                     Spacer(flex: 1,),
                     Expanded(
                       child: OutlinedButton(
                         onPressed: () =>pickImage2(),
                         child: Icon(
                           Icons.add_a_photo_rounded,
                           color: Colors.blueGrey,
                           size: 35.0,
                         ),
                         style: OutlinedButton.styleFrom(
                           shape: CircleBorder(),
                           padding: EdgeInsets.all(15),
                           backgroundColor: Colors.white70,
                           shadowColor: Colors.grey,
                           elevation: 2.0,
                         ),
                       ),
                     ),


                   ],
                 ),
                 Divider(),
                 Row(
                   children: [
                     Flexible(
                       child: Container(
                         color: Colors.white,

                       ),
                     ),
                     Expanded(
                       child: Container(
                         color: Colors.blue,
                       ),
                     ),
                     Expanded(
                       child: Container(
                         child: ElevatedButton(
                                         onPressed: () {},
                                          child: Icon(Icons.send),
                                          style: ButtonStyle(
                                            elevation: MaterialStateProperty.all(7.0),
                                          shape: MaterialStateProperty.all(CircleBorder()),
                                            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                                            backgroundColor: MaterialStateProperty.all(Colors.blue), // <-- Button color
                                 overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                                          if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
           }),
         ),
         ),
                       )
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ) ,

    );
  }
}
