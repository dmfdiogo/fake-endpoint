# Fake Endpoint JSON Server

This project uses `json-server` to create a fake REST API for testing and prototyping.

## Getting Started

### Prerequisites

Make sure you have Node.js and npm installed on your machine. You can download them from [nodejs.org](https://nodejs.org/).

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/fake-endpoint.git
    ```
2. Navigate to the project directory:
    ```sh
    cd fake-endpoint
    ```
3. Install the dependencies:
    ```sh
    npm install
    ```

### Usage

1. Start the JSON server:
    ```sh
    npm start
    ```
2. The server will run at:
    ```
    http://localhost:3000
    ```

### Running with Docker

You can also run the JSON server using Docker. Follow these steps:

#### Run manually:

1. Build the Docker image:
    ```sh
    docker build -t fake-endpoint .
    ```

2. Run the Docker container:
    ```sh
    docker run -p 3000:3000 fake-endpoint
    ```

3. The server will run at:
    ```
    http://localhost:3000
    ```

#### Automatic run using start-server.sh

For convenience, you can use the provided `start-server.sh` script which automates the Docker deployment process:

1. Make the script executable:
```sh
chmod +x start-server.sh
```

2. Run the script:
```sh
./start-server.sh
```


### Customizing the Data

- The data for the JSON server is located in the `db.json` file. You can modify this file to change the data served by the API.

### Available Routes

- You can access the available routes by navigating to `http://localhost:3000` in your browser. The routes are generated based on the structure of `db.json`.

### Example

If your `db.json` looks like this:
```json
{
  "posts": [
    { "id": 1, "title": "Hello World" }
  ],
  "comments": [
    { "id": 1, "body": "Nice post!", "postId": 1 }
  ]
}
```

You can access:
- `http://localhost:3000/posts`
- `http://localhost:3000/comments`

### Contributing

Feel free to submit issues or pull requests if you find any bugs or have suggestions for improvements.

### License

This project is licensed under the MIT License.
