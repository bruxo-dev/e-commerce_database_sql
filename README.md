# Building Your First Logical Database Project

This repository was designed to create a project to demonstrate the logical modeling, implementation, and querying of an e-commerce database imported from a schema from another repository.

It incorporates the following additional features:

- **Client Types**: Supports both individual (PF) and corporate (PJ) clients, ensuring mutual exclusivity.
- **Payment Methods**: Allows multiple payment methods per order.
- **Delivery Information**: Includes status and tracking codes for shipments.

The schema was built and tested using MySQL and includes data for functional testing. Below is the step-by-step process for replication and a description of the queries created.

## Steps to Execute the Project

### 1. Import the Schema

The database schema was initially designed using DBML and stored in the repository [e-commerce_schema_sql](https://github.com/bruxo-dev/e-commerce_schema_sql). The file `e-commerce_schema.dbml` defines the structure of the database.

### 2. Convert to SQL Script

The schema was converted into a MySQL-compatible script named `e-commerce_database_boot.sql`. This script resets the database and recreates the schema without data, ensuring a clean setup for testing.

### 3. Populate the Database

The `e-commerce_feed_data.sql` script was executed to insert functional, fictional data into the database for testing purposes.

### 4. Query Testing

The database was tested using a variety of SQL queries, each designed to answer specific business questions. Below is a description of each query:

#### 4.1 `view_customer_orders.sql`
- **Purpose**: Displays all orders placed by each customer.
- **Output**: Lists customer names, order IDs, order dates, and total amounts.

#### 4.2 `view_order_products.sql`
- **Purpose**: Displays the products associated with each order.
- **Output**: Includes order IDs, product names, quantities, and prices.

#### 4.3 `view_order_delivery_status.sql`
- **Purpose**: Lists all orders along with their delivery status and tracking codes.
- **Output**: Provides order IDs, delivery statuses (e.g., pending, shipped, delivered), and tracking numbers.

#### 4.4 `view_order_payment.sql`
- **Purpose**: Links orders to their payment details.
- **Output**: Displays order IDs, payment methods, amounts, and statuses.

#### 4.5 `view_partner_products.sql`
- **Purpose**: Identifies products managed by third-party partners.
- **Output**: Shows product names, partner names, and their stock levels.

#### 4.6 `view_products_suppliers.sql`
- **Purpose**: Maps products to their suppliers.
- **Output**: Lists product names and the corresponding supplier details.

#### 4.7 `view_stock_products.sql`
- **Purpose**: Displays the availability of products in each stock location.
- **Output**: Includes product names, stock levels, and warehouse locations.

#### 4.8 `compare_partners_stock_products.sql`
- **Purpose**: Compares the availability of partner-managed products across different stock locations.
- **Output**: Details product names, partner names, and stock levels by location.

## How to Use

1. Clone the repository: `git clone https://github.com/bruxo-dev/e-commerce_schema_sql`
2. Import the schema:
   ```bash
   mysql -u [your_user] -p < e-commerce_database_boot.sql
   ```
3. Populate the database:
   ```bash
   mysql -u [your_user] -p < e-commerce_feed_data.sql
   ```
4. Execute queries:
   ```bash
   mysql -u [your_user] -p < [query_file.sql]
   ```
5. You can also use the graphical user interface for MySQL to manage and run these files and queries.

## Queries Overview

Each query provides insights into the e-commerce data, answering key questions about orders, customers, deliveries, payments, products, and stock. These queries serve as a foundation for more complex data analysis and reporting tasks.

## Repository

Visit the base repository for additional details and reference: [e-commerce_schema_sql](https://github.com/bruxo-dev/e-commerce_schema_sql). 

## Contact
For questions or suggestions, feel free to say "Hello, friend!" at [rmjo.inbox@gmail.com] or at my GitHub Inbox.
