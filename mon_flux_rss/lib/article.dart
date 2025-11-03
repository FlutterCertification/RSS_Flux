/*
  article.dart

  Modèle représentant un article issu d'un flux RSS.

  Usage :
    Article(articleItem)

  Fournit des getters pour accéder aux propriétés en rendant les champs
  non-null via des valeurs par défaut (chaîne vide ou date actuelle).
*/
import 'package:webfeed/domain/rss_item.dart';
import 'package:intl/intl.dart';

class Article {
  // Champs privés initialisés depuis le RssItem
  String? _title;
  String? _description;
  String? _link;
  DateTime? _pubDate;
  String? _imageUrl;

  // Getters publics — toujours non-null (valeurs par défaut si nécessaires).
  String get title => _title ?? "";
  String get description => _description ?? "";
  String get link => _link ?? "";
  DateTime get date => _pubDate ?? DateTime.now();
  String get image => _imageUrl ?? "";

  // Construit un Article à partir d'un `RssItem` (webfeed).
  Article({required RssItem item}) {
    _title = item.title;
    _description = item.description;
    _pubDate = item.pubDate;
    _link = item.link;
    _imageUrl = item.enclosure?.url;
  }

  /// Retourne une représentation lisible de la date (ex: "mardi 3 novembre 2020").
  /// Le format utilisé suit la locale active (voir initialisation dans `main.dart`).
  String Stringdate() {
    DateFormat dateFormat = DateFormat.yMMMMEEEEd();
    String str = dateFormat.format(date);
    return str;
  }
}