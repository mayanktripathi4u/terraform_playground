# Terraform Console
To navigate to console type, first we have to initialice our terraform code.
`terraform init`
followed by 
`terraform console` 
which will take us to the console of terraform... here we can check or play with the local variables and many much.


```
terraform console

> upper("abcdef")
output is : ABCDEF

> upper(local.str1)
output is : PIZZA, as str1 holds the value as "pizza".
```