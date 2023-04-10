import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.orange
      ),
      home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final List todos1 = [];
final List todos2 = [];
String input1 = "";
String input2 = "";

@override
  void initState() {super.initState();}

  final formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My ToDo List")),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                title: Text("Add ToDo List"),
                // content: TextField(
                //   onChanged: (value) {input = value;}
                // ),                
                // actions: [
                //   TextButton(
                //     onPressed: () {
                //       setState(() {
                //         todos.add(input);
                //       });
                //       Navigator.of(context).pop();
                //     },
                //     child: Text("Add"))
                // ],
                content: SingleChildScrollView(
                  child: Form(
                    key: this.formkey,
                      child: Column(children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: '제목'),
                          onChanged: (value) {input1 = value;},
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: '내용'),
                          onChanged: (value) {input2 = value;},
                        ),
                      ],)
                      ),
                    ),
                  actions: [
                     TextButton(
                    onPressed: () {
                      setState(() {
                        todos1.add(input1);
                        todos2.add(input2);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("작성"))
                  ],
              );
          });
        },
        child: Icon(Icons.add, color: Colors.white,)),
      body: ListView.builder(itemCount: todos1.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(todos1[index]),
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              title: Text(todos1[index]),
              subtitle: Text(todos2[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: (() {
                  setState(() {
                    todos1.removeAt(index);
                    todos2.removeAt(index);
                  });
                })),
            ),
          ));
        }),
    );
  }
    
}

