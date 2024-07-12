# Learn about building .NET container images:
# https://github.com/dotnet/dotnet-docker/blob/main/samples/README.md
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG TARGETARCH
WORKDIR /source

# Copy everything
COPY . .

# Restore as distinct layers
RUN dotnet restore ./demo-map-server/demo-map-server.csproj -a $TARGETARCH
# Build and publish a release
RUN dotnet publish ./demo-map-server/demo-map-server.csproj -c Release -a $TARGETARCH --no-restore -o /app/out 

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
EXPOSE 8080
WORKDIR /app

COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "demo-map-server.dll"]
