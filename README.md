# infra-lucid

What I didn't finish:
1) last bit of the user data to set RDS stuff as env vars on the ec2s
2) certs/DNS for routing to alb
3) security groups for the alb/ec2s
4) s3 bucket for alb logs
5) lifecycle hook for the autoscaling launch


Also - naming stuff was hard. I was moving way too quick to get any standardization on the naming in place.

Also also, quick answers to the questions:
How would a future application obtain the load balancer’s DNS name if it wanted to use this service?
We can output it as part of the terraform if A records are ok, otherwise purchase a domain an configure a CNAME to route to the lb A record.

What aspects need to be considered to make the code work in a CD pipeline (how does it successfully and safely get into production)?
Service account for execution within the pipeline. Secrets injection if not using aws secrets storage. Probably more, just spitballing right now.

Things I added to the existing networking module:
- another round of private subnets for the postgres RDS stuff
- assuming using above terraform 0.12 so that the data lookup against resource creation resolves for db password generation and storage in AWS secrets storage
- did my best to sort by modules, should hopefully make stuff findable