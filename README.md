# QuakeWatch

A simple Flask application to to monitor earthquake data.

## Prerequisites

- Docker
- Docker Compose

## Building and Running

1.  Clone the repository.
2.  Navigate to the project directory.
3.  Build the Docker image:

    ```bash
    docker-compose build
    ```

4.  Run the Docker container:

    ```bash
    docker-compose up -d
    ```

    * The `-d` flag runs the container in detached mode (in the background).

5.  Access the application at `http://localhost:5000`.

## Stopping the application

```bash
docker-compose down