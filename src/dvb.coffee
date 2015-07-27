# Description
#   hubot script to get current dvb information
#
# Configuration:
#
#
# Commands:
#   hubot dvb <stopname> - Output the next 4 upcoming connections for <stopname>
#   hubot dvb <stopname> in <num> - Output the next 4 connections for <stopname> after <num> minutes
#   hubot find stop <searchString> - Try to locate a stop with a name similar to <searchString>
#
#
# Notes:
#
#
# Author:
#   Kilian Koeltzsch <me@kilian.io>

dvb = require 'dvbjs'

format_connection = (connection) ->
    "#{connection.line} #{connection.direction} in #{connection.arrivaltime} Minuten"

module.exports = (robot) ->
  # Match "dvb zellescher weg"
  robot.respond /dvb\s+(.*) (?!.*in)/, (res) ->
    hst = res.match[1]
    dvb.monitor hst, 0, 4, (err, data) ->
      res.reply "That didn't seem to work :/ - #{err}" if err?
      if data.length == 0
        res.reply "Couldn't find anything"
        return
      res.send data.map(format_connection).join('\n')

  # Match "dvb zellescher weg in 10 minuten"
  robot.respond /dvb\s+(.*)in (\d*)/, (res) ->
    hst = res.match[1]
    vz = res.match[2]
    dvb.monitor hst, vz, 4, (err, data) ->
      res.reply "That didn't seem to work :/ - #{err}" if err?
      if data.length == 0
        res.reply "Couldn't find anything"
        return
      res.send data.map(format_connection).join('\n')

  # Match "find stop zelle"
  robot.respond /find stop\s+(.*)/, (res) ->
    stop = res.match[1]
    dvb.find stop, (err, data) ->
      res.reply "That didn't seem to work :/ - #{err}" if err?
      if data.length == 0
        res.reply "Couldn't find anything for _#{stop}_"
        return
      searchString = encodeURIComponent "#{data.coords[0]},#{data.coords[1]}"
      res.send "Did you mean _#{data.stop}_?\nhttp://maps.google.com/maps/api/staticmap?markers=#{searchString}&size=400x400&maptype=roadmap&sensor=false&format=png"
