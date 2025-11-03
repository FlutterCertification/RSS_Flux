/*
  feed_page.dart

  Page principale affichant la liste des articles récupérés depuis
  un flux RSS. Utilise `FeedParser.shared` pour obtenir les données
  et construit une ListView d'`ArticleTile`.

  Comportement attendu :
  - Charge les articles lors de l'initialisation (initState)
  - Met à jour l'état avec la liste d'articles récupérés
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_flux_rss/article.dart';
import 'package:mon_flux_rss/article_tile.dart';
import 'package:mon_flux_rss/feed_parser.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeedPageState();
  }
}

class FeedPageState extends State<FeedPage> {

  final parser = FeedParser.shared;
  // Liste locale des articles affichés dans la page.
  // Elle est initialement vide et remplie après l'appel async à parser.parseArticles().
  List<Article> marticles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parser.parseArticles().then((articles) {
      if (articles != null) {
        setState(() {
          this.marticles = articles;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flux RSS"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) => ArticleTile(article: marticles[index])),
          separatorBuilder: ((context, index) => Divider(color: Theme.of(context).colorScheme.inversePrimary)),
          itemCount: marticles.length),

    );
  }
}