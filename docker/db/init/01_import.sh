#!/bin/bash
set -euo pipefail

echo "[timecloud] preparing TIMECLOUD schema import"

for i in $(seq 1 60); do
  if echo 'select 1 from dual;' | sqlplus -s "system/${ORACLE_PASSWORD}@XE" | grep -q 1; then
    break
  fi
  echo "[timecloud] waiting for Oracle to accept connections ($i/60)"
  sleep 5
done

sqlplus -s "system/${ORACLE_PASSWORD}@XE" <<'SQL'
WHENEVER SQLERROR EXIT SQL.SQLCODE
DECLARE
  v_count NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_count FROM dba_users WHERE username = 'TIMECLOUD';
  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE USER timecloud IDENTIFIED BY timecloud DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP QUOTA UNLIMITED ON USERS';
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE, CREATE TRIGGER TO timecloud';
  ELSE
    EXECUTE IMMEDIATE 'ALTER USER timecloud IDENTIFIED BY timecloud';
    EXECUTE IMMEDIATE 'ALTER USER timecloud QUOTA UNLIMITED ON USERS';
  END IF;
END;
/
EXIT
SQL

if ! command -v imp >/dev/null 2>&1; then
  echo "[timecloud] Oracle classic import utility 'imp' not found in image" >&2
  exit 1
fi

imp "system/${ORACLE_PASSWORD}@XE" \
  file=/opt/oracle/import/timecloud.dmp \
  fromuser=TIMECLOUD \
  touser=TIMECLOUD \
  ignore=y \
  grants=y \
  indexes=y \
  constraints=y \
  log=/tmp/timecloud_import.log

echo "[timecloud] import complete"
