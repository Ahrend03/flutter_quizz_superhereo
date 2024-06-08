import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_quizz_superhereo/models/HeroModel.dart';

void main() {
  runApp(
    MaterialApp(
      home: ImageExplorer(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ImageExplorer extends StatefulWidget {
  @override
  State<ImageExplorer> createState() => _ImageExplorerState();
}

class _ImageExplorerState extends State<ImageExplorer> {
  String heroeName = "";
  int n = 0;
  List<HeroModel> heroesList = [
    HeroModel(
        name: "Batman",
        imageUrl:
            "https://avatars.mds.yandex.net/i?id=5dc81511d2b10327c719ceaf9ba77359210fcc63-9855155-images-thumbs&n=13"),
    HeroModel(
        name: "Superman",
        imageUrl:
            "https://avatars.mds.yandex.net/i?id=1bc9093b8396d3d08289f93d547c30d2268b5983-9863899-images-thumbs&n=13"),
    HeroModel(
        name: "Spiderman",
        imageUrl:
            "https://avatars.mds.yandex.net/i?id=5e8e4aa741480bd2919601426bb5c8a0d993ddeb-8342740-images-thumbs&n=13"),
    HeroModel(
        name: "IronMan",
        imageUrl:
            "https://img.asmedia.epimg.net/resizer/yiQQU22M3OJOr5C9gcK2Vwlyngw=/1472x1104/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/BBKLXDTL45M43FMNMLJJO4GWRM.jpg")
  ];

  // String showName(int index) {
  //   String name = heroesList[index].name;
  //   return name;
  // }

  // @override
  // void initState() {
  //   n = Random().nextInt(heroesList.length);
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  void initState() {
    n = Random().nextInt(heroesList.length);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("PLAY WITH ME")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      heroesList[n].imageUrl,
                    ),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                // child: Image.network(
                //   heroesList[n].imageUrl,
                //   fit: BoxFit.cover,
                // ),
              ),
              Divider(),
              Text("Nombre del heroe: $heroeName"),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      heroeName = heroesList[n].name;
                      setState(() {});
                    },
                    child: Text("Mostrar nombre"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      n = Random().nextInt(heroesList
                          .length); //asignando un valor random entre 0 y el tamaño de la lista (sin tomar el valor del tamaño)
                      //0 y n-1
                      heroeName = "";
                      setState(() {});
                    },
                    child: Text("Siguiente"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}