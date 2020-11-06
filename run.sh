#!/bin/sh

SCHEMA_DIR=`printenv SCHEMA_DIR || echo ${HOME}/schema`
TMP_SLAPD_CONF=`printenv TMP_SLAPD_CONF || echo ${HOME}/slapd.conf`
SLAPSCHEMA=`printenv SLAPSCHEMA || echo /usr/sbin/slapschema`

function main() {
  genslapdconf
  ${SLAPSCHEMA} -f ${TMP_SLAPD_CONF} -v
}

function genslapdconf(){
  SCHEMA_FILES=`find ${SCHEMA_DIR} -mindepth 1 -name "*.schema" -or -name "*.ldif"`
  echo "include /etc/openldap/schema/core.schema" > ${TMP_SLAPD_CONF}
  for FILEPATH in ${SCHEMA_FILES}; do
    echo "include ${FILEPATH}" >> ${TMP_SLAPD_CONF}
  done
  cat << EOS >> ${TMP_SLAPD_CONF}
moduleload /usr/lib/openldap/back_null
database null
EOS
}

main
