# Terraform Playground
Playing with Terraform

1. Random Provider
The random provider allows the use of randomness within Terraform configurations. This si a logical provider, which means that it works entirely within Terraform's logic and doesn't interact with any other services.

For Examples on this refer [01_Randon Folder](01_Random).
We are going to create a simple terraform program that genertaes and deploys a `random pet`. It is more like a coidng playground than an actual infrastructure components, as it genertaes a random, memorable name intended to be used for unique idempotent resources.

The name consists of a random animal and a two-word adjective, like "smart-tutrle" or "striking-crayfish". The random_pet resource takes a prefix and length as input and generates a random name accordingly.

In the said folder example code, I have use two major Terraform commands:
`random_pet` and `output`.

* The `random_pet` command is part of a suite of miscellaneous randomization functions that terraform provides, used here to genertae a random name for our resource.
* The `output` command allows us to view the output of our Terraform operations, in this case it will output the generated pet name.

One important point is the `keepers` agrument. This object allows us to specify valus that, when changed, will trigger a new name to be genertaed even though the length, prefix and separator haven't changed. 
Here, we are using a hard coded string "My Value", but in real case scenario this could be any other data that may change over time and requires a new name.


2. Archive Provider


