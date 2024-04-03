FROM grafana/grafana-oss:latest

# Define the build arguments
ARG PORT
ARG VERSION
ARG GF_DEFAULT_INSTANCE_NAME
ARG GF_SECURITY_ADMIN_USER
ARG GF_SECURITY_ADMIN_PASSWORD
ARG GF_INSTALL_PLUGINS
ARG GF_LOG_MODE
ARG VERSION=latest

# Set the environment variables using the build arguments
ENV PORT=${PORT}
ENV VERSION=${VERSION}
ENV GF_DEFAULT_INSTANCE_NAME=${GF_DEFAULT_INSTANCE_NAME}
ENV GF_SECURITY_ADMIN_USER=${GF_SECURITY_ADMIN_USER}
ENV GF_SECURITY_ADMIN_PASSWORD=${GF_SECURITY_ADMIN_PASSWORD}
ENV GF_INSTALL_PLUGINS=${GF_INSTALL_PLUGINS}
ENV GF_LOG_MODE=${GF_LOG_MODE}

# Set the environment variable
ENV GF_PATHS_DATA='/var/lib/grafana'

# Make the directory writable
USER root
RUN mkdir -p /var/lib/grafana && \
    chown -R grafana:grafana /var/lib/grafana && \
    chmod -R 777 /var/lib/grafana

# Switch back to the grafana user
USER grafana
