import 'package:first_flutter/profile_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isChecked = false;
  
  List<Widget> pages = const [
    HomePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions:[
          IconButton(
            onPressed:(){
              debugPrint('actions clicked');
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/appimages/menz.jpeg'),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueGrey,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "this is  a text widget",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    primary:isSwitch ? Colors.green : Colors.blue,
                   ),
                    onPressed: () {
                      debugPrint("elevated button");
                    },
                    child: const Text("elevated button")
              ),
      
              OutlinedButton(onPressed: () {
                    debugPrint("outlined button");
              }, child: const Text("outlined button")),
              
              TextButton(onPressed: () {
                    debugPrint("Text button");
              }, child: const Text("Text button")),
              GestureDetector(
                behavior:HitTestBehavior.opaque,
                onTap: () {
                  debugPrint("got tapped");
                },
                child: const Row(
                  //main axis for a row is the horizontal line
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.blue,
                    ),
                    Text("Row Widget"),
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              Switch(
                value:isSwitch,
                onChanged: (bool newBool) {
                   setState((){
                      isSwitch = newBool;
                   });
              },),
              Checkbox(
                  value: isChecked,
                  onChanged: (bool? newBool) {
                    setState((){
                      isChecked = newBool;
                    });
                  }),
                  Image.network('https://wallpaperaccess.com/full/1909531.jpg')
          ],
        ),
      ),
    );
  }
}
