#!/bin/bash
echo "Groups:" > verify.log
getent group | tail -3 > verify.log
echo "Users:" > verify.log
getent passwd | tail -9 > verify.log

echo "Groups of Users:" > verify.log
groups engineering-admin engineering-user1 engineering-user2 > verify.log
groups sales-admin sales-user1 sales-user2 > verify.log
groups is-admin is-user1 is-user2 > verify.log

echo "Directories:" > verify.log
stat /Engineering/ /Sales/ /IS/|egrep "File:|Access: \("|cat > verify.log

echo "Confidential Documents" > verify.log
stat /Engineering/document.txt /Sales/document.txt /IS/document.txt|egrep "File:|Access: \("|cat > verify.log
