FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore ./HelloWorldService.csproj
RUN dotnet publish ./HelloWorldService.csproj -c Release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /usr/app

RUN apt-get update \
 && apt-get install -y wget python3-dev \
 && wget -O /usr/app/gg.deb https://github.com/grft-dev/graftcode-gateway/releases/latest/download/gg_linux_amd64.deb \
 && dpkg -i /usr/app/gg.deb \
 && rm /usr/app/gg.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY --from=build /out/ /usr/app/

EXPOSE 80
EXPOSE 81

CMD ["gg", "--modules", "/usr/app/HelloWorldService.dll"]