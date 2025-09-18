#!/bin/sh
MVNW_REPOURL=""
MVNW_USERNAME=""
MVNW_PASSWORD=""
WRAPPER_JAR=".mvn/wrapper/maven-wrapper.jar"
WRAPPER_LAUNCHER="org.apache.maven.wrapper.MavenWrapperMain"

if [ -r "$WRAPPER_JAR" ]; then
  java -cp "$WRAPPER_JAR" $WRAPPER_LAUNCHER "$@"
else
  echo "Downloading Maven Wrapper..."
  mkdir -p .mvn/wrapper
  jarUrl="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar"
  curl -fsSL "$jarUrl" -o "$WRAPPER_JAR"
  java -cp "$WRAPPER_JAR" $WRAPPER_LAUNCHER "$@"
fi
