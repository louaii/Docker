# ASP.NET Core MVC Dockerized App

This project demonstrates how to containerize an ASP.NET Core MVC application using Docker.

---

## 📦 Step 1: Create the ASP.NET Core MVC Project

```bash
dotnet new mvc --name dotnetapp --output dockerdotnetapp
cd dockerdotnetapp
dotnet build
🐳 Step 2: Create the Dockerfile
Create a file named Dockerfile (no extension) inside the dockerdotnetapp folder with the following content:


# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /source

# Copy project file and restore dependencies
COPY *.csproj .
RUN dotnet restore

# Copy the rest of the source code and publish
COPY . .
RUN dotnet publish -c Release -o /app

# Stage 2: Create the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app

# Set environment variable to bind Kestrel to port 8080
ENV ASPNETCORE_URLS=http://+:8080

# Expose port 8080 from the container
EXPOSE 8080

# Copy the published app from the build stage
COPY --from=build /app .

# Start the application
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
🛠️ Step 3: Build the Docker Image
Make sure you're in the dockerdotnetapp directory, then run:


docker build --tag dotnetapp .
🚀 Step 4: Run the Docker Container

docker run -d -p 8080:8080 --name dotnetapp dotnetapp
Then open your browser and navigate to:


http://localhost:8080
✅ Step 5: Cleanup (Optional)
To stop and remove the container:


docker stop dotnetapp
docker rm dotnetapp

# Push on dockerhub
 docker commit dotnetapp <username>/dotnetapp
 docker login
 docker push <username>/dotnetapp

# Update on image
...Update on files as index.cshtml
dotnet build
docker build --tag dotnetapp .
docker run -d -p 8080:8080 --name dotnetapp dotnetapp
