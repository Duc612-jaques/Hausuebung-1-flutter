# Dashboard-Konzept

## Welche Informationen werden auf dem Dashboard angezeigt?

Die Startseite zeigt zwei Bereiche als Karten untereinander:

1. **Wetter** – aktuelle Wetterdaten für Frankfurt am Main
2. **Aufgaben** – eine einfache Todo-Übersicht mit offenen und erledigten Punkten

## Wie ist die Startseite grob aufgebaut?

- Überschrift ("Mein Dashboard") mit kurzem Untertitel
- darunter die Wetter-Karte
- darunter die Aufgaben-Karte
- beide Karten sind einheitlich gestaltet (Titel mit Icon, Trennlinie, Inhalt)
- die Seite ist vertikal scrollbar, damit sie auch auf kleinen Bildschirmen
  lesbar bleibt

ASCII-Skizze:

```
┌─────────────────────────────────────┐
│ Mein Dashboard                       │
│ Übersicht über Wetter und Aufgaben   │
│                                       │
│ ┌───────────────────────────────────┐ │
│ │ ☀ Wetter – Frankfurt am Main      │ │
│ │ 21.4°C   Teilweise bewölkt        │ │
│ │ Gefühlt  Luftfeuchtigkeit  Wind   │ │
│ │ Aktualisiert: 14:32 Uhr           │ │
│ └───────────────────────────────────┘ │
│                                       │
│ ┌───────────────────────────────────┐ │
│ │ ☑ Aufgaben                        │ │
│ │ 3 offene Aufgaben                 │ │
│ │ ☐ Hausübung 2 abgeben              │ │
│ │ ☑ Wetter-API testen                │ │
│ │ ☐ README aktualisieren             │ │
│ └───────────────────────────────────┘ │
└─────────────────────────────────────┘
```

## Welche Wetterdaten werden verwendet?

Über die Open-Meteo-API (kein API-Key nötig) werden für Frankfurt am Main
(Breite 50.58, Länge 8.68) abgerufen:

- aktuelle Temperatur
- gefühlte Temperatur
- relative Luftfeuchtigkeit
- Windgeschwindigkeit
- Wettercode (in Klartext übersetzt, z. B. "Teilweise bewölkt")
- Zeitpunkt der letzten Aktualisierung

## Welches zweite Thema wurde gewählt und warum passt es in das Dashboard?

Als zweites Thema wurde eine **Aufgabenübersicht (Todo)** gewählt. Sie zeigt
die Anzahl offener Aufgaben sowie eine kurze Liste, deren Einträge per
Checkbox abgehakt werden können. Das Thema passt gut zu einem persönlichen
Dashboard, weil es – ähnlich wie das Wetter – eine Information liefert, die
man sich morgens auf einen Blick anschauen möchte, und es lässt sich
inhaltlich an die bereits bestehende `todo_app` aus Hausübung 1 anknüpfen.
