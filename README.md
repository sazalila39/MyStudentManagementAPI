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

