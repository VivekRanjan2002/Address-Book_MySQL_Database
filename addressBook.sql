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

<--UC3 insert new contacts in addressbook-->
mysql> insert into addressbook
    -> values('Vivek','Ranjan','RjNwd','Nawada','805110','+91-XXXXXXXXXX','abc@gmail.com');
Query OK, 1 row affected (0.03 sec)
mysql> select * from addressbook;
+-----------+----------+---------+--------+--------+----------------+---------------+
| FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+-----------+----------+---------+--------+--------+----------------+---------------+
| Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | abc@gmail.com |
+-----------+----------+---------+--------+--------+----------------+---------------+
1 row in set (0.00 sec)

<--UC4-- Ability to edit contact details : updating email of Vivek>
mysql> update addressbook
    -> set Email="viv@gmail.com"
    -> where FirstName="Vivek";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select * from addressbook;
+-----------+----------+---------+--------+--------+----------------+---------------+
| FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+-----------+----------+---------+--------+--------+----------------+---------------+
| Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com |
+-----------+----------+---------+--------+--------+----------------+---------------+
1 row in set (0.00 sec)

<--UC5 Ability to delete particular contact-->
mysql> select * from addressbook;
+-----------+----------+---------+--------+--------+----------------+---------------+
| FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+-----------+----------+---------+--------+--------+----------------+---------------+
| Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com |
| Amit      | Kumar    | Area    | Patna  | 000000 | +91-XXXXXXXXXX | abc@gmail.com |
+-----------+----------+---------+--------+--------+----------------+---------------+
2 rows in set (0.00 sec)
mysql> delete from addressbook where FirstName="Amit";
Query OK, 1 row affected (0.01 sec)
mysql> select * from addressbook;
+-----------+----------+---------+--------+--------+----------------+---------------+
| FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+-----------+----------+---------+--------+--------+----------------+---------------+
| Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com |
+-----------+----------+---------+--------+--------+----------------+---------------+
1 row in set (0.00 sec)

<--UC6 Ability to Retrieve Person belonging to a City named Nawada from the Address Book-->
mysql> select * from addressbook where City="Nawada";
+-----------+----------+---------+--------+--------+----------------+---------------+
| FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+-----------+----------+---------+--------+--------+----------------+---------------+
| Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com |
+-----------+----------+---------+--------+--------+----------------+---------------+
1 row in set (0.00 sec)

<--UC7 Ability to retrieve count no. of entries in city named Nawada-->
mysql> select count(City) from addressbook where City="Nawada";
+-------------+
| count(City) |
+-------------+
|           2 |
+-------------+
1 row in set (0.01 sec)
<--counting no. of entries of each city available-->
mysql> select count(City),City from addressbook group by City;
+-------------+--------+
| count(City) | City   |
+-------------+--------+
|           2 | Nawada |
|           1 | Patna  |
+-------------+--------+
2 rows in set (0.01 sec)
