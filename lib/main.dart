import 'package:flutter/material.dart';
import 'listhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  String name = "";
  String phone = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("contact app"),
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: ((context, index) {
            return ContactCard(
                name: contacts[index]['name'].toString(),
                phone: contacts[index]["phone"].toString());
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await openDialog();
          setState(() {
            contacts.add(
                {'name': namecontroller.text, 'phone': phonecontroller.text});
          });
        },
        splashColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Add New Contact : "),
            content: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: namecontroller,
                        autofocus: true,
                        decoration: const InputDecoration(hintText: "Name:"),
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: phonecontroller,
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: "Phone Number:"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: submit,
                        child: const Text("Add"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));

  void submit() {
    Navigator.of(context).pop(namecontroller.text);
  }
}
