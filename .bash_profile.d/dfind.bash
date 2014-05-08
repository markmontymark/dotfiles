#!/usr/bin/env bash

dfind(d){
   find . -type f -exec grep $1 {} \; -ls
}
