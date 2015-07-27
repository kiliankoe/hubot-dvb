# Description
#   hubot script to get current dvb information
#
# Configuration:
#
#
# Commands:
#   hubot dvb <stopname> - Output the next 4 upcoming connections for <stopname>
#   hubot dvb <stopname> in <num> - Output the next 4 connections for <stopname> after <num> minutes
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
  robot.respond /dvb\s+(.*)in (\d*)/, (res) ->
    hst = res.match[1]
    vz = res.match[2]
    dvb.monitor hst, vz, 4, (err, data) ->
      res.reply "That didn't seem to work :/ - #{err}" if err?
      res.reply "Couldn't find anything" if data.length == 0
      res.send data.map(format_connection).join('\n') if data.length > 0

  robot.respond /dvb\s+(.*) (?!.*in)/, (res) ->
    hst = res.match[1]
    dvb.monitor hst, 0, 4, (err, data) ->
      res.reply "That didn't seem to work :/ - #{err}" if err?
      res.reply "Couldn't find anything" if data.length == 0
      res.send data.map(format_connection).join('\n') if data.length > 0
