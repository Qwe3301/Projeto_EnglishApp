import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/providerSongs.dart';

class MakeSongPage extends StatefulWidget {
  const MakeSongPage({super.key});

  @override
  State<MakeSongPage> createState() => _MakeSongPageState();
}

class _MakeSongPageState extends State<MakeSongPage> {
  @override
  Widget build(BuildContext context) {
    final Provider_song itens = Provider.of(context);
    final TextEditingController controllerNome = TextEditingController();
    final TextEditingController controllerSong = TextEditingController();

    void buildSong() {
      
      itens.adicionar(itens.pegarSongs.last.id + 1, controllerNome.text,
          controllerSong.text, 10);
    }

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextField(
                    controller: controllerNome,
                    decoration: InputDecoration(labelText: "Titulo"),
                  ),
                  TextField(
                    controller: controllerSong,
                    maxLines: 12,
                    decoration: InputDecoration(labelText: "Song"),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () => buildSong(), child: const Text("Criar"))
            ],
          ),
        ),
      ),
    ));
  }
}
