# Conference Kata

System design for [Conference Kata](https://nealford.com/katas/kata?id=AllStuffNoCruft)

### System Landscape
![Component View](workspace/.structurizr/images/Component-003-thumbnail.png)

### Container view
![conference app](workspace/.structurizr/images/Component-002-thumbnail.png)

### Component view
![component view](workspace/.structurizr/images/Component-003-thumbnail.png)

## How to run this example
Execute this command to run a Docker container with a structurizr lite image.

```bash
docker run --name spring-io-workshop-architecture --env=PORT=8080 --volume=$(pwd)/workspace:/usr/local/structurizr -p 8888:8080 -d structurizr/lite:latest
```

## Links

* [Documentation](http://localhost:8888/workspace/documentation)
* [ADRs](http://localhost:8888/workspace/decisions)
* [Diagrams](http://localhost:8888/workspace/explore)