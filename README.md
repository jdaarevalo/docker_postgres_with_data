## Creating and filling a Postgres DB with Docker Compose

This project create tables and fill the tables in a Postgres data base. The tables and data that create are in sql/ folder
## ER Diagram
The ER Diagram of DB is this
![ER Diagram](https://github.com/jdaarevalo/docker_postgres_with_data/images/ER_Diagram.png)

## ER Diagram
Set the variables in `sql/fill_tables.sql`
| Parameter | Description |
| ------ | ------ |
| number_of_sales | Number of rows to create in the table sale |
| number_of_users | Number of rows to create in the table users |
| number_of_products | Number of rows to create in the table products |
| number_of_stores | Number of rows to create in the table sale |
| number_of_coutries | Number of rows to create in the table countries |
| number_of_cities | Number of rows to create in the table cities |
| number_of_status_names | Number of rows to create in the table status_names |
| start_date | Date of the first sale |
| end_date | Date of the last sale |

## Params
If want change this params in `docker-compose.yaml`
| Parameter | Description |
| ------ | ------ |
| POSTGRES_USER | The Postgres user to connect **postgres** |
| POSTGRES_PASSWORD | The Postgres password to connect **postgres** |
| POSTGRES_DB | The Postgres password to connect **postgres** |
| port | The port mapped by Postgres is **5432** in your container. In this example, use the port **5438** on the host machine |

## Run
```sh
$ docker-compose up
```

