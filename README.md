
# go-start
golang learning and setup project

## cheat sheet

```
# run go code
go run mygofile.go

# format code
go fmt mygofile.go

# use docs
godocs math/rand Intn

# build binary
go build

# go get dependencies
go get -v go-start/kubernetes/admission/webhooks/validating/denyenv/

```

## vscode remote container setup
- install the vscode remote container extension
- run `make setup` to start docker-compose setup
- click on the bottom bar on the left "Open a remote window" button (looks almost like "><")
- choose to attach to running container ("Remote-Containers: Attach to Running Container...") and choose the one with the service name in the conatiner name e.g. when the docker-compose service name is `goenv` the container name should be something like `go-start_goenv_1`
