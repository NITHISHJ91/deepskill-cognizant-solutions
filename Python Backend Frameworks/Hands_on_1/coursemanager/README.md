# Hands-On 1 – Task 1

## Web Framework Foundations & Django Project Setup

This task is completed as part of the **Digital Nurture 5.0 – Python Backend Frameworks** module.

### Objective

The main objective of this task is to understand the basic concepts of web frameworks and the working of a Django application before starting development.

### Topics Covered

- Web Framework Concepts
- Request-Response Cycle
- Middleware
- WSGI and ASGI
- MVC and MVT Architecture
- Django Project Setup

### Software Used

- Python 3.12
- Django 6.0.7
- Visual Studio Code

### Project Setup

Install Django:

```bash
pip install django
```

Create a Django project:

```bash
python -m django startproject coursemanager
```

Move into the project directory:

```bash
cd coursemanager
```

Run the development server:

```bash
python manage.py runserver
```

Open the browser and visit:

```
http://127.0.0.1:8000/
```

### Task Completed

In this task, a file named `notes.py` was created containing comments explaining:

- Django Request-Response Cycle
- Role of Middleware
- Difference between WSGI and ASGI
- MVC and Django's MVT Architecture

### Learning Outcome

After completing this task, I understood how a request travels through a Django application, the purpose of middleware, the difference between WSGI and ASGI, and how Django follows the MVT architecture.

## Author

Nithish J