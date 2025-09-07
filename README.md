# ALX Travel App

A comprehensive Django REST API application for travel listings and bookings.

## Features

- REST API with Django REST Framework
- Swagger/OpenAPI documentation at `/swagger/`
- MySQL database integration
- CORS support for frontend integration
- Celery for async task processing
- Environment-based configuration

## Setup Instructions

### Prerequisites

- Python 3.8+
- MySQL Server
- Redis Server (for Celery)

### Installation

1. Create a virtual environment:
   ```bash
   python -m venv alx_travel_app_env
   source alx_travel_app_env/bin/activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Configure environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your database credentials
   ```

4. Set up the database:
   ```bash
   # Create MySQL database
   mysql -u root -p -e "CREATE DATABASE alx_travel_db;"
   
   # Run Django migrations
   python manage.py makemigrations
   python manage.py migrate
   ```

5. Create a superuser:
   ```bash
   python manage.py createsuperuser
   ```

6. Run the development server:
   ```bash
   python manage.py runserver
   ```

## API Documentation

- **Swagger UI**: http://localhost:8000/swagger/
- **ReDoc**: http://localhost:8000/redoc/

## Required Files Structure

```
alx_travel_app/
├── alx_travel_app/
│   ├── requirement.txt      # Dependencies list
│   ├── listings/           # Django app
│   ├── settings.py         # Configuration
│   └── urls.py            # URL patterns
└── manage.py              # Django management
```
# Updated Sun Sep  7 03:51:38 PM EAT 2025
# Project verified with global git config
