var async = require('async'),
  colors = require('colors'),
  Eggtart = require('eggtart'),
  p = require('path'),
  webshot = require('webshot');

function Ryokan() {

}

Ryokan.prototype.deliciousScreenshot = function (username, password, tags, opts, cb) {

  var eggtart = new Eggtart(username, password);
  var count = 0;

  function createScreenshot(eggtart) {
    return function (post, cb) {

      var url = post.$.href,
        title = post.$.description,
        file = p.join(process.cwd(), post._tag + '-' + ++count + '-' + title.replace(/\W/g, '') + '.' + opts.type);

      webshot(url, file, { shotSize: {  width: 'all', height: 'all' } }, function (err) {
        if (err) {
          console.error('%s - %s - %s', 'error'.red, file, err.message);
        } else {
          console.log('%s - %s', 'success'.green, file);
        }
        cb(err);
      });
    }
  }

  this._applyDelicious(username, password, tags, createScreenshot, cb);
};

Ryokan.prototype.deliciousDelete = function (username, password, tags, cb) {

  function deleteBookmark(eggtart) {
    return function (post, cb) {
      var url = post.$.href;
      console.log('%s - Deleting %s', 'success'.green, url);
      eggtart.posts().delete({ url: url }, cb);
    }
  }

  this._applyDelicious(username, password, tags, deleteBookmark, cb);
};

Ryokan.prototype._applyDelicious = function (username, password, tags, iterCb, cb) {

  var eggtart = new Eggtart(username, password);

  function getBookmarks(tag, cb) {
    console.log('> %s', tag.cyan);

    eggtart.posts().recent({ tag: tag }, function (err, result) {
      if (err) {
        cb(err);
      } else if (result.posts) {
        result.posts.post.forEach(function (item) {
          item._tag = tag;
        });
        async.each(result.posts.post, iterCb(eggtart), cb);
      } else {
        console.log('%s - %s', 'warn'.yellow, 'No bookmark found');
        cb(err, result);
      }
    });
  }

  async.eachSeries(tags, getBookmarks, function (err) {
    cb(err);
  });
};

module.exports = Ryokan;
