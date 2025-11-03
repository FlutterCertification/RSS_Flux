/*
  feed_parser.dart

  Utilitaire pour récupérer et parser un flux RSS distant.

  - `FeedParser` est exposé via `FeedParser.shared` (singleton simple).
  - `parseArticles()` renvoie une Future contenant une liste d'`Article` ou null
    si le flux ne contient pas d'items.

  Remarques de sécurité/robustesse :
  - Actuellement la source est codée en dur (`source`). On peut la convertir
    en paramètre ou ajouter une configuration pour la rendre réutilisable.
  - Il manque une gestion d'erreurs réseau (try/catch) pour signaler les
    problèmes de connexion ou de parsing.
*/
import 'dart:convert';

import 'package:mon_flux_rss/article.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';

class FeedParser {
  // Singleton partagé pour usage simple dans l'app.
  static var shared = FeedParser();

  // URL du flux RSS (modifiez si vous souhaitez une autre source).
  final String source = "https://www.francebleu.fr/rss/infos.xml";

  /// Récupère et parse les articles depuis [source].
  ///
  /// Retourne une `List<Article>` si des items sont trouvés, sinon `null`.
  /// Note: la méthode utilise un client HTTP basique. Pour la production,
  /// pensez à ajouter des timeouts, retry et gestion d'erreurs.
  Future<List<Article>?> parseArticles() async {
    final client = http.Client();
    final url = Uri.parse(source);
    final clientResponse = await client.get(url);
    final rssFeed = RssFeed.parse(utf8.decode(clientResponse.bodyBytes));
    final items = rssFeed.items;

    if (items == null) {
      return null;
    } else {
      List<Article> articles = items.map((it) => Article(item: it)).toList();
      return articles;
    }
  }
}