#!/bin/sh
cp docs/css/style.css static/css/style.css
emacs -Q --script build-site.el
