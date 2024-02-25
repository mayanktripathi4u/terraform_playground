# Learning all about Variables and Data Types

In this Repo we will go over what is a variable or variable block, how to declare a variable, and how to use them in the terraform scripts.

# What is a variable or variable block in Terraform
Variables are fundamental constructs in every programming language because they are inherently useful in building dynamic programs. We use variables to store temporary values so that they can assist programming logic in simple as well as complex programs.

We already know that Terraform uses HCL (Hashicorp Configuration Language) to encode infrastructure. It is declarative in nature, meaning several blocks of code are declared to create a desired set of infrastructure.

Takign a step back, it is important to think of the complete Terraform configuration as a single function. As far as variables are concerned, we use them with function in the form of arguments, return values, and local variables. These are analogous to input variables, output variables, and local variables in Terraform.

Here we are focused on input variables. For other variables refer to local variables; output variables.

## Variable Syntax
```
    variable <name> {
    description = <optional description>
    type* = <type of variable>
    default = <optional default value>
    validation = {
        condition = <condational expression>
        error_message = "error message to display"
    }
    sensitive = <true / false>
    }

    or 

    variable "variable name" {
    default = "random value"
    description = "some random value"
    }
```

Example: 
```
        variable "my-variable" {
            default = "default value" # Optional
            description = "description of the variable" # Optional
        }
```

This block syntax defines a new variable by giving it a name, and the type keyword specifies its type. We can provide an optional description and default value (optional) using description and default keywords respectively.

Note : We could define empty variable as well as below.

## Empty Variable

```
        variable "variable name" {}
```
This is useful when we want the value to be passed during the runtime (meaning when `terraform plan` and `terraform apply` command is executed) and there are 3 ways in which we could pass the values.
1. Via CLI agrument (Passing the values in CLI as `-var` argument).
2. Via Terraform Environmental Variables.
3. Via Input files (Using `.tfvars` file to set variable values explicitly).

### CLI Agrumennt
With this approach we just run the `terraform plan` and pass the agruments using `-var`
```
    terraform plan -var="project=my-project-in-gcp" -var="credentials=my_credentials_file.json"
```
Running this command results in Terraform using these values instead of defaults.

While working with plan or apply commands, `-var` argument should be used for every variable to be overridden. 

### Terraform Environmental Variables
Input variable values can also be set using Terraform environment variables. 
A Terraform environment variable is similar to the parameter or argument of a function, allowing users to set their configuration without hardcoding values. This enables users to have the same infrastructure provisioning across environments without requiring them to maintain multiple copies of almost-similar code. 

They can be defined in a separate file and used throughout your configuration. The purpose of a Terraform tool is to have the same infrastructure provisioning across environments. 

Sometimes we have to manage different instances of infrastructures living inside different environments like development, QA,  staging or prod, it’s critical to provide the environmental context to your configuration without repeating the same code or polluting it with environment-specific hardcoded details. Terraform environment variables play a critical role in providing this abstraction. 

To do so, simply set the environment variable in the format `TF_VAR_<variable name>`.

The `variable name` part of the format is the same as the variables declared in the `variables.tf` file. 
For example, to set the `zone` variable run the below command to set its corresponding value.

```
    export TF_VAR_zone=us-west1-b
```

With this approach we have to first define the env. variables as below

```
    set TF_VAR_credentials=my_credentials_file.json
    export TF_VAR_credentials=my_credentials_file.json
    terraform plan -var="project=my-project-in-gcp" 
```
Note : In this example we have set only project, earlier example we also set the credentials, however as we already set or export the terraform env. variable so we do not have to explicitly mention during terraform plan or terraform apply.

Apart from the above environment variable, it is important to note that Terraform also uses a few other environment variables like `TF_LOG`, `TF_CLI_ARGS`, `TF_DATA_DIR`, etc. These environment variables are used for various purposes like logging, setting default behavior with respect to workspaces, CLI arguments, etc.



### Terraform Input File
Imagine a scenario where there are many variables used in the configuration. Passing the values using CLI arguments can become a tedious task. This is where `.tfvars` files come into play.

Create a file with the `.tfvars` extension and add the below content to it. I have used the name `values.tfvars` as the file name. This way we can organize and manage variable values easily.

This time, we should ask Terraform to use the `values.tfvars` file by providing its path to `-var-file` CLI argument. The final plan command should look as such:

``` terraform plan -var-file values.tfvars ```

The `-var-file` argument is great if you have multiple `.tfvars` files with variations in values. However, if you do not wish to provide the file path every time you run plan or apply, simply name the file as `<filename>.auto.tfvars`. This file is then automatically chosen to supply input variable values.

The default behavior is, you use a file named `terraform.tfvars` to set up values for your variables in Terraform. When you run commands like apply or plan, Terraform automatically picks up these values. Put this file in the main folder of your Terraform project. 


# How to Use Terraform Variables
Once you’ve defined a variable you can use or reference that variable in any part of your configuration. 
The syntax for using the variable in the configuration is as follows:

```
    var.<name>
``` 

EXAMPLE
```
resource "google_compute_instance" "my-app-instance" {
  ...
  zone = var.zone
  ...
}
```
At run time, Terraform will replace var.name with its value.

# Data Types
Terraform or Input variables supports various types / data types which can be categorized, as follows:

1. Primitive Types: Like string, number and bool.
2. Complex Types: Like list or map
3. User-defined types: Like object.
