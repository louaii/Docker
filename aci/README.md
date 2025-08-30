Create and Deploy Container using Azure Container Instance:

Clone Azure-sample/aci-helloworld

Install Azure CLI

az --version //check azure cli installed

code .

cd aci-helloworld

docker build . -t Azure/aci-app

docker ls

docker images "Azure/*"

docker run -d -p 8080:8080 Azure/aci-app

docker container ls

create azure portal account

go to container registries

az account list-locations -o table

az group create --name DockerAzureGroup --location uaenorth

go to resources groups

az acr create --resource-group DockerAzureGroup --name DockerAzureContainer --sku Basic

go to containers registries

az arc show --name DockerAzureContainer --query loginServer -o table

copy login server

docker tag Azure/aci-app copied_login_server/aci-app:v1

docker images /// look for the added image

az acr login --name DockerAzureContainer

docker push copied_login_server/aci-app:v1 //check on container registries

az acr repository list --name DockerAzureContainer -o table  //check image

az acr repository show-tags --name DockerAzureContainer --repository aci-app -o table //check tag

az container create --resource-group DockerAzureGroup --name aci-app --image copied_login_server/aci-app:v1 --cpu 1 --memory 1 --registry-login-server copied_login_server --registry-username <username> --registry-password <password> --ipaddress public --dns-name-label <aciDNSLabel> --ports 80

check screenshot

check container AccessKeys in Containers Registry 

az container show --resource-group DockerAzureGroup --name aci-app-container --query instanceView.state

az container show --resource-group DockerAzureGroup --name aci-app-container --query ipAddress.fqdn

az container logs --resource-group DockerAzureGroup --name aci-app-container

az group delete --name DockerAzureGroup  

