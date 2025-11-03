# Initiation au Flux RSS avec Flutter

Une petite application Flutter pour lire et afficher des flux RSS (articles et liens) depuis différentes sources. Ce dépôt contient le code source du projet `mon_flux_rss` (répertoire `mon_flux_rss/`) développé pour l'apprentissage et la démonstration.

## Table des matières

- [Aperçu](#aper%C3%A7u)
- [Fonctionnalités](#fonctionnalit%C3%A9s)
- [Prérequis](#pr%C3%A9requis)
- [Installation et exécution](#installation-et-ex%C3%A9cution)
- [Structure du projet](#structure-du-projet)
- [Tests](#tests)
- [Contribuer](#contribuer)
- [Licence](#licence)

## Aperçu

L'application récupère un flux RSS, parse les éléments et affiche une liste d'articles. Chaque élément de la liste montre un titre, une date et un extrait ; en cliquant on accède au détail de l'article contenant le contenu ou un lien vers la source.

## Fonctionnalités

- Récupération et parsing RSS
- Liste d'articles triés
- Vue détail d'un article
- Compatible mobile (Android/iOS) et Web

## Prérequis

- Flutter (SDK) — version stable recommandée
- Git
- Une cible (simulateur/émulateur, appareil réel, ou navigateur pour web)

Si vous n'avez pas Flutter, installez-le depuis : https://flutter.dev

## Installation et exécution

1. Clonez le dépôt :

	git clone <URL_DU_REPO>
	cd RSS_Flux/mon_flux_rss

2. Récupérez les dépendances :

	flutter pub get

3. Lancez l'application :

	flutter run

Options de build :

- Android APK : `flutter build apk`
- iOS : `flutter build ios` (nécessite macOS et Xcode)
- Web : `flutter build web`

## Structure du projet (points clés)

Le code de l'application se trouve dans le dossier `mon_flux_rss/lib/`.

- `main.dart` — Point d'entrée de l'application.
- `feed_page.dart` — Écran principal affichant la liste des articles.
- `article.dart` — Modèle Dart représentant un article (titre, date, contenu, lien, etc.).
- `feed_parser.dart` — Fonctions pour récupérer et parser les flux RSS.
- `article_tile.dart` — Widget affichant une ligne d'article dans la liste.
- `article_detail_page.dart` — Écran détaillé pour lire l'article complet.

Autres dossiers générés par Flutter : `android/`, `ios/`, `web/`, `build/`, etc.

## Tests

Si des tests sont présents (ou pour exécuter des tests futurs) :

  flutter test

## Contribuer

Contributions bienvenues — forkez, créez une branche, puis ouvrez une pull request.

Quelques recommandations :

- Suivez le style Dart/Flutter (formatter et analyser)
- Écrivez de petits commits atomiques
- Ajoutez des tests pour les nouvelles fonctionnalités

## Licence

Proposez une licence pour votre projet (par exemple MIT). Si vous acceptez, je peux ajouter un fichier `LICENSE` contenant le texte MIT.

---

Si vous voulez, je peux :

- ajouter un `LICENSE` (MIT) ;
- insérer des badges (build, licence) ;
- ajouter des captures d'écran dans `README.md` (il faudra fournir les images) ;
- générer un petit guide CONTRIBUTING plus détaillé.

Dites-moi ce que vous préférez, et j'applique les changements.