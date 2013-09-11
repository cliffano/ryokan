var bag = require('bagofcli'),
  fs = require('fs'),
  Ryokan = require('./ryokan');

function _deliciousScreenshot(args) {
  var ryokan = new Ryokan(),
    opts = { type: 'png', wait: 200 };
  ryokan.deliciousScreenshot(args.username, args.password, args.tags.split(','), opts, bag.exit);
}

/**
 * Execute Ryokan CLI.
 */
function exec() {

  var actions = {
    commands: {
      'delicious-screenshot': { action: _deliciousScreenshot }
    }
  };

  bag.command(__dirname, actions);
}

exports.exec = exec;
