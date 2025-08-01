
o	Pulled source (package) from github. 

o	Created a buildspec.yml to created image using docker file which is presented in repository (GIT) with automated process. 

o	After storing image with tag in AWS ECR and We have built with this image using Code build. 

o	Code Build has been successful with output status. 

o	Code pipeline has been created with Appropriate IAM roles. 

o	In code pipeline, Source has been pointed out from Github repository and chose build stage as code build and deploy stage is as per requirement AWS EKS Cluster. 

o	Created Deployment and service.yml

o	Applied Kubernetes manifests using kubectl in EKS 

o	deploy the image into the EKS cluster. 
