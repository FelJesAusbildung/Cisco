#!/bin/bash
getent group | tail -3
getent passwd | tail -9

groups engineering-admin engineering-user1 engineering-user2
groups sales-admin sales-user1 sales-user2
groups is-admin is-user1 is-user2

stat /Engineering/ /Sales/ /IS/|egrep "File:|Access \("|cat

stat /Engineering/document.txt /Sales/document.txt /IS/document.txt|egrep "File:|Access: \("|cat
