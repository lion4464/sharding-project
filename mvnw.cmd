@ECHO OFF
SET WRAPPER_JAR=.mvn/wrapper/maven-wrapper.jar
SET WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

IF EXIST "%WRAPPER_JAR%" (
  java -cp "%WRAPPER_JAR%" %WRAPPER_LAUNCHER% %*
) ELSE (
  ECHO Downloading Maven Wrapper...
  mkdir .mvn\wrapper 2>NUL
  powershell -Command "Invoke-WebRequest -Uri https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar -OutFile %WRAPPER_JAR%"
  java -cp "%WRAPPER_JAR%" %WRAPPER_LAUNCHER% %*
)
