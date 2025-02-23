# Stage 1: Base Image
FROM python:3.11-slim AS builder
# WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*
COPY requirements.txt /app/

# --no-cache-dir forces Docker to rebuild this layer and not to use the cached packages from the previous build
# this flag takes effect only if this line is triggered by docker, otherwise the pip command will run so the flag will not affect the current layer
RUN pip install --no-cache-dir --target=/app/requirements -r requirements.txt

# Stage 2: Final Image
FROM python:3.11-slim
# WORKDIR /app
COPY --from=builder /app/requirements /usr/local/lib/python3.11/site-packages/
COPY • /app
RUN useradd -m webapp
USER webapp
EXPOSE 8080
ENTRYPOINT FLASK_APP=/app/app.py flask run --host=0.0.0.0 --port=8080
