Overwiev:
 - Simple .NET backend exposing a single method: GetHelloWorldMessage
 - Service is hosted locally using Graftcode Gateway
 - Gateway authenticates using a Project Token generated in the Graftcode Portal
 - The service can be discovered and invoked via Graftcode Vision

 Prerequisites:
  - Docker
  - Graftcode account

How to open project: 
 1. Build the image:
  docker build -t hello-graft .
