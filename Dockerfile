FROM ubuntu:20.04

# Install Wine
RUN dpkg --add-architecture i386
RUN apt update
RUN apt-get install --assume-yes wine64 wine32

# Set up environment variables
ENV TZ=UTC
RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes tzdata

# Copy MetaTrader 5 installation files
COPY ["MetaTrader5", "/root/.wine/drive_c/Program Files/MetaTrader5"]

# Configure Wine prefix
ENV WINEPREFIX=/root/.wine
ENV WINEARCH=win64

# Set the entry point
CMD ["wine", "/root/.wine/drive_c/Program Files/MetaTrader5/metatrader5.exe"]
