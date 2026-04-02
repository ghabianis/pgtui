# pgtui - A Terminal UI for PostgreSQL

`pgtui` is a powerful and intuitive terminal user interface for PostgreSQL databases, built with Rust. It provides a quick and efficient way to interact with your PostgreSQL instances directly from your terminal.

This project includes a `docker-compose` setup to easily spin up a PostgreSQL database, `pgtui` itself, and `pgAdmin` for web-based database management.

## Features

*   **Interactive Terminal UI**: Navigate and manage your PostgreSQL databases with ease.
*   **Dockerized Environment**: Quick setup with `docker-compose` including PostgreSQL, pgtui, and pgAdmin.
*   **Database Management**: Execute queries, browse tables, view data, and more.
*   **Configurable Connections**: Easily manage multiple database connections.

## Getting Started

To get started with `pgtui`, follow the instructions below.

### Prerequisites

Before you begin, ensure you have the following installed on your system:

*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1.  **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/pgtui.git
    cd pgtui
    ```

2.  **Environment Setup**:
    Copy the example environment file and customize it if needed. This file contains default credentials for PostgreSQL and pgAdmin.

    ```bash
    cp .env.example .env
    ```

    You can edit the `.env` file to change `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`, pgAdmin credentials, or PostgreSQL port if necessary.

### Running pgtui

To start all the services (PostgreSQL, pgtui, and pgAdmin), run the following command in the root directory of the project:

```bash
docker-compose up -d
```

This command will build the `pgtui` Docker image, start the PostgreSQL database, and launch `pgAdmin` in the background.

Once the services are up, you can access `pgtui` by attaching to its Docker container:

```bash
docker attach pgtui
```

This will open the `pgtui` terminal interface, connected to your PostgreSQL database.

## Configuration

`pgtui` uses a `config.toml` file for database connection settings. This file is mounted into the `pgtui` container from `./pgtui/config.toml`.

A default `config.toml` is provided with a connection string to the `postgres` service within the Docker network:

```toml
dbs = [
  "postgres://postgres:postgres@postgres:5432/pgtui"
]
```

You can modify `./pgtui/config.toml` to add more database connections or change existing ones. Remember to restart the `pgtui` container for changes to take effect if you edit this file while `pgtui` is running.

## Screenshots

Here are some screenshots showcasing the `pgtui` user interface:

### Screenshot 1

![pgtui UI - Screenshot 1](./1.png)

### Screenshot 2

![pgtui UI - Screenshot 2](./2.png)

## pgAdmin Access

You can access `pgAdmin` (a web-based GUI for PostgreSQL) by navigating to `http://localhost:8080` in your web browser.

Use the following default credentials to log in:

*   **Email**: `admin@admin.com`
*   **Password**: `admin`

You can change these credentials in the `.env` file before running `docker-compose up -d`.

## Stopping Services

To stop and remove all services defined in `docker-compose.yml`, run:

```bash
docker-compose down
```

To stop the services without removing the volumes (e.g., to preserve your PostgreSQL data), use:

```bash
docker-compose stop
```

## Contributing

We welcome contributions! If you have any ideas, suggestions, or bug reports, please open an issue or submit a pull request on the GitHub repository.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
