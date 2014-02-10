var bag = require('bagofcli'),
  fs = require('fs'),
  Ryokan = require('./ryokan');

function _deliciousScreenshot(args) {
  var ryokan = new Ryokan(),
    opts = { type: 'png', wait: 200 };
  ryokan.deliciousScreenshot(args.username, args.password, args.tags.split(','), opts, bag.exit);
}

function _deliciousDelete(args) {
  var ryokan = new Ryokan();
  ryokan.deliciousDelete(args.username, args.password, args.tags.split(','), bag.exit);
}

/**
 * Execute Ryokan CLI.
 */
function exec() {

  var actions = {
    commands: {
      'delicious-screenshot': { action: _deliciousScreenshot },
      'delicious-delete': { action: _deliciousDelete }
    }
  };

  bag.command(__dirname, actions);
}

exports.exec = exec;
