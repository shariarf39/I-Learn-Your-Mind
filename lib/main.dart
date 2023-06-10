import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _key = GlobalKey<FormState>();
  final tex = TextEditingController();
   String name="", dis ="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('I can Learn Your Mind'),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Think of a number between 1 and 10.'),
                ),

                Form(
                  key: _key,
                  child: TextFormField(
                    controller: tex,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Number",
                      labelText: "Enter Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3)
                      )
                    ),
                    validator: (val){

                      if(val!.isEmpty){
                        return "Please Enter Your Number";
                      }

                      int a;
                      a =int.parse(tex.text);
                      if(a<1||a>10){
                        return "Enter Number between 1 to 10";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      if(_key.currentState!.validate()){

                          name = tex.text;
                          dis = "You're thinking of the number ";

                      }
                      else
                        {
                          name = "";
                          dis = "";
                        }
                    });

                  }, child: Text('Read My Mind')),
                ),
                Text("$dis $name",style: TextStyle(
                  fontSize: 30,


                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
