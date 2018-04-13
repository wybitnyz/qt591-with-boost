FROM centos
MAINTAINER Maciej Czarnecki <mcczarny@gmail.com>
ENV PATH="${PATH}:/opt/qt/5.9.1/gcc_64/bin/"
ADD qt-installer-noninteractive.qs .
RUN yum install -y epel-release git rpm-build rpmdevtools libstdc++-devel gcc-c++ make cmake3 boost boost-devel libcurl libcurl-devel libxml++ libxml++-devel systemd-devel libuuid-devel java-1.7.0-openjdk-devel \
    && curl -sSL https://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run -o qt.run \
&& chmod +x qt.run \
&& sync \
&& ./qt.run --platform minimal --script qt-installer-noninteractive.qs -v --proxy \
&& rm -rf \
  qt.run \
  /var/lib/apt/lists/* \
  /opt/qt/update.rcc \
  /opt/qt/components.xml \
  /opt/qt/InstallationLog.txt \
  /opt/qt/MaintenanceTool* \
  /opt/qt/Tools \
  /opt/qt/Docs \
  /opt/qt/network.xml \
  /opt/qt/Examples \
