#!/bin/bash

mkdir /Engineering /Sales /IS

groupadd engineering
groupadd sales
groupadd is

useradd -s /bin/bash -d /Engineering -g engineering engineering-admin
useradd -s /bin/bash -d /Sales -g sales sales-admin
useradd -s /bin/bash -d /IS -g is is-admin

useradd -s /bin/bash -d /Engineering -g engineering engineering-user1
useradd -s /bin/bash -d /Engineering -g engineering engineering-user2
useradd -s /bin/bash -d /Sales -g sales sales-user1
useradd -s /bin/bash -d /Sales -g sales sales-user2
useradd -s /bin/bash -d /IS -g is is-user1
useradd -s /bin/bash -d /IS -g is is-user2

chown engineering-admin:engineering /Engineering
chmod -R 1770 /Engineering
chown sales-admin:sales /Sales
chmod -R 1770 /Sales
chown is-admin:is /IS
chmod -R 1770 /IS

echo "This file contains confidential information for the department." > /Engineering/document.txt
chown engineering-admin:engineering /Engineering/document.txt
chmod 740 /Engineering/document.txt
echo "This file contains confidential information for the department." > /Sales/document.txt
chown sales-admin:sales /Sales/document.txt
chmod 740 /Sales/document.txt
echo "This file contains confidential information for the department." > /IS/document.txt
chown is-admin:is /IS/document.txt
chmod 740 /IS/document.txt
