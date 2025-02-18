# AWS Lambda, API Gateway, S3, RDS, and IAM Setup Guide

### This guide provides step-by-step instructions to set up an AWS environment comprising AWS Lambda, API Gateway, S3, RDS, and IAM roles. The objective is to create a REST API that accepts a JSON payload and returns a personalized greeting, configure an S3 bucket for static file storage, deploy and secure an RDS PostgreSQL database, and establish IAM roles for security.


1. Setting Up AWS Lambda and API Gateway
Objective
Create a REST API using AWS Lambda and API Gateway that accepts a JSON payload and returns a personalized greeting.

Step 1.1: Create the Lambda Function
Sign in to AWS Management Console: Navigate to the AWS Lambda service.

Create Function: Click on "Create function" and choose "Author from scratch".

Configure Function:

Function Name: Enter a name, e.g., UmojaLambdaFunction.
Runtime: Select Python 3.13.
Function Code: In the code editor, paste the following code:

import json

def lambda_handler(event, context):
    name = event.get('name', 'Guest')
    message = f"Hello, {name}!"
    return {
        'statusCode': 200,
        'body': json.dumps({'message': message})
    }
Deploy: Click "Deploy" to save the function.

Step 1.2: Create the API Gateway

Navigate to API Gateway: Go to the API Gateway service.
Create API: Click on "Create API" and choose "REST API".
Configure API:
API Name: Enter a name, e.g., UmojaRestApiGateway.
Create API: Click "Create API".
Create Resource:
In the API dashboard, click on "Actions" > "Create Resource".
Enter a resource name, e.g., greetings, and click "Create Resource".
Create Method:
With the greetings resource selected, click on "Actions" > "Create Method" and choose "POST".
In the integration type, select "Lambda Function" and check "Use Lambda Proxy integration".
Enter the Lambda function name (UmojaLambdaFunction) and click "Save".
Deploy API:
Click on "Actions" > "Deploy API".
Create a new deployment stage, e.g., production, and click "Deploy".


2. Configuring an AWS S3 Bucket for Static Storage
Objective
Set up an S3 bucket for static file storage and configure permissions.

Step 2.1: Create the S3 Bucket
Navigate to S3: Go to the Amazon S3 service.
Create Bucket:
Click on "Create bucket".
Enter a unique bucket name and select a region.
Click "Create".

Step 2.2: Configure Bucket Permissions
Select Bucket: Choose the newly created bucket.

Permissions Tab:

Go to the "Permissions" tab.
Under "Block public access (bucket settings)", click "Edit".
Uncheck "Block all public access" and click "Save changes".
Note: Ensure that making the bucket public aligns with your security requirements.


3. Deploying and Securing an RDS PostgreSQL Database
Objective
Deploy a PostgreSQL database using AWS RDS (Free Tier eligible instance - db.t3.micro) and ensure security best practices.

Step 3.1: Create the RDS Instance
Navigate to RDS: Go to the Amazon RDS service.
Create Database:
Click on "Create database".
Choose "Standard Create".
Select "PostgreSQL" as the engine.
In the "Templates" section, choose "Free tier".
For "DB instance identifier", enter a name, e.g., umoja-pg-db-instance.
Set the "Master username" and "Master password".
In the "DB instance size" section, select db.t3.micro.
Configure other settings as needed and click "Create database".

Step 3.2: Configure Security Groups
Navigate to Security Groups: After the instance is created, go to the "VPC security groups" section.
Edit Inbound Rules:
Click on the security group link to open the "Security Groups" page.
In the "Inbound rules" tab, click "Edit inbound rules".
Add a rule to allow access to the database from your application servers or IP addresses.


4. Configuring IAM Roles for Security
Objective: Use AWS IAM roles and policies to ensure security best practices.

Step 4.1: Create an IAM Role
Navigate to IAM: Go to the IAM service.
Create Role:
Click on "Roles" > "Create role".
Choose "AWS service" and select the service that will assume this role (e.g., Lambda).
Click "Next: Permissions".
Attach the necessary policies for your use case.
Click "Next: Tags", add tags if needed, and then click "Next: Review".
Enter a role name and click "Create role".

Step 4.2: Attach the IAM Role to the Lambda Function
Navigate to AWS Lambda: Go to the AWS Lambda service.
Select Function: Choose your function (UmojaLambdaFunction).
Configure Execution Role:
In the "Configuration" tab, under "Execution role", click "Edit".
Choose "Use an existing role" and select the role you created earlier.
Click "Save".