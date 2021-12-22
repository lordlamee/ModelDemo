import 'package:flutter/material.dart';
import 'package:meme_api/data_layer.dart';
import 'package:meme_api/meme_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MemeHome(),
    );
  }
}

class MemeHome extends StatefulWidget {
  const MemeHome({Key? key}) : super(key: key);

  @override
  _MemeHomeState createState() => _MemeHomeState();
}

class _MemeHomeState extends State<MemeHome> {
  List<MemeModel> models = [];
  @override
  void initState() {
    super.initState();
    getMemes();
  }

  Future<void> getMemes() async {
    final fetchedList = await MemeDataLayer.fetchMemes();
    if (fetchedList != null) {
      models.addAll(fetchedList);
      print("MODEL LENGHT ${models.length}");
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(models[index].name ?? ''),
          ),
          itemCount: models.length,
        ),
        // child: ListView(
        //
        //   children: [
        //     ListTile(
        //       title: Text("MEME 1"),
        //     ),
        //     ListTile(
        //       title: Text("MEME 2"),
        //     ),
        //     ListTile(
        //       title: Text("MEME 3"),
        //     ),
        //     ListTile(
        //       title: Text("MEME 4"),
        //     ),
        //     ListTile(
        //       title: Text("MEME 5"),
        //     ),
        //     ListTile(
        //       title: Text("MEME 6"),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
