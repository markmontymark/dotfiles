#!/usr/bin/perl

use v5.16;

use strict;

sub walk {
  my $dir = shift;
  for (grep !/^\.\.?$/ && !/\.(?:git|md)$/, `ls -a $dir`){
    chomp;
    my $p = "$dir/$_";
    next if $p eq './diff.pl' or $p eq './.gitignore';
    if(-d $p){
      walk($p);
    }
    else {
      (my $live = $p) =~ s/^\./~/;
      my $df = `diff $live $p`;
      if($df){
        say $p,"\n",$df;
      }
    }
  }
}

&walk('.');
