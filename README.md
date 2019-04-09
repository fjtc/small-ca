# Small-CA - A Small Certificate Authority
Copyright (c) 2018 Fabio Jun Takada Chino

## Introduction 

**Small-CA** is a set of bash scripts that uses [OpenSSL](https://www.openssl.org/) to create a small 
Certificate Authority for small intranets. It is partially based on [1] written by **J. Nguyen**.

## Dependencies

* Bash 4.4+;
* OpenSSL 1.1.0+;
* GNU sed 4.4-;

## Editions

This repository contains the following editions:

* basic: A basic CA with a root that signs certificates;
* ssl-auth: A basic CA that has a root certificate that generates and signs client certificates that can
be installed on browsers;

## Licensing

This software is licensed under a 3 clause BSD license.

## References

* [1] Nguyen, J., "[OpenSSL Certificate Authority](https://jamielinux.com/docs/openssl-certificate-authority/)", On-Line, 2015
