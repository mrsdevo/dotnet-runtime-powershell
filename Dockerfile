# We use Ubuntu rather than the default Debian image because this image correctly packages the old libssl & libcrypto versions that libpsrpcclient depends upon.
#FROM mcr.microsoft.com/dotnet/core/runtime:3.1-bionic AS base
FROM mcr.microsoft.com/dotnet/core/runtime:3.1-buster-slim AS base

# This image lacks an /etc/services file, so we supply one to work around this issue: https://github.com/Microsoft/omi/issues/623

RUN apt-get update && apt-get install -y gss-ntlmssp && echo 'http            80/tcp          www www-http' > /etc/services

#RUN apt-get -y install wget && wget multiarch-support && wget "http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb" && dpkg -i libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb


RUN apt-get -y install wget && wget "http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1d-0+deb10u3_amd64.deb" && dpkg -i libssl1.1_1.1.1d-0+deb10u3_amd64.deb

# TODO: Clear apt cache.
