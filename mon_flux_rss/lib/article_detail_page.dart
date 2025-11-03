/*
  article_detail_page.dart

  Page affichant le détail d'un `Article` sélectionné : titre, date,
  image (si présente), description et bouton pour ouvrir l'article
  sur le site d'origine via l'URL.

  Méthode publique importante :
  - `_gotoWebsite()` : essaie d'ouvrir le lien de l'article dans le navigateur
    et renvoie true si l'ouverture a réussi, false sinon.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_flux_rss/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flux Rss"),
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Date de publication (affichée à droite)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Publié le : ${article.date}",
                  style: TextStyle(fontSize: 14, color: Colors.redAccent),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Titre
            Text(
              article.title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Image si présente
            (article.image != "")
                ? Image.network(
                    article.image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(height: 0),

            // Description / contenu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Text(article.description),
            ),

            // Bouton pour ouvrir le site original
            TextButton(
              onPressed: () {
                _gotoWebsite().then((result) {
                  if (!result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Oups un petit problème")),
                    );
                  }
                });
              },
              child: const Text("Vers l'article"),
            )
          ],
        ),
      ),
    );
  }

  /// Tente d'ouvrir l'URL de l'article dans le navigateur.
  ///
  /// Renvoie `true` si l'opération a réussi, `false` sinon.
  Future<bool> _gotoWebsite() async {
    final Uri url = Uri.parse(article.link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      return true;
    } else {
      return false;
    }
  }
}