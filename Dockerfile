FROM alexberkovich/alpine-oralce-jdk8:0.0.1


ENV JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    MAVEN_VERSION=3.3.9

ENV M2_HOME=/usr/lib/apache-maven-$MAVEN_VERSION
ENV PATH=${PATH}:${M2_HOME}/bin

RUN set -ex && \
    apk add --no-cache dos2unix=7.4.0-r0 && \
    cd /tmp && \
    wget -q "http://apache.ip-connect.vn.ua/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
    tar -xzf "apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
    mv "/tmp/apache-maven-$MAVEN_VERSION" "/usr/lib" && \
    rm -fr  /tmp/* /var/cache/apk/*


COPY ./run.sh /etc/run.sh

CMD ["/etc/run.sh"]

#CMD tail -f /dev/null

#EXPOSE 22 8000 8080

#docker rmi -f alpine_jdk8_mvn3
#docker build --squash . -t alpine_jdk8_mvn3
#smoke test
#docker run -it alpine_jdk8_mvn3 mvn -version
##manual intervention
##docker run -v C:/dev/work:/work -it --entrypoint="bash" alpine_jdk8_mvn3
##cd /work
##Run mvn clean install
#docker run -v C:/dev/work:/work -it alpine_jdk8_mvn3
#docker commit $(docker ps -q -n=1) alpine_jdk8_mvn3_full
#docker tag alpine_jdk8_mvn3_full alexberkovich/alpine-mvn:0.0.1
#docker push alexberkovich/alpine-mvn
# EOF