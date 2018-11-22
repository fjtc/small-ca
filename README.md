# Small-CA - A Small Certificate Authority
Copyright (c) 2018 Fabio Jun Takada Chino

## Introduction 

**Small-CA** is a set of bash scripts that uses [OpenSSL]() to create a small Certificate Authority for small intranets. It is partially based on [1] written by **J. Nguyen**.

## Dependencies

* Bash 4.4+;
* OpenSSL 1.1.0+;
* GNU sed 4.4-;

## Installation

Just copy the contents of this directory to into the desired location.

## Initial configuration

Before you start, open the file **conf/ca.cnf** end change the parameters as you wish.
Follow the instructions inside the file or check the description of the parameters
inside the **OpenSSL** documentation. 

## Generating the CA

Open a terminal inside the installation directory and execute:

```
$ bash setup.sh
```

Just follow the instruction until this process is finished.

## Sign the certificates

To sign a new certificate, just put the certificate signing request (csr) inside the directory **certs** and run the command:

```
$ ./sign <title of the certificate>
```

Follow the instructions and until the certificate is signed. The signed certificate will
be available **certs** with the name **\<title of the certificate\>.cer**.

## Revoke the certificates

To revoke the certificate, just run:

```
$ ./revoke <title of the certificate>
```

This command revokes the certificate and put the revoked certificate inside the directory
**certs/revoked**. It is important to notice that this command does not generate the 
certificate revocation list.

## Generating the revocation list

In order to generate the certificate revocation list, just run the command:

```
$ ./gencrl
```

The revocation list will be genrated inside the directory **crl** under the name specified
inside **common.inc**.

## Licensing

This software is licensed under a 3 clause BSD license.

## References

* [1] Nguyen, J., "[OpenSSL Certificate Authority](https://jamielinux.com/docs/openssl-certificate-authority/)", On-Line, 2015
