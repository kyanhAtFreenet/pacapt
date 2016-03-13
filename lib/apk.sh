#!/bin/bash

# Purpose: Support next-generation Alpine Linux apk package manager
# Author : Carl X. Su <bcbcarl@gmail.com>
#          Cuong Manh Le <cuong.manhle.vn@gmail.com>
# License: Fair license (http://www.opensource.org/licenses/fair)
# Source : http://github.com/icy/pacapt/

# Copyright (C) 2016 CuongLM
#
# Usage of the works is permitted provided that this instrument is
# retained with the works, so that any entity that uses the works is
# notified of this instrument.
#
# DISCLAIMER: THE WORKS ARE WITHOUT WARRANTY.

_apk_init() {
  :
}

apk_Q() {
  if [[ "$_TOPT" == "" ]]; then
    apk info
  else
    _not_implemented
  fi
}

apk_Qi() {
  apk_Si "$@"
}

apk_Ql() {
  apk info -L "$@"
}

apk_Qo() {
  apk info --who-owns "$@"
}

apk_Qs() {
  apk info "*$@*"
}

apk_R() {
  apk del "$@"
}

apk_Rn() {
  apk del --purge "$@"
}

apk_Rns() {
  apk del --purge -r "$@"
}

apk_Rs() {
  apk del -r "$@"
}

apk_S() {
  case ${_EOPT} in
    # Download only, _translate_w gave trailing spaces
    ("fetch "*) shift
                apk fetch        -- "$@" ;;
            (*) apk add   $_TOPT -- "$@" ;;
  esac
}

apk_Sc() {
  apk cache -v clean "$@"
}

apk_Scc() {
  rm -rf /var/cache/apk/*
}

apk_Sccc() {
  rm -rf /var/cache/apk/*
}

apk_Si() {
  apk info -a "$@"
}

apk_Sii() {
  apk info -r "$@"
}

apk_Sl() {
  apk search -v "$@"
}

apk_Ss() {
  apk search -v "$@"
}

apk_Su() {
  apk upgrade "$@"
}

apk_Suy() {
  apk update
  if [ "$#" -gt 0 ]; then
    apk add --upgrade "$@"
  else
    apk upgrade
  fi
}

apk_Sy() {
  apk update
}

apk_Sw() {
  apk fetch "$@"
}
