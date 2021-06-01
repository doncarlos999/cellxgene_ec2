# cellxgene_ec2

Create EC2 t2.micro instance using ubuntu 20.04 LTS

Select subnet to access EFS

Add /scratch EFS File system as /scratch

16 GB storage to fit cellxgene and plugins onto instance

Security group that had port 80 TCP open to all for HTTP and port 22 open to all for SSH

Run `src/1.setup.sh` to install awscli and then configure aws credentials

Set environmental variables:

`export NEW_USER=<desired webserver username>`

`export NEW_USER_PASS=<desired webserver password>`

`export S3_BUCKET=<desired s3 bucket to mount>` 

`src/2.setup.sh` to finish set up
