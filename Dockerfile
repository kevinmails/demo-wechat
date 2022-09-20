FROM ubuntu:latest

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \ 
    && apt-get update \
    && apt-get  install  fontconfig -y
RUN  apt-get  clean

ENV  LANG C.UTF-8
#设置时区
ENV TIME_ZONE Asia/Shanghai

RUN apt-get install -y tzdata \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

COPY ./jdk-17.0.4.1 /opt/jdk-17.0.4.1
#RUN chmod -R 750 /opt/jdk-17.0.4.1

ENV JAVA_HOME=/opt/jdk-17.0.4.1
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CALSSPATH=$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

COPY target/demo-wechat-0.0.1-SNAPSHOT.jar /demo-wechat-0.0.1-SNAPSHOT.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "./demo-wechat-0.0.1-SNAPSHOT.jar"]









