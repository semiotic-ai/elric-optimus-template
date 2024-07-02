# elric-optimus-template

This is a starting repository for a new project using the Elric Optimus framework.

## Getting Started

### Prerequisites

- Docker
- Docker Composer
- Make

### Environment Variables

#### Authentication

The only must-have environment variable is `SUBSTREAMS_API_KEY`, which is the API key for the Substreams API.
Register on https://app.streamingfast.io/ and create a new project to get your API key and generate your access token.

#### .env

Copy the .env.example file into .env and update the values accordingly.

## Running the project

### Configuring

Add your abi to the `abi/` folder and update the configuration file at `config/substream_config.json`.

### Building
Execute the following command to build your substream and schema:

```bash
make build
```

The output is used by `elric-rs` to index the data.

### Indexing

Execute the following command to start the project:

```bash
make start
```

Access your clickhouse database at `http://default:default@localhost:8123`.

### Cleanup

Execute the following command to stop the project:

```bash
make stop
```
