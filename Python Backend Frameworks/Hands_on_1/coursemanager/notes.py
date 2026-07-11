# ============================================================
# Hands-On 1 - Task 1
# Python Backend Frameworks
# Topic: Web Framework Foundations & Django Project Setup
# ============================================================


# ============================================================
# 1. Request-Response Cycle in Django
# ============================================================

# When a user enters the URL:
# http://127.0.0.1:8000/api/courses/

# The request follows these steps:

# Step 1:
# The browser sends an HTTP GET request to the Django server.

# Step 2:
# The request first passes through Django Middleware.

# Step 3:
# The URL Router (urls.py) checks the requested URL.

# Step 4:
# The matching View function is called.

# Step 5:
# The View communicates with the Model.

# Step 6:
# The Model retrieves the required data from the database.

# Step 7:
# The retrieved data is returned back to the View.

# Step 8:
# The View prepares an HTTP Response.

# Step 9:
# The response again passes through Middleware.

# Step 10:
# Finally, the response is sent back to the browser.



# ============================================================
# 2. Middleware
# ============================================================

# Middleware is software that processes every request before
# it reaches the View and every response before it reaches
# the browser.

# Built-in Middleware Examples:

# 1. SecurityMiddleware
#    - Provides security features.
#    - Protects against common security attacks.

# 2. AuthenticationMiddleware
#    - Identifies the currently logged-in user.
#    - Makes user authentication available throughout Django.



# ============================================================
# 3. WSGI vs ASGI
# ============================================================

# WSGI (Web Server Gateway Interface)
#
# - Supports synchronous applications.
# - Handles one request at a time.
# - Used by Django by default.
# - Suitable for traditional web applications.

# ASGI (Asynchronous Server Gateway Interface)
#
# - Supports asynchronous programming.
# - Can handle multiple requests simultaneously.
# - Suitable for WebSockets, real-time chat applications,
#   live notifications and asynchronous APIs.

# Django uses WSGI by default.
# We switch to ASGI when building asynchronous or real-time
# web applications.



# ============================================================
# 4. MVC vs MVT
# ============================================================

# MVC Pattern

# Model
# - Handles database operations.

# View
# - Displays information to the user.

# Controller
# - Handles user requests and application logic.


# Django follows the MVT Pattern

# Model
# - Same as MVC Model.
# - Handles database operations.

# View
# - Acts like the Controller in MVC.
# - Contains business logic and processes requests.

# Template
# - Acts like the View in MVC.
# - Displays the data to the user.



# ============================================================
# MVC to MVT Mapping
# ============================================================

# MVC Model      -> Django Model

# MVC View       -> Django Template

# MVC Controller -> Django View



# ============================================================
# End of Hands-On 1 Task 1
# ============================================================