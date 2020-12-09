FROM mcr.microsoft.com/dotnet/sdk:5.0 AS builder
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -r linux-x64 -o app

FROM mcr.microsoft.com/dotnet/aspnet:5.0
ENV ASPNETCORE_ENVIRONMENT="Development"
WORKDIR /app
COPY --from=builder ["/src/app", "/app"]
EXPOSE 80
CMD [ "/app/BlazorUnicorn" ]
