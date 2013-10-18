#!/bin/bash

sudo -s "
  cp -r bin lib dilbert_package/usr/
  dpkg --build dilbert_package dilbert-tickets.deb
  rm -r dilbert_package/usr/*
"

