# Marble Management Database

## 📌 Project Overview

**Marble Management Database** is a relational database project developed for managing marble inventory and customer sales for a marble trading business.

The database is designed to track marble products, inventory movements, customers, sales invoices, and the relationship between customers and the marble products they purchase.

The project focuses on database design, entity relationships, primary and foreign keys, and SQL-based data management.

---

## 🗂️ Database Structure

The database consists of the following main tables:

### 1. Mermer (Marble)

Stores information about marble products.

* `MermerID` — Primary Key
* `Ad` — Marble name
* `Renk` — Marble color
* `Boyut` — Marble dimensions
* `Agirlik` — Marble weight
* `StokMiktari` — Current stock quantity

### 2. Musteri (Customer)

Stores customer information.

* `MusteriID` — Primary Key
* `Ad` — Customer name
* `Adres` — Customer address
* `Telefon` — Customer phone number
* `Email` — Customer email

### 3. StokYonetimi (Inventory Management)

Tracks marble inventory movements.

* `MermerID` — Foreign Key
* `GirenMiktar` — Incoming quantity
* `CikanMiktar` — Outgoing quantity
* `Tarih` — Transaction date

**Relationship:**
`Mermer (1) → (N) StokYonetimi`

A marble product can have multiple inventory transactions.

### 4. SatisFatura (Sales Invoice)

Stores customer sales invoice information.

* `FaturaID` — Primary Key
* `MusteriID` — Foreign Key
* `Tarih` — Invoice date
* `ToplamTutar` — Total invoice amount

**Relationship:**
`Musteri (1) → (N) SatisFatura`

A customer can have multiple sales invoices.

### 5. MusteriMermer (Customer-Marble)

This table represents the many-to-many relationship between customers and marble products.

* `MusteriID` — Foreign Key
* `MermerID` — Foreign Key
* `Miktar` — Purchased quantity

The combination of `MusteriID` and `MermerID` is used as the composite primary key.

**Relationship:**
`Musteri (M) ↔ (N) Mermer`

A customer can purchase multiple marble products, while a marble product can be purchased by multiple customers.

---

## 🔗 Entity Relationships

The database contains the following relationships:

| Relationship          | Type | Description                                     |
| --------------------- | ---- | ----------------------------------------------- |
| Mermer → StokYonetimi | 1:N  | One marble can have multiple inventory records  |
| Musteri → SatisFatura | 1:N  | One customer can have multiple sales invoices   |
| Musteri ↔ Mermer      | M:N  | Customers can purchase multiple marble products |

The many-to-many relationship between `Musteri` and `Mermer` is implemented through the `MusteriMermer` junction table.

---

## 🧩 Database Entities

### Musteri

| Attribute | Type         | Key |
| --------- | ------------ | --- |
| MusteriID | INT          | PK  |
| Ad        | VARCHAR(255) |     |
| Adres     | VARCHAR(255) |     |
| Telefon   | VARCHAR(20)  |     |
| Email     | VARCHAR(255) |     |

### Mermer

| Attribute   | Type          | Key |
| ----------- | ------------- | --- |
| MermerID    | INT           | PK  |
| Ad          | VARCHAR(255)  |     |
| Renk        | VARCHAR(50)   |     |
| Boyut       | VARCHAR(50)   |     |
| Agirlik     | DECIMAL(10,2) |     |
| StokMiktari | INT           |     |

### StokYonetimi

| Attribute   | Type | Key |
| ----------- | ---- | --- |
| MermerID    | INT  | FK  |
| GirenMiktar | INT  |     |
| CikanMiktar | INT  |     |
| Tarih       | DATE |     |

### SatisFatura

| Attribute   | Type          | Key |
| ----------- | ------------- | --- |
| FaturaID    | INT           | PK  |
| MusteriID   | INT           | FK  |
| Tarih       | DATE          |     |
| ToplamTutar | DECIMAL(10,2) |     |

### MusteriMermer

| Attribute | Type | Key    |
| --------- | ---- | ------ |
| MusteriID | INT  | PK, FK |
| MermerID  | INT  | PK, FK |
| Miktar    | INT  |        |

---


## 🛠️ Technologies

* SQL
* Relational Database Design
* Entity-Relationship Modeling
* Primary & Foreign Keys
* Composite Primary Keys
* SQL Constraints

---

## 🎯 Project Objectives

* Design a relational database for a marble trading business
* Manage marble inventory
* Track incoming and outgoing stock
* Store customer information
* Record sales invoices
* Model customer-marble relationships
* Apply primary and foreign key constraints
* Demonstrate relational database design principles

---


