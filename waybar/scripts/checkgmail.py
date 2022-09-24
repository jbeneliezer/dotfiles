#!/usr/bin/python3

import imaplib

cnt = 0
obj = imaplib.IMAP4_SSL("imap.gmail.com", "993")

username = input("Enter your username: ")
password = input("Enter your username: ")

try:
    obj.login(username, password)
    obj.select()
    typ, data = obj.search(None, "UnSeen")
    for num in data[0].split():
        cnt += 1
    print(cnt)
    obj.close()
    obj.logout()
except imaplib.IMAP4.error:
    print("\xfa\xfc")
