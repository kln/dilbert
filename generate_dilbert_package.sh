#!/bin/bash

create_package(){
  cp -r bin lib dilbert_package/usr/
  dpkg --build dilbert_package dilbert_tickets.deb
  rm -r dilbert_package/usr/*
}

sudo create_package