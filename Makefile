postgres:
	docker run --name postgres -e POSTGRES_USER=root -e POSTGRES_PASSWORD=senha -p 5432:5432 -d postgres:alpine

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres dropdb simple_bank

migrateup:
	migrate -path db/migration --database "postgresql://root:senha@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration --database "postgresql://root:senha@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb

