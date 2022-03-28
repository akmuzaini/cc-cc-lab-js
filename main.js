var peg = require('pegjs');
var fs = require('fs');
var filename = 'grammar.pegjs';
var grammer = fs.readFileSync(filename, 'utf-8');
var parser = peg.generate(grammer);
// var input = '١+٩٩';
var input = '441';
var output = parser.parse(input);
console.log(output);