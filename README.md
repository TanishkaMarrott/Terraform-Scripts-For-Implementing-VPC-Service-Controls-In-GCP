# VPC Service Controls in GCP Using Terraform

This repository contains Terraform scripts to implement VPC Service Controls on Google Cloud Platform (GCP).

## Introduction

**VPC Service Controls** is a security feature in Google Cloud Platform (GCP) designed to provide additional security for your resources and data by defining a security perimeter around GCP services. This helps in controlling the movement of data between services inside and outside the defined perimeter, thereby mitigating data exfiltration risks.

## Key Concepts

1. **Security Perimeter**:
   - VPC Service Controls allows you to create a security perimeter around your GCP resources, restricting access to only those resources within the defined boundary.
   - This ensures that sensitive data cannot be moved to or accessed from outside the perimeter, enhancing data protection.

2. **Access Policies**:
   - These are fine-grained access control policies for your resources.
   - You can restrict access based on attributes such as the origin of the request, ensuring only trusted sources can interact with your resources.

3. **Prevent Data Exfiltration**:
   - By restricting which resources can communicate with each other and limiting access to the internet, VPC Service Controls helps prevent unauthorized data movement.
   - Ideal for scenarios where strict data governance and compliance requirements are needed.

4. **Integration with IAM**:
   - VPC Service Controls work in conjunction with Identity and Access Management (IAM) to enforce security policies.
   - This ensures that even if a user has IAM permissions, they cannot access resources outside the security perimeter without proper authorization.

5. **Service Perimeters and Access Levels**:
   - **Service Perimeters**: Define the boundary around GCP resources (e.g., Cloud Storage buckets, BigQuery datasets).
   - **Access Levels**: Specify the conditions under which requests are allowed through the perimeter (e.g., requests from specific IP ranges).

## Prerequisites

- Terraform installed on your machine
- GCP account with necessary permissions

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/terraform-vpc-service-controls.git
    cd terraform-vpc-service-controls
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Update `variables.tf` with your project-specific values.

4. Apply the Terraform scripts:

    ```bash
    terraform apply
    ```

## Resources Created

- **Access Policy**: The top-level container for managing access within the perimeter.
- **Service Perimeter**: Defines the boundary within which GCP resources can communicate.
- **Access Level**: Specifies the conditions (e.g., IP ranges) under which resources can be accessed.

## Theoretical Explanation

### Access Policies

Access policies are the top-level containers that help manage access levels and service perimeters. They enable you to define a set of rules and restrictions for your GCP resources, ensuring that only authorized users and services can interact with sensitive data.

### Service Perimeters

Service perimeters define the boundaries within which GCP resources can communicate. By setting up a service perimeter, you can restrict data movement between resources inside the perimeter and those outside it, effectively reducing the risk of data exfiltration.

### Access Levels

Access levels specify the conditions under which requests to GCP resources are allowed through the service perimeter. These conditions can include IP address ranges, device attributes, or user attributes, providing fine-grained control over who can access your resources.

### Benefits

1. **Enhanced Security**: Adds an additional layer of security by controlling and monitoring access to GCP services.
2. **Compliance**: Helps meet regulatory requirements by enforcing strict data handling policies.
3. **Simplified Management**: Centralizes security policy management for your GCP resources.

## Cleanup

To remove the resources created by Terraform, run:

    
    ```bash
    terraform destroy
    ```
    

## License

This project is licensed under the MIT License.
