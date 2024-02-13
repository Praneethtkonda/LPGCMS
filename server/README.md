# LPGCMS
LahariPraneeth Gated Community Management System Server

## Run the protoc command to generate / re-generate the grpc files
```bash
$ cd routes/user
$ protoc --proto_path=. --go_out=./pb --go-grpc_out=./pb --go-grpc_opt=paths=source_relative --go_opt=paths=source_relative *.proto
```

## Running the server code
```bash
$ cd server
$ export DATABASE_URL='postgresql://root@localhost:26257/defaultdb?sslmode=disable'
$ go run main.go
2023/09/29 22:14:46 Server listening on port [::]50051
# You will get this below output after running the client command
2023/09/29 22:14:54 Received Name: Praneeth
2023/09/29 22:14:54 Received phone number: 8129691950
2023/09/29 22:14:54 Received Email address: test@email.com
2023/09/29 22:14:54 Received Password: secret
2023/09/29 22:14:54 Received Floor number: jj
```

## Running the server code using docker
```bash
$ cd server
$ docker compose up
[+] Running 2/1
 ✔ Network server_default     Created                                                                              0.0s
 ✔ Container server-server-1  Created                                                                              0.0s
Attaching to server-server-1
server-server-1  | 2023/10/03 13:02:29 Server listening on port [::]50051
# You will get this below output after running the client command
2023/09/29 22:14:54 Received Name: Praneeth
2023/09/29 22:14:54 Received phone number: 8129691950
2023/09/29 22:14:54 Received Email address: test@email.com
2023/09/29 22:14:54 Received Password: secret
2023/09/29 22:14:54 Received Floor number: jj
```

## Running the client code to test the grpc server
```bash
$ cd server/client
$ go run main.go
2023/09/29 22:15:06 Message from grpc server: User registered: Praneeth
```