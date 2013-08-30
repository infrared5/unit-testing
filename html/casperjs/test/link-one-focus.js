/*global casper*/
casper.test.begin('#one click focuses section', 1, function suite(test) {
  'use strict';

  var landingUrl;

  casper.start('http://localhost:8124', function() {
      landingUrl = this.getCurrentUrl();
    })
    .waitForSelector('#link-one', function() {
      this.click('#link-one');
    })
    .then(function() {
      test.assertUrlMatch(landingUrl, 'link-one should not redirect.');
    })
    .run(function() {
      test.done();
    });

});