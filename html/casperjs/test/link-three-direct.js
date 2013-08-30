/*global casper*/
casper.test.begin('Link Three Redirects to Google', 1, function suite(test) {
  'use strict';

  casper.start('http://localhost:8124')
    .waitForSelector('#link-google', function() {
      this.click('#link-google');
    })
    .then(function() {
      test.assertUrlMatch(/^http:\/\/(www.)?google.com/, 'Link should load google.com');
    })
    .run(function() {
      test.done();
    });

});