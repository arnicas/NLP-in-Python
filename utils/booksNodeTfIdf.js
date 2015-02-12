
/************

Lynn Cherny, 2/2015:

This uses code from the node natural package, particularly:
https://github.com/NaturalNode/natural/blob/master/lib/natural/tfidf/tfidf.js
which implements tf-idf in its own way and removes stopwords, apparently.

https://github.com/NaturalNode/natural/blob/master/lib/natural/util/stopwords.js

To run this, you need to install node and:
> npm install natural
> node booksNodeTfIdf.js <files dir without trailing / ! > <word>

*************/

var natural = require('natural'),
    TfIdf = natural.TfIdf,
    tfidf = new TfIdf();

// Borrowed from Shiffman's node examples for his AtoZ Programming class
// We can get command line arguments in a node program:
if (process.argv.length < 4) {
  console.log('Oops, you forgot to pass in a directory path and file to evaluate.');
  process.exit(1);
}

// The 'fs' (file system) module allows us to read and write files:

var fs = require('fs');
// A path for all the files of data
var path = process.argv[2];
// The specific word to perform tf-idf on
var word = process.argv[3];
// And we'll look at all files in that path
var files = fs.readdirSync(path);

// Total word count of document
var totalwords = 0;

function printTopN(docNumber, N) {
  var sorted = tfidf.listTerms(docNumber).sort(function(a, b) {
    return b.tfidf - a.tfidf;
    }).slice(0,N);

  console.log("Top terms for doc " + docNumber + ":")
  sorted.forEach(function (a) {
    console.log("  ", a.term, a.tfidf);
  });
}

// Add each of the files to the model

files.forEach(function(d,i) {
  console.log('Doc #' + i + ' is ' + path + '/' + d);
  tfidf.addFileSync(path + '/' + d);
});

setTimeout(function () {
  // doing it in a timeout because otherwise the files.each above may not
  // have finished
  files.forEach(function(d,i) {
    printTopN(i, 6);
  });
  console.log('Looking up tfidf for: ' + word);
  tfidf.tfidfs(word, function(i, measure) {
      console.log('document #' + i + ' with ' + measure);
  });
}, 500);

