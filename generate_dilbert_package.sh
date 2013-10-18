#!/bin/bash

sudo -s "
  mkdir dilbert_package/usr/
  cp -r bin lib dilbert_package/usr/
  cp Gemfile dilbert_package/usr/lib/dilbert-tickets/
  dpkg --build dilbert_package dilbert-tickets.deb
  rm -r dilbert_package/usr/*
"

