FROM rust:latest

# Install PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install pgTUI
RUN cargo install pgtui

CMD ["pgtui"]