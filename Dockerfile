FROM centos:8.1.1911
ENV PATH="${PATH}:/opt/qt5.9.1/5.9.1/gcc_64/bin/"
ENV CMAKE_PREFIX_PATH="/opt/qt5.9.1/5.9.1/gcc_64/lib/cmake"
ADD qt-installer-noninteractive.qs .
RUN yum install -y gcc gcc-c++ cmake maven git rpm-build rpmdevtools libstdc++-devel make boost boost-devel libcurl-devel systemd-devel libuuid-devel java-1.8.0-openjdk-devel mesa-libGL-devel graphviz ncurses-devel hivex-devel
RUN curl -SL https://download.qt.io/official_releases/qt/5.9/5.9.1/qt-opensource-linux-x64-5.9.1.run -o qt.run \
&& chmod +x qt.run \
&& sync \
&& ./qt.run --platform minimal --script qt-installer-noninteractive.qs -v --proxy \
&& rm -rf \
  qt.run \
  /opt/qt/update.rcc \
  /opt/qt/components.xml \
  /opt/qt/InstallationLog.txt \
  /opt/qt/MaintenanceTool* \
  /opt/qt/Tools \
  /opt/qt/Docs \
  /opt/qt/network.xml \
  /opt/qt/Examples
