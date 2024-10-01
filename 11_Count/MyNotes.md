Using `count` to create thos many resources, at the same time we could also refer to the List.

We can refer to the `index` from `count`, however it may not be suitable for all cases, as below while determining the cidr block, if we refer `count.index` then it will have value as 0,1,2 and the result of cider block will be invalid. So to fix this we could use the `count.index` to check the index value from list.

<main.tf>
```
variable "subnet_cidr_blocks {
    description = "CIDR Blocks for the Subnet"
    type = list(string)
    default = ["10.0.0.0/19", "10.0.32.0,19", "10.0.64.0/19"]
}

resource "aws_subnet" "example" {
    count = length(var.subnet_cidr_blocks)
    vpc_id = "10.0.0.0/16"
    #cidr_block = "10.0.${count.index}.0/19" 
    cidr_block = var.subnet_cidr_blocks[count.index]
    availability_zone = "us-east-1a"
}

output "subnet_at_index_1" {
    value = var.subnet_cidr_blocks[1]
}

output "first_id" {
    value = aws_subnet.example[0].id
}

output "all_id" {
    value = aws_subnet.example[*].id
}

```

Refer [video](https://www.youtube.com/watch?v=7S94oUTy2z4) to compare the TF codes with programming lang and learn.

# Limitation of `count`
* 



# for_each

Syntax
```
resource "<PROVIDER_RESOURCE>" "<NAME>" {
    for_each = <COLLECTION>
    [CONFIG ...]
}
```
COLLECTION is a set or map to loop over (lists ate not supported when using for_each on a resource).
CONFIG consists of one or more arguments that are specific to that resource. Within CONFIG we can use `each.key` and `each.value` to access the key and value of the current item in collection.

```
resource "aws_subnet" "example" {
    for_each = toset(var.subnet_cidr_blocks)
    vpc_id = "10.0.0.0/16"
    cidr_block = each.value
    availability_zone = "us-east-1a"
}

output "all_id" {
    # value = aws_subnet.example
    value = values(aws_subnet.example)[*].id
}

```