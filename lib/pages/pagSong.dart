import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modulos/Drawer_pagSong.dart';
import '../Provider/providerSongs.dart';
import '../class/classSongs.dart';
import '../class/class_words.dart';

class PageSong extends StatefulWidget {
  const PageSong({super.key});
  @override
  State<PageSong> createState() => _PageSongState();
}

class _PageSongState extends State<PageSong> {
  @override
  List<int> clicados = [];
  List<String> palavras = [];

  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context)!.settings.arguments as classSongs;
    final size = MediaQuery.of(context).size;
    final Provider_song providerData = Provider.of(context);

    TextSpan txtClick(String inputTexto, Function(String) nomeFuncao) {
      List<String> separar = inputTexto.split(" ");
      List<TextSpan> textoLista = [];

      for (int index = 0; index < separar.length; index++) {
        String textoPorIndex = "${separar[index]} ";
        final bool selecionado = clicados.contains(index);

        textoLista.add(
          TextSpan(
            text: textoPorIndex,
            style: TextStyle(
                color: selecionado ? Colors.green : Colors.black,
                fontFamily: "Kalan",
                fontSize: 25),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  clicados.add(index);
                });
                nomeFuncao(textoPorIndex);
              },
          ),
        );
      }
      return TextSpan(children: textoLista);
    }

    return SafeArea(
      child: Scaffold(
        drawer: Drawer_PagSong(),
        body: ListView(
          children: [
            Container(
              width: size.width,
              height: 80,
              color: Colors.green,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                argumento.nome,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontFamily: "Kalan"),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  txtClick(argumento.song, (palavra) {
                    setState(() {
                      providerData.addWords(class_words(palavra, "meu sei la"));
                    });
                    print(palavras);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
