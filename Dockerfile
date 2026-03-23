FROM alpine:latest

# Install rsync
RUN apk add --no-cache rsync

WORKDIR /config

# Create the directories
RUN mkdir -p /config/Internal 

# Copy your data
COPY ./GE/GEService/Internal/ /config/Internal/