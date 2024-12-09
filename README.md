# 📦 My Student Management API

Welcome to the **Student Management API!** A Python-based RESTful API built with **FastAPI** to efficiently manage student data. This API supports full **CRUD** operations— **Create, Read, Update,** and **Delete** —allowing you to manage student records with ease. Perfect for educational or personal projects! 🎉

---

## 🌟 Features
- 🔒 **Secure**: Implements robust authentication and authorization.
- ⚡ **Fast**: Built using FastAPI for high performance.
- 📚 **Documentation**: Includes auto-generated Swagger UI for API docs.

---
## 🛠 Installation and Setup

### Prerequisites
Ensure you have the following installed on your system:
- **Python 3.8 or higher**: [Download and install Python](https://www.python.org/downloads/)
- **Git**: [Download and install Git](https://git-scm.com/)


### Steps to Install
**1.** **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/student-management-api.git
   cd student-management-api
   ```

**2.** **Set up a virtual environment:**
   ```bash
python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
```

**3.** **Install Dependencies**
   
   Use `poetry` to install the necessary packages:
   ```bash
   poetry install
   ```
     
**4.** **Run the Development Server:**
   
Start the FastAPI development server:
```bash
poetry run uvicorn myapi:app --reload
```
**Note:** `poetry run` ensures commands are run in the virtual environment created by Poetry.

**5.** **Access the Application:**


Open your browser and navigate to:

**API Endpoints: http://127.0.0.1:8000**

**Swagger Documentation: http://127.0.0.1:8000/docs**

## 🗄 Database Setup

Ensure your database is set up before running the API.

### Install MySQL
Follow [this guide](https://dev.mysql.com/downloads/) to install MySQL on your system.

### Create a Database
Before running the scripts, create a database to hold the data. Use the following command:
```bash
mysql -u <username> -p
```
Replace `<username>` with your MySQL username.
Once logged into MySQL, run:
```bash
CREATE DATABASE ecommerce_db;
```
Replace `ecommerce_db` with the desired database name.

### Run Database Scripts
Execute the SQL scripts in the database folder to set up the database schema and populate initial data:
```bash
mysql -u <username> -p ecommerce_db < database/create_tables.sql
mysql -u <username> -p ecommerce_db < database/ecommerce.sql
```
Replace <username> with your MySQL username. You'll be prompted for your password.

### Configure Database Connection
The database connection settings are configured in the application’s properties or configuration file. Ensure you update the following fields with your database details:

### Seed data for customers table 
```bash
INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, COUNTRY, ZIPCODE, PHONE_NUMBER, EMAIL_ID)
VALUES
    ('Alice', 'Johnson', '789 Pine St', 'Seattle', 'WA', 'USA', 98101, '111-222-3333', 'alice.johnson@example.com'),
    ('Bob', 'Brown', '101 Maple Ave', 'Chicago', 'IL', 'USA', 60601, '222-333-4444', 'bob.brown@example.com'),
    ('Carol', 'Davis', '202 Cedar Rd', 'Miami', 'FL', 'USA', 33101, '333-444-5555', 'carol.davis@example.com');
```

### Seed data for payments table 
```bash
INSERT INTO PAYMENTS (CUSTOMER_ID, PAYMENT_TYPE, EXPIRATION_DATE, EMAIL_ID)
VALUES
    (1, 'Credit Card', '2025-12-31', 'john.doe@example.com'),
    (4, 'Bank Transfer', NULL, 'bob.brown@example.com'),
    (5, 'Credit Card', '2024-09-30', 'carol.davis@example.com');
```

### Seed data for products table 
```bash
INSERT INTO PRODUCTS (PRODUCT_NAME, PRODUCT_TYPE, PRICE)
VALUES
    ('Smartphone', 'Electronics', 699.99),
    ('Tablet', 'Electronics', 329.99),
    ('Gaming Chair', 'Furniture', 199.95);
```

### Seed data for orders table 
```bash
INSERT INTO ORDERS (DEVICE, PRODUCT_ID, CUSTOMER_ID, PAYMENT_ID, SHIPPING_ADDRESS, SHIPPING_CITY, SHIPPING_STATE, SHIPPING_COUNTRY, DELIVERED)
VALUES
    ('Tablet', 3, 3, 3, '789 Pine St', 'Seattle', 'WA', 'USA', FALSE),
    ('Desktop', 4, 4, 4, '101 Maple Ave', 'Chicago', 'IL', 'USA', TRUE),
    ('Mobile', 5, 5, 5, '202 Cedar Rd', 'Miami', 'FL', 'USA', FALSE);
```
### How to use:
1. Run the INSERT statements for each table in the order of dependencies:
- CUSTOMERS
- PAYMENTS
- PRODUCTS
- ORDERS

### Use the following queries to verify the data:
Fetch all records:
```bash
SELECT * FROM CUSTOMERS;
SELECT * FROM PAYMENTS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
```
Fetch specific data, such as:
```bash
SELECT O.ORDER_ID, C.FIRST_NAME, P.PRODUCT_NAME, O.DELIVERED
FROM ORDERS O
    JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
    JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID;
```

##  🔄 Managing Dependencies with Poetry

We use Poetry for dependency management. Below are the commands to add, remove, or update libraries.


####  Add a Library
To add a new dependency to the project, use:
```bash
poetry add <package-name>
```
For example:
```bash
poetry add fastapi
```
This will automatically update the `pyproject.toml` and `poetry.lock` files.

####  Remove a Library
To remove an unused library:
```bash
poetry remove <package-name>
```
For example: 
```bash
poetry remove fastapi
```
This will remove the package from pyproject.toml and update the lock file.

####  Update Dependencies
To update all dependencies to the latest versions allowed by pyproject.toml, run:
```bash
poetry update
```
####  Check Installed Libraries
To list all installed libraries and their versions:
```bash
poetry show
```
**Note:** This lists only installed dependencies, not all declared in `pyproject.toml`.


### Regenerate the Lock File Without Updating Dependencies
If you need to ensure the `poetry.lock` file is consistent with the dependencies specified in `pyproject.toml`, without updating to newer versions, run:

```bash
poetry lock --no-update
```
This command is useful when:

- You want to synchronize the poetry.lock file with changes made in pyproject.toml (e.g., adding or removing dependencies) without upgrading existing dependencies.
- Ensuring reproducible builds by keeping the dependency versions pinned as specified in the lock file.
  
By using the `--no-update` flag, Poetry avoids fetching the latest versions of dependencies and instead locks the currently specified versions.



## 🛠 Troubleshooting

**If you encounter any issues during installation, ensure that:**

1. You are using the correct Python version (python --version to check).
2. Virtual environments are set up if you prefer isolated environments (e.g., using venv or virtualenv).
3. All required dependencies are installed without errors (`poetry install`).


## 📚 API Endpoints

**Base URL: http://127.0.0.1:8000**
| Method  | Endpoint                      | Description                              |
|---------|-------------------------------|------------------------------------------|
| `GET`   | `/`                           | Returns a welcome message.              |
| `GET`   | `/get-student/{name}`         | Retrieves a student by their ID.        |
| `GET`   | `/get-by-name/{student_id}`   | Retrieves a student by their name.      |
| `POST`  | `/create-student/{student_id}`| Creates a new student record.           |
| `PUT`   | `/update-student/{student_id}`| Updates an existing student's details.  |
| `DELETE`| `/delete-student/{student_id}`| Deletes a student record by their ID.   |

## Example: Get Student by ID
**Endpoint:** `/get-student/{student_id}`

**Method:** `GET`

**Description:** Fetches details of a student using their unique ID.

#### Path Parameter:
| Parameter    | Type  | Description                  | Required |
|--------------|-------|------------------------------|----------|
| `student_id` | `int` | The unique ID of the student | Yes      |


**Sample Request:**
```bash
GET /get-student/1
```
**Response:**
```json
{
    "name": "John",
    "age": 17,
    "class": "year 12"
}
```
**Note:**
- Ensure that student_id is a positive integer within the valid range of existing student IDs.
  
- If the student_id does not exist, the API will return an appropriate error message:
```bash
{
    "message": "Student not found"
}
```


## 🤝 Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m "Added a new feature"`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

