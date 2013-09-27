/*global casper*/
casper.test.begin('Landing Page Welcome Text', 1, function suite(test) {
  'use strict';

  casper.start('http://localhost:8124')
    .waitForSelector('section#one', function() {
      // var element = this.getElementInfo('section#one');
      // test.assertTruthy(element.text, 'Hello, world.', 'Welcome text should be \'Hello, world.\'');
      test.assertSelectorHasText('section#one', 'Hello, world.');
    })
    .run(function() {
      test.done();
    });

});