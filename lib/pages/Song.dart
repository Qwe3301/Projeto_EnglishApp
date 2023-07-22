import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Modulos/sonsBotao.dart';
import '../Provider/providerSongs.dart';

class songPage extends StatefulWidget {
  const songPage({super.key});

  @override
  State<songPage> createState() => _songPageState();
}

class _songPageState extends State<songPage> {
  @override
  Widget build(BuildContext context) {
    final Provider_song dateSongProvide = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          width: 280,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                width: 180,
                                child: const TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none)),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Icon(Icons.search)),
                            ],
                          )),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.import_export_rounded,
                        ),
                      ),
                    ],
                  ),
                  Text("Musica atual ${dateSongProvide.pegarSongs.length}"),
                  SizedBox(
                    height: 450,
                    child: ListView.builder(
                      itemCount: dateSongProvide.pegarSongs.length,
                      itemBuilder: (context, index) => SonsBotao(i: index),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () => {
                    Navigator.of(context).pushNamed("/makeSong"),
                  },
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
