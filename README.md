Add hadolint to azure devops ci cd pipeline

Step 1:
Create a dockerfile

Step 2:
Create a .hadolint.yaml file

Step 3:
Create pipeline in azure devops using the sample azure-pipelines.yml from this project

[sample command to run hadolint test on your dockerfile]
docker run --rm -i -v hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile

Step 4: 
Run pipeline 

Step 5
Congradulations you have successfully implemented hadolint in your pipeline
