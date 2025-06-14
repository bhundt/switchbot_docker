FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install bluetooth dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bluez \
    libbluetooth-dev \
    dbus \
    libdbus-1-dev \
    python3-dbus \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/ ./src/

# Entrypoint into the application
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]