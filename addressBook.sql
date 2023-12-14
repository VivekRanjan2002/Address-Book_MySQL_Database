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

<--UC8 Ability to retrieve entries in sorting order-->
<--increasing order>
mysql> alter table addressbook
    -> add column Id INT AUTO_INCREMENT PRIMARY KEY FIRST;
Query OK, 0 rows affected (0.17 sec)
mysql> select * from addressbook order by FirstName;
+----+-----------+----------+---------+--------+--------+----------------+---------------+
| Id | FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+----+-----------+----------+---------+--------+--------+----------------+---------------+
|  2 | Amit      | Kumar    | XXXX    | Nawada | 0000   | +91-XXXXXXXXXX | abc@gmail.com |
|  3 | Nishant   | Harsh    | XXXX    | Patna  | 0000   | +91-XXXXXXXXXX | xyz@gmail.com |
|  1 | Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com |
+----+-----------+----------+---------+--------+--------+----------------+---------------+
3 rows in set (0.00 sec)
<--Decreasing order>
mysql> select * from addressbook order by FirstName Desc;
+----+-----------+----------+---------+--------+--------+----------------+---------------+
| Id | FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+----+-----------+----------+---------+--------+--------+----------------+---------------+
|  1 | Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com |
|  3 | Nishant   | Harsh    | XXXX    | Patna  | 0000   | +91-XXXXXXXXXX | xyz@gmail.com |
|  2 | Amit      | Kumar    | XXXX    | Nawada | 0000   | +91-XXXXXXXXXX | abc@gmail.com |
+----+-----------+----------+---------+--------+--------+----------------+---------------+
3 rows in set (0.00 sec)
<--sorting all the entries according to FirstName in City Nawada-->
mysql> select * from addressbook where City="Nawada" order by FirstName;
+----+-----------+----------+---------+--------+--------+----------------+---------------+
| Id | FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         |
+----+-----------+----------+---------+--------+--------+----------------+---------------+
|  2 | Amit      | Kumar    | XXXX    | Nawada | 0000   | +91-XXXXXXXXXX | abc@gmail.com |
|  1 | Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com |
+----+-----------+----------+---------+--------+--------+----------------+---------------+
2 rows in set (0.01 sec)

<--UC9 add new columns name and contact_type in addressbook-->
mysql> update addressbook
    -> set name="VivekRanjan", contact_type="Family" where Id="1";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> update addressbook
    -> set name="AmitKumar",contact_type="Friends" where Id="2";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> update addressbook
    -> set name="NishantHarsh",contact_type="Profession" where Id="3";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select *from addressbook;
+----+-----------+----------+---------+--------+--------+----------------+---------------+--------------+--------------+
| Id | FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         | name         | contact_type |
+----+-----------+----------+---------+--------+--------+----------------+---------------+--------------+--------------+
|  1 | Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com | VivekRanjan  | Family       |
|  2 | Amit      | Kumar    | XXXX    | Nawada | 0000   | +91-XXXXXXXXXX | abc@gmail.com | AmitKumar    | Friends      |
|  3 | Nishant   | Harsh    | XXXX    | Patna  | 0000   | +91-XXXXXXXXXX | xyz@gmail.com | NishantHarsh | Profession   |
+----+-----------+----------+---------+--------+--------+----------------+---------------+--------------+--------------+

<--UC10 Retrive count of Contacts on the basis of contact_type-->
mysql> select count(contact_type),contact_type from addressbook group by contact_type;
+---------------------+--------------+
| count(contact_type) | contact_type |
+---------------------+--------------+
|                   1 | Family       |
|                   1 | Friends      |
|                   1 | Profession   |
+---------------------+--------------+
3 rows in set (0.00 sec)

<--UC11 add person to more than one contact_type-->
mysql> insert into addressbook(FirstName,LastName,Address,City,Zip,PhoneNo,Email,name,contact_type)
    -> values("Vivek","Ranjan","RjNwd","Nawada","805110","+91-XXXXXXXXXX","viv@gmail.com","VivekRanjan","Friends");
Query OK, 1 row affected (0.03 sec)

mysql> select * from addressbook;
+----+-----------+----------+---------+--------+--------+----------------+---------------+--------------+--------------+
| Id | FirstName | LastName | Address | City   | Zip    | PhoneNo        | Email         | name         | contact_type |
+----+-----------+----------+---------+--------+--------+----------------+---------------+--------------+--------------+
|  1 | Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com | VivekRanjan  | Family       |
|  2 | Amit      | Kumar    | XXXX    | Nawada | 0000   | +91-XXXXXXXXXX | abc@gmail.com | AmitKumar    | Friends      |
|  3 | Nishant   | Harsh    | XXXX    | Patna  | 0000   | +91-XXXXXXXXXX | xyz@gmail.com | NishantHarsh | Profession   |
|  4 | Vivek     | Ranjan   | RjNwd   | Nawada | 805110 | +91-XXXXXXXXXX | viv@gmail.com | VivekRanjan  | Friends      |
+----+-----------+----------+--------+--------+--------+----------------+---------------+--------------+--------------+
