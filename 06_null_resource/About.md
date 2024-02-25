# Terraform NULL Resource
Terraforn `null_resource` is widely used because it acts as an empty container or resource shell. 
Inside this container, we can define and execute arbitrary code or scripts without being tied to a specific resource lifecycle.

One particular use case for the `null_resource` in Terraform is to trigger external processes or perform actions that are not directly related to any particular infrastructure resource, such as running a custom script or executing a remote command on a server.

In here as an example will see how to print “Hello World” to the terminal every time the ID variable is changed.
Same can be used for any resource.

