# hubot-dvb

[![](https://img.shields.io/npm/v/hubot-dvb.svg)](https://www.npmjs.com/package/hubot-dvb)
[![](https://img.shields.io/david/kiliankoe/hubot-dvb.svg)](http://david-dm.org/kiliankoe/hubot-dvb)

hubot script to get current dvb information

See [`src/dvb.coffee`](src/dvb.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-dvb --save`

Then add **hubot-dvb** to your `external-scripts.json`:

```json
[
  "hubot-dvb"
]
```

## Sample Interaction

```
user1>> hubot dvb Helmholtzstraße
hubot>> 85 Striesen Niederwaldpl. in 6 Minuten
        85 Striesen Niederwaldpl. in 8 Minuten
        85 Löbtau Süd Mohorner Str. in 14 Minuten
        85 Striesen Niederwaldpl. in 19 Minuten

user1>> hubot dvb Helmholtzstraße in 20 Minuten
hubot>> 85 Striesen Niederwaldpl. in 26 Minuten
        85 Striesen Niederwaldpl. in 28 Minuten
        85 Löbtau Süd Mohorner Str. in 34 Minuten
        85 Striesen Niederwaldpl. in 39 Minuten

user1>> hubot find stop zelle
hubot>> Did you mean _Zellescher Weg_?
        http://maps.google.com/maps/api/staticmap?markers=51.028366%2C13.745847&size=400x400&maptype=roadmap&sensor=false&format=png
```
