## Creating and filling a Postgres DB with Docker Compose

This project create tables and fill the tables in a Postgres data base. The tables and data that create are in sql/ folder

Read the explanation here [Creating and filling a Postgres DB with Docker compose](https://levelup.gitconnected.com/creating-and-filling-a-postgres-db-with-docker-compose-e1607f6f882f)
## ER Diagram
The ER Diagram of DB is this:

<img width="809" alt="ER_Diagram" src="https://user-images.githubusercontent.com/2475570/106355076-d4025700-62c3-11eb-90e6-41c3ee47c06b.png">

## DB Variables
Set the variables in `sql/fill_tables.sql`
| Parameter | Description |
| ------ | ------ |
| number_of_sales | Number of rows to create in the table sale |
| number_of_users | Number of rows to create in the table users |
| number_of_products | Number of rows to create in the table product |
| number_of_stores | Number of rows to create in the table store |
| number_of_coutries | Number of rows to create in the table country |
| number_of_cities | Number of rows to create in the table city |
| number_of_status_names | Number of rows to create in the table status_name |
| start_date | Date of the first sale |
| end_date | Date of the last sale |

## Params
If want change this params in `docker-compose.yaml`
| Parameter | Description |
| ------ | ------ |
| POSTGRES_USER | The Postgres user to connect **postgres** |
| POSTGRES_PASSWORD | The Postgres password to connect **postgres** |
| POSTGRES_DB | The Postgres database name to connect **postgres** |
| port | The port mapped by Postgres is **5432** in your container. In this example, use the port **5438** on the host machine |

## Run
```sh
$ docker-compose up
```

