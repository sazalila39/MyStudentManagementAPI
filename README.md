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
   
   Use `pip` to install the necessary packages:
   ```bash
   pip install fastapi uvicorn pydantic
   pip install -r requirements.txt
   ```
     

**4.** **Run the Development Server:**
   
Start the FASTAPI development server:
```bash
uvicorn main:app --reload
```
**5.** **Access the Application:**


Open your browser and navigate to:

**API Endpoints: http://127.0.0.1:8000**

**Swagger Documentation: http://127.0.0.1:8000/docs**


## 🛠 Troubleshooting

**If you encounter any issues during installation, ensure that:**

1. You are using the correct Python version (python --version to check).
2. Virtual environments are set up if you prefer isolated environments (e.g., using venv or virtualenv).
3. All required dependencies are installed without errors (pip install -r requirements.txt)


## 📚 API Endpoints

**Base URL: http://127.0.0.1:8000**
| Method  | Endpoint                      | Description                              |
|---------|-------------------------------|------------------------------------------|
| `GET`   | `/`                           | Returns a welcome message.              |
| `GET`   | `/get-student/{student_id}`   | Retrieves a student by their ID.        |
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
```bash
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

