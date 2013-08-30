/*global casper*/
casper.test.begin('Link Two updates url with shebang', function(test) {
  'use strict';

  casper.start('http://localhost:8124')
    .waitForSelector('#link-page-two', function() {
      this.click('#link-page-two');
    })
    .then(function() {
      var hash = /\#\/two/;
      test.assertMatch(this.getCurrentUrl(), hash, 'Location should update to #/two.');
    })
    .run(function() {
      test.done();
    });

});