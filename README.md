# Haus-bung-1-flutter
Name: Duc Anh Le
E-mail: le-duc-anh@web.de
Matrikelnummer: 5513330
<!--
Diesen Block ans Ende der bestehenden README.md im Wurzelverzeichnis
des Repositorys anhängen (Name/E-Mail/Matrikelnummer stehen dort
bereits oben aus Hausübung 1).
-->

## Hausübung 2 – Dashboard und Wetter-API

**Verwendete Wetter-API:** [Open-Meteo](https://open-meteo.com/en/docs)
(kostenlos, kein API-Key erforderlich)

**Dashboard-Konzept:** Die Startseite von `dashboard_app` zeigt zwei Bereiche
als Karten: eine Wetter-Kachel mit aktuellen Daten für Frankfurt am Main
(Temperatur, gefühlte Temperatur, Luftfeuchtigkeit, Wind, Wetterbeschreibung,
Aktualisierungszeit) sowie eine Aufgabenübersicht. Details siehe
[`docs/dashboard_konzept.md`](docs/dashboard_konzept.md).

**Zweites Dashboard-Thema:** Aufgaben-Übersicht (Todo) mit statischen
Beispieldaten – zeigt die Anzahl offener Aufgaben und eine abhakbare Liste.

**App starten:**

```
cd dashboard_app
flutter pub get
flutter run
```
