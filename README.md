# Hausuebung-1-flutter

Name: Duc Anh Le
E-Mail: le-duc-anh@web.de
Matrikelnummer: 5513330

## Hausübung 2 – Dashboard und Wetter-API

**Verwendete Wetter-API:** [Open-Meteo](https://open-meteo.com/en/docs) (kostenlos, kein API-Key erforderlich)

**Dashboard-Konzept:** Die Startseite von `dashboard_app` zeigt zwei Bereiche als Karten: eine Wetter-Kachel mit aktuellen Daten für Frankfurt am Main (Temperatur, gefühlte Temperatur, Luftfeuchtigkeit, Wind, Wetterbeschreibung, Aktualisierungszeit) sowie eine Aufgabenübersicht. Details siehe [`dashboard_app/docs/dashboard_konzept.md`](dashboard_app/docs/dashboard_konzept.md).

**Zweites Dashboard-Thema:** Aufgaben-Übersicht (Todo) mit statischen Beispieldaten.

## Hausübung 3 – Deployment einer Flutter-Web-App

**Veröffentlichte App:** `dashboard_app`

**Hosting-Plattform:** Firebase Hosting

**Öffentliche URL:** https://dashboard-app-duc-551333-31d5c.web.app

Die App ist ohne Anmeldung öffentlich erreichbar. Es werden keine privaten API-Keys verwendet, da Open-Meteo ohne Schlüssel auskommt.

### Lokaler Start

    cd dashboard_app
    flutter pub get
    flutter run -d chrome

### Deployment-Vorgehen

1. Web-Fähigkeit geprüft: die App kompiliert und startet fehlerfrei im Browser, Wetterdaten und Aufgabenliste werden angezeigt.
2. Produktions-Build erstellt mit `flutter clean`, `flutter pub get` und `flutter build web`. Ergebnis liegt in `dashboard_app/build/web`.
3. Firebase-Projekt `dashboard-app-duc-551333-31d5c` in der Firebase Console angelegt, Firebase CLI installiert (`npm install -g firebase-tools`) und angemeldet (`firebase login`).
4. Hosting konfiguriert in `dashboard_app/firebase.json` mit `build/web` als Public Directory und Single-Page-Rewrite (`**` -> `/index.html`), damit ein Neuladen der Seite keinen 404 erzeugt.
5. Veröffentlicht mit `firebase deploy --only hosting`.
6. Die öffentliche URL wurde in einem privaten Browserfenster getestet: Startseite, Wetter-Karte und Aufgabenliste funktionieren, ein Reload führt nicht zu einem 404.

Build-Artefakte (`build/`, `.firebase/`) werden nicht versioniert.

## Apps im Repository

- `calculator_app` – Taschenrechner (Hausübung 1)
- `todo_app` – Aufgabenverwaltung (Hausübung 1)
- `dashboard_app` – Dashboard mit Wetter-API (Hausübung 2), veröffentlicht in Hausübung 3
