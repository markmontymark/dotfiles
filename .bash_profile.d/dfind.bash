#!/usr/bin/env bash

dfind(){
   find . -type f -exec grep $1 {} \; -ls
}
