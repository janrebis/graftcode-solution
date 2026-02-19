## Overview
- Simple .NET backend exposing a single method: `GetHelloWorldMessage`
- Service is hosted locally using **Graftcode Gateway (gg)**
- Gateway can run:
  - **standalone** (no Project Key) for quick local testing
  - **with Portal integration** using a **Project Key (JWT)** generated in the Graftcode Portal
- The service can be discovered and invoked via **Graftcode Vision**

## Prerequisites
  - .NET 9
  - Git
  - Docker

## How to run

### 1. Clone repository
    ```bash
    git clone https://github.com/janrebis/graftcode-solution.git
    cd graftcode-solution
    ```
### 2. Build docker image
    ```bash
    docker build -t hello-graft .
    ```
### 3. Run locally (works standalone, without Project Key)
    ```bash
      docker run --rm -p 80:80 -p 81:81 hello-graft \
      gg --GV --modules "HelloWorldService.dll"
    ```

  - if port is already in use, try: 
  ```bash
    docker run --rm -p 8080:80 -p 8181:81 hello-graft \
    gg --GV --modules "HelloWorldService.dll"
  ```
### 4. Open Vision locally
Open in browser:
    ```
    http://localhost:81/GV
    ```
### 5. Run with Projekt Key 
    ```bash
    docker run --rm -p 80:80 -p 81:81 hello-graft \
      gg --projectKey "<YOUR_PROJECT_KEY>" --GV \
        --modules "HelloWorldService.dll"
    ```

NOTICE: Project Keys are secrets and are not stored in this repository or Docker image. Provide the key with the docker run command.

### 6. Verify
In Vision, locate HelloWorldService() and run GetHelloWorldMessage(). It should output "Hello world!!"
