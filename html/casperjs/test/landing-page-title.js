/*global casper*/

casper.test.begin('Landing Page Title', 1, function suite(test) {

  'use strict';
  
  casper.start('http://localhost:8124', function() {
    test.assertTitle('ir5 unit/functional testing', 'Title should be: "ir5 unit/functional testing"');
  })
  .run(function() {
    test.done();
  });

});