map = require 'map-stream'
coffee = require 'coffee-script'
rext = require 'replace-ext'
cson = require 'cson-safe'

module.exports = ->

  gcson = (file, cb) ->
    data = cson.parse file.contents.toString()
    file.contents = new Buffer JSON.stringify data
    file.path = rext file.path, '.json'

    cb null, file

  return map gcson