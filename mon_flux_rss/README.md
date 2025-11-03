# mon_flux_rss

README spécifique au module Flutter. Voir aussi le README principal à la racine du dépôt pour un guide complet.

## Démarrage rapide

1. Placez-vous dans le dossier du projet Flutter :

	cd mon_flux_rss

2. Installez les dépendances :

	flutter pub get

3. Lancez l'application :

	flutter run

Pour construire :

- `flutter build apk` (Android)
- `flutter build ios` (iOS — macOS requis)
- `flutter build web` (Web)

## Contenu important

Le dossier `lib/` contient le cœur de l'application :

- `main.dart` — démarrage et configuration des routes.
- `feed_page.dart` — affichage de la liste des articles.
- `feed_parser.dart` — récupération et parsing des flux RSS.
- `article.dart` — modèle des articles.
- `article_tile.dart` — widget pour chaque article dans la liste.
- `article_detail_page.dart` — page affichant le détail d'un article.

## Bonnes pratiques

- Formatez le code : `flutter format .`
- Exécutez l'analyse : `flutter analyze`
- Ajoutez des tests pour les composants non-visuels

## Prochaines améliorations (suggestions)

- Ajout d'un fichier `LICENSE` (ex : MIT)
- Badges CI / build dans le README
- Captures d'écran et GIFs de démonstration

Si vous voulez, je peux appliquer ces améliorations pour rendre le dépôt prêt pour GitHub (LICENSE, images, badges).
