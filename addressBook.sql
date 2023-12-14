<--MYSQL COMMANDS FOR ADDRESSBOOK DATABASE-->
<--UC1 Ability to create AddressBookService database-->
mysql> create database AddressBookService;
Query OK, 1 row affected (0.01 sec)
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| addressbookservice |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

<---UC2 create AddressBook table with certain no. of attributes-->
mysql> create Table AddressBook(
    -> FirstName varchar(255) NOT NULL,
    -> LastName varchar(255) NOT NULL,
    -> Address varchar(255),
    -> City varchar(100),
    -> Zip varchar(100),
    -> PhoneNo varchar(50),
    -> Email varchar(100));
Query OK, 0 rows affected (0.10 sec)
mysql> show tables;
+------------------------------+
| Tables_in_addressbookservice |
+------------------------------+
| addressbook                  |
+------------------------------+
1 row in set (0.00 sec)

