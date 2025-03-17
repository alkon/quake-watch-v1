## Stage 1: Base Python Image
FROM python:3.12.0-slim-bookworm AS base
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends python3-venv && \
    rm -rf /var/lib/apt/lists/*

## Stage 2: Install dependencies
FROM base AS builder
WORKDIR /app
# Copy requirements and install Python dependencies
COPY requirements.txt .

RUN python3 -m venv /venv && \
    /venv/bin/pip install --no-cache-dir --upgrade pip && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt

## Stage 3: Build the application
FROM base AS final
WORKDIR /app
# Install curl for health check
RUN apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy only application files
COPY . .

# Copy virtual environment from dependency stage
COPY --from=builder /venv /venv

# Set environment variable
ENV PATH="/venv/bin:$PATH"

# Declare volume
VOLUME /data

# Run application
CMD ["python", "app.py"]