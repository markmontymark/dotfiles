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
  var mem = d.physmem.match(/(\d+)\w .* (\d+)\w unused.$/);
  var memUsed = mem[1];
  var memUnused = mem[2];
  if(memUsed.length > 3){
    memUsed = memUsed.charAt(0) + 'g';
  }
  if(memUnused.length > 3){
    memUnused = memUnused.charAt(0) + 'g';
  }
  var color = (parseInt(memUnused,10) < 2000) ?
    'colour64' : (parseInt(memUnused,10) < 10000) ?
    'colour9' : 'red';
  var fspacer = '#[fg=' + color +',bg=black]◀';
  var bspacer = '#[fg=black,bg=' + color +']◀';
  console.log(
    fspacer +
    '#[fg=colour253,bg=' + color +']'+
    ' mem ' + memUsed + '/' + memUnused +
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
