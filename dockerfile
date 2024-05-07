# Use Ubuntu as the base image
FROM ubuntu:20.04 latest

# Install Nginx
RUN apt-get install -y nginx
  
# Copy nginx configuration file from host to container
COPY nginx.conf /etc/nginx/nginx.conf

# Update package lists and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 80

# Start Nginx service
CMD ["nginx", "-g", "daemon off;"]
