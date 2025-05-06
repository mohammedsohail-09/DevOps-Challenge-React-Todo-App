#!/bin/bash
LOG_FILE="/opt/logs/script_logs.log"
mkdir -p /opt/logs

{
    echo "$(date) - Downloading OpenJDK 1.8"
    sudo apt update
    sudo apt install -y openjdk-8-jdk

    echo "$(date) - Setting JAVA_HOME and PATH"
    echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" >> ~/.bashrc
    echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
    source ~/.bashrc

    echo "$(date) - Java version:"
    java -version
} >> $LOG_FILE 2>&1
