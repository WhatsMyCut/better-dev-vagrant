#!/bin/bash
# variables
WORKING_DIR=/usr/local/bin/jvm
JAVA_MAJOR_VERSION=11.0.5+10
JAVA_VERSION=11.0.5
JAVA_TOKEN=e51269e04165492b90fa15af5b4eb1a5
JAVA_PLATFORM=linux-x64

# working dir
sudo mkdir -p ${WORKING_DIR}
sudo chown -R ${USER} ${WORKING_DIR}
cd ${WORKING_DIR}
# download
sudo curl -L -b 'oraclelicense=accept-securebackup-cookie' \
  http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}/${JAVA_TOKEN}/jdk-${JAVA_VERSION}_${JAVA_PLATFORM}_bin.tar.gz > ${WORKING_DIR}/jdk-${JAVA_VERSION}_${JAVA_PLATFORM}_bin.tar.gz
cwd && ls -al

# wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
#   https://download.oracle.com/otn/java/jdk/${JAVA_MAJOR_VERSION}/${JAVA_TOKEN}/jdk-${JAVA_VERSION}_${JAVA_PLATFORM}_bin.tar.gz

# unpack
sudo tar -xvzf jdk-${JAVA_VERSION}_${JAVA_PLATFORM}_bin.tar.gz

sudo ln -sf ${WORKING_DIR}/${JAVA_HOME_DIR} /usr/local/jvm/${JAVA_TOKEN}
JAVA_HOME=${WORKING_DIR}/jdk-${JAVA_VERSION}
echo "JAVA_HOME=${JAVA_HOME}" >> /home/vagrant/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

sudo update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 0
sudo update-alternatives --set java ${JAVA_HOME}/bin/java
sudo update-alternatives --set javac ${JAVA_HOME}/bin/javac

update-alternatives --list java
update-alternatives --list javac
java -version
