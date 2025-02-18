# UmojaInformatics Project


## Umoja API

This is a simple Node.js REST API with PostgreSQL, JWT authentication, and Docker for containerization.

### 📌 Features
- User creation, retrieval, updating, and deletion.
- JWT authentication for secure access.
- PostgreSQL database connection using Sequelize.
- Docker support for easy deployment.

---

#### 🛠 **Installation & Setup**
##### **Clone the Repository**
```sh
git clone https://github.com/your-repo/umojainformatics.git
cd umoja-api

Create an .env File
Create a .env file in the root directory and add:

DATABASE_URL=postgres://umoja_user:Umoja@2025@db:5432/umoja_db
JWT_SECRET=supersecretkey

Run with Docker
Ensure you have Docker & Docker Compose installed.

Start the services:
docker-compose up --build

Stop the services:
docker-compose down

Run Without Docker (Manual Setup)
Install dependencies:
npm install
Run database migrations:
npx sequelize-cli db:migrate
Start the server:
npm start

📌 API Endpoints
🔐 Authentication
✅ Login
Endpoint: POST /login
Description: Generate a JWT token.
Request Body:
{
  "email": "admin@example.com",
  "password": "password"
}

Response:
{
  "access_token": "your.jwt.token"
}

👤 User Management
➕ Create User
Endpoint: POST /users
Authorization: Bearer Token (JWT Required)
Request Body:

{
  "name": "John Doe",
  "email": "john@example.com",
  "role": "admin"
}
Response:

{
  "message": "User created successfully"
}

📖 Get User by ID
Endpoint: GET /users/:id
Authorization: Bearer Token
Example Request:

curl -H "Authorization: Bearer YOUR_JWT_TOKEN" http://localhost:5000/users/acde070d-8c4c-4f0d-9d8a-162843c10333

Response:
{
  "id": acde070d-8c4c-4f0d-9d8a-162843c10333,
  "name": "John Doe",
  "email": "john@example.com",
  "role": "admin"
}

✏ Update User
Endpoint: PUT /users/:id
Authorization: Bearer Token
Request Body:

{
  "name": "John Updated",
  "email": "johnupdated@example.com",
  "role": "user"
}
Response:

{
  "message": "User updated successfully"
}

❌ Delete User
Endpoint: DELETE /users/:id
Authorization: Bearer Token
Response:

{
  "message": "User deleted successfully"
}

📌 Database Migrations
If running locally, apply migrations using:

npx sequelize-cli db:migrate

📌 Environment Variables
Ensure the .env file has the correct values:

DATABASE_URL=postgres://umoja_user:Umoja@2025@db:5432/umoja_db
JWT_SECRET=supersecretkey

📌 Troubleshooting
❌ "Database does not exist" error
Run:
docker-compose down -v
docker-compose up --build

❌ PostgreSQL connection refused
Check if the database is running:
docker ps
```

# POSTGRES-SCHEMA

## To set up and interact with your PostgreSQL database using the provided schema.sql and retrieved-data.sql files, follow these step-by-step instructions:

1. Prerequisites

Ensure you have the following installed on your system:

PostgreSQL: The relational database management system.
psql: The PostgreSQL command-line client.

2. Prepare Your SQL Files

Place the schema.sql and retrieved-data.sql files in a directory of your choice.

3. Create the Database

Before executing the SQL scripts, create the target database:

Open your terminal or command prompt.

Run the following command to create the database:

createdb -U your_username cms_db
Replace your_username with your PostgreSQL username.

4. Execute the Schema Script

To set up the database schema:

Run the following command:

psql -U your_username -d cms_db -f /path/to/schema.sql
Replace /path/to/schema.sql with the actual path to your schema.sql file.

5. Execute the Data Retrieval Script

To run the queries in retrieved-data.sql:

Run the following command:
psql -U your_username -d cms_db -f /path/to/retrieved-data.sql
Replace /path/to/retrieved-data.sql with the actual path to your retrieved-data.sql file.

6. Verify the Results

After executing the scripts, you can verify the results:

Connect to the database:
psql -U your_username -d cms_db
List the tables to confirm the schema was created:
\dt;
To view the data retrieved by the queries, you can run:

SELECT * FROM articles;
SELECT * FROM comments;


# AWS LAMBDA
## check aws_deployment.md