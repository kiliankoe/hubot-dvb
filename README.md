# hubot-dvb

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
```
