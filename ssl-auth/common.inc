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

# Deterine the home directory of the script
MY_HOME=$(dirname "$0")
pushd "$MY_HOME" > /dev/null
MY_HOME=$(pwd)
popd > /dev/null

# Execution timestamp
TIMESTAMP=$(date +%Y%m%d)

# Files and directories
CA_PRIVATE_DIR=$MY_HOME/private
CA_CERT_DIR=$MY_HOME/certs
CA_REVOKED_DIR=$MY_HOME/certs/revoked
CA_CONF_DIR=$MY_HOME/conf
CA_CRL_DIR=$MY_HOME/crl
CA_DB_DIR=$MY_HOME/db
CA_CERT_DB_DIR=$CA_DB_DIR/certs


# Keys and configuration
CA_PRIVATE_KEY=$CA_PRIVATE_DIR/cakey.pem
CA_CERTIFICATE=$CA_CERT_DIR/cacert.pem
CA_CONFIG_FILE=$CA_CONF_DIR/ca.cnf
CA_SERIAL_FILE=$CA_DB_DIR/serial.txt
CA_INDEX_FILE=$CA_DB_DIR/index.txt
CA_CRL_NUMBER_FILE=$CA_DB_DIR/crlnumber.txt
CA_CRL_FILE=$CA_CRL_DIR/ca.crl

# Constants
CA_KEY_ENC=-aes256
CA_KEY_SIZE=2048
CA_CERT_DAYS=7300


