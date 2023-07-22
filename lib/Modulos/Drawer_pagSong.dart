import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/providerSongs.dart';

class Drawer_PagSong extends StatefulWidget {
  Drawer_PagSong({super.key});
  @override
  State<Drawer_PagSong> createState() => _Drawer_PagSongState();
}

class _Drawer_PagSongState extends State<Drawer_PagSong> {
  @override
  Widget build(BuildContext context) {
    final Provider_song providerData = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      height: size.height,
      width: size.width - 30,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25))),
            alignment: Alignment.center,
            child: const Text(
              "Palavras desconhecidas",
              style: TextStyle(fontFamily: "Kalan", fontSize: 25),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(25))),
            height: 470,
            child: ListView.builder(
              itemCount: providerData.words.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(top: 10),
                width: 10,
                height: index == 2 ? 200 : 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green),
                child: Column(
                  children: [
                    Text(providerData.words[index].word_en),
                    clicado(index)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget clicado(int index) {
    var texto = Text('');

    if (index == 2) {
      return texto = Text("dsasda");
    }
    return texto;
  }
}
