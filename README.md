###Builds OpenCV3 on a Resin device and uploads it to an S3 bucket.  
TODO: Support for ResinOS and Resin Supervisor version changes (if this happens)  
Right now this actually builds on Resin build server, and the RasPi only uploads the OpenCV packages it's provisioned with. In the future, we might scehdule compilation and do it on a distcc cluster.