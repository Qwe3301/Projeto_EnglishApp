import 'package:english_app/pages/Home.dart';
import 'package:english_app/pages/Song.dart';
import 'package:english_app/pages/makeSong.dart';
import 'package:english_app/pages/pagSong.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/providerSongs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Provider_song(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(),
          '/songPage': (_) => const songPage(),
          '/makeSong': (_) => const MakeSongPage(),
          '/pageSong': (_) => const PageSong(),
        },
      ),
    );
  }
}
