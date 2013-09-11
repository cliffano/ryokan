var async = require('async'),
  colors = require('colors'),
  Eggtart = require('eggtart'),
  p = require('path'),
  webshot = require('webshot');

function Ryokan() {

}

Ryokan.prototype.deliciousScreenshot = function (username, password, tags, opts, cb) {

  var eggtart = new Eggtart(username, password),
    count;

  function createScreenshot(post, cb) {
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
  
  function getBookmarks(tag, cb) {
    console.log('%s', tag.cyan);
    count = 0;

    eggtart.posts().recent({ tag: tag }, function (err, result) {
      if (err) {
        cb(err);
      } else {
        result.posts.post.forEach(function (item) {
          item._tag = tag;
        });
        async.each(result.posts.post, createScreenshot, cb);
      }
    });
  }

  async.eachSeries(tags, getBookmarks, function (err) {
    cb(err);
  });

};

module.exports = Ryokan;
