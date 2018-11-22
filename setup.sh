#!/bin/bash
# BSD 3-Clause License
# 
# Copyright (c) 2018, Fabio Jun Takada Chino
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# 
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# 
# * Neither the name of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Include the 
. $(dirname "$0")/common.inc


# Creates the directory if it does not exist
check_and_create_dir() {
	if [ -d $1 ]; then
		echo "Directory $1 already exists."
	else
		if mkdir $1; then
			echo "Directory $1 created!"
		else
			echo "Unable to create the directory '$1'."
			exit 1
		fi
	fi
	chmod 700 $1
}

# Files and directories
check_dirs() {
	echo "Checking the directories..."
	check_and_create_dir $CA_PRIVATE_DIR
	check_and_create_dir $CA_CERT_DIR
	check_and_create_dir $CA_CONF_DIR
	check_and_create_dir $CA_CRL_DIR
	check_and_create_dir $CA_DB_DIR
	check_and_create_dir $CA_CERT_DB_DIR
}

check_private_key() {
	# Check the CA_KEY
	if [ -f $CA_PRIVATE_KEY ]; then
		echo "The private key already exists!"
	else
		echo "Creating the CA private key."
		if openssl genrsa $CA_KEY_ENC -out $CA_PRIVATE_KEY $CA_KEY_SIZE ; then
			echo "CA private key created."
			rm $CA_CERTIFICATE
		else
			echo "Unable to create the CA private key!"
			exit 2
		fi
	fi
}

patch_config() {
	echo "Patching the configuration file."
	cp $CA_CONFIG_FILE $CA_CONFIG_FILE.bk
	escaped_dir=$(echo $MY_HOME | sed -Ee 's/([\/.+*$^[])/\\\1/g' | sed -Ee 's/]/\\]/g')
	cat $CA_CONFIG_FILE.bk | sed -Ee "s/^(dir.*=).*/\1 $escaped_dir/" > $CA_CONFIG_FILE
}

check_certificate() {
	
	if [ -f $CA_CERTIFICATE ]; then
		echo "CA certificate OK."
	else
		echo "Creating the CA certificate."
		if openssl req -config $CA_CONFIG_FILE -key $CA_PRIVATE_KEY -new -x509 -days $CA_CERT_DAYS -sha256 -extensions v3_ca -out $CA_CERTIFICATE ; then
			echo "New CA certificate created."
		else
			echo "Unable to create the CA certificate."
			exit 1
		fi
	fi
	openssl x509 -noout -text -in  $CA_CERTIFICATE 
}

create_database() {

	echo "Checking the database..."
	if ! [ -f $CA_INDEX_FILE ]; then
		echo "Creating the new index file."
		touch $CA_INDEX_FILE
		touch $CA_INDEX_FILE.attr
	fi
	if ! [ -f $CA_SERIAL_FILE ]; then
		echo "Creating the new serial file."
		date +%N0 > $CA_SERIAL_FILE
	fi
}

# Main
check_dirs
check_private_key
patch_config
check_certificate
create_database
echo "The CA is ready to be used."

