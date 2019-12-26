#!/bin/bash -e

M2_VERSION=3.6.3

# download and unpack
sudo curl -L "https://www.apache.org/dist/maven/maven-3/${M2_VERSION}/binaries/apache-maven-${M2_VERSION}-bin.tar.gz" > ./apache-maven-${M2_VERSION}-bin.tar.gz
sudo tar -xvzf apache-maven-${M2_VERSION}-bin.tar.gz
# remove existing and move into place
sudo rm -rf /usr/local/bin/apache-maven-${M2_VERSION}/
sudo mv -f apache-maven-${M2_VERSION}/ /usr/local/bin/
# set ENV
echo "M2_HOME=/usr/local/bin/apache-maven-${M2_VERSION}" >> /home/vagrant/.bashrc
sudo update-alternatives --install "/usr/bin/mvn" "mvn" "/usr/local/bin/apache-maven-${M2_VERSION}/bin/mvn" 0
sudo update-alternatives --set mvn /usr/local/bin/apache-maven-${M2_VERSION}/bin/mvn
export PATH=$PATH:/usr/local/bin/apache-maven-${M2_VERSION}/bin
# add auto-completion
sudo wget https://raw.github.com/dimaj/maven-bash-completion/master/bash_completion.bash --output-document /etc/bash_completion.d/mvn
# cleanup
sudo rm -rf apache-maven-${M2_VERSION}-bin.tar.gz
# display info
cat /etc/environment
mvn --version
