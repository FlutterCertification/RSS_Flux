/*
  article_tile.dart

  Widget réutilisable représentant une ligne/tuile d'article dans la liste
  principale. Affiche la date, une image si disponible, le titre et la
  description (extrait).

  Comportement :
  - Tap sur la tuile : navigation vers `ArticleDetailPage`.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_flux_rss/article.dart';
import 'package:mon_flux_rss/article_detail_page.dart';

class ArticleTile extends StatelessWidget {
  // Article fourni au widget — les champs utilisés sont `title`, `description`, `image`, `date`.
  final Article article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Lors du tap, on crée la page de détail et on la pousse dans la pile de navigation.
        final page = ArticleDetailPage(article: article);
        final route = MaterialPageRoute(builder: (context) => page);
        Navigator.of(context).push(route);
      },
      child: Column(
        children: [
          // Affiche la date formatée
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  article.Stringdate(),
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),

          // Image (si présente) dans une Card
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 8,
            child: (article.image != "")
                ? Image.network(
                    article.image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(height: 0),
          ),

          // Titre centré
          Text(
            article.title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 2),

          // Extrait / description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              article.description,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}