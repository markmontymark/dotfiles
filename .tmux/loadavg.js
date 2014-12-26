#!/usr/bin/env node

'use strict';

var cp = require('child_process');
var spawn  = cp.spawn;
var topCmd = spawn('top',['-ocpu','-R','-F','-n0','-l0']);
topCmd.stdout.on('data',function(data){
  var result = new Buffer(2048);
  result.fill(0);
  data.copy(result);
  var d = parse(result.toString('utf8'));
  var loadAvg = d.loadavg;
      //'#[fg=white,bg=green]' :
  var color = (parseFloat(loadAvg) < 3) ?
    'colour66' : 'red';
  var fspacer = '#[fg=' + color +',bg=black]◀';
  var bspacer = '#[fg=black,bg=' + color +']◀';
  console.log(
    fspacer +
    '#[fg=white,bg=' + color +']'+
    ' load ' + loadAvg.split(',')[0] +
    ' ' + bspacer
  );
  process.nextTick(function (){
    topCmd.kill();
  });
});
topCmd.on('error',function(){
  console.error('topcmd error ',arguments);
});

function parse(topOutput){
  var d = {};
  topOutput.split("\n").forEach(function (line){
    var terms = line.split(':');
    if( !terms || terms.length < 2){
      return;
    }
    d[ terms[0].trim().toLowerCase().replace(/ /g,'')] = terms[1].trim().replace(/\n/g,'');
  });
  return d;
  //console.log('got ', lines.length, ' lines');
}
