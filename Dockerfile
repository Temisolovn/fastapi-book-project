# Use a lightweight Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt update && apt install -y nginx

# Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start FastAPI and Nginx
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port 8000 & nginx -g 'daemon off;'"]
