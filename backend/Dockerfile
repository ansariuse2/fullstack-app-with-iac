# Use the official Python slim image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Set up the application
WORKDIR /usr/src/app
COPY . /usr/src/app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 8000
EXPOSE 8000

# Run migrations, Gunicorn, and Nginx
CMD ["sh", "-c", "python manage.py migrate && \
    gunicorn RgcBaseApps.wsgi:application --bind 127.0.0.1:8000 --timeout 120 & \
    nginx -g 'daemon off;'"]
