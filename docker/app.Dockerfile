FROM tomcat:9.0-jdk8-temurin

ENV CATALINA_OPTS="-Dfile.encoding=UTF-8"

RUN rm -rf /usr/local/tomcat/webapps/*

COPY workdir/timecloud /tmp/timecloud
COPY docker/timecloud-context.xml /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml

RUN set -eux; \
    mkdir -p /usr/local/tomcat/conf/Catalina/localhost; \
    mkdir -p /tmp/timecloud/WEB-INF/classes; \
    rm -f /tmp/timecloud/WEB-INF/lib/lombok.jar; \
    find /tmp/timecloud/WEB-INF/src -name '*.java' | sort > /tmp/timecloud-sources.txt; \
    javac -source 1.8 -target 1.8 -Xlint:-options -encoding UTF-8 \
      -cp '/tmp/timecloud/WEB-INF/lib/*:/tmp/timecloud/WEB-INF/classes' \
      -d /tmp/timecloud/WEB-INF/classes \
      @/tmp/timecloud-sources.txt; \
    cp -R /tmp/timecloud/WEB-INF/src/. /tmp/timecloud/WEB-INF/classes/; \
    find /tmp/timecloud/WEB-INF/classes -name '*.java' -delete; \
    sed -i 's#^FILE_UPLOAD_BASE_REPOSITORY=.*#FILE_UPLOAD_BASE_REPOSITORY=/usr/local/tomcat/webapps/ROOT/repos/#' /tmp/timecloud/WEB-INF/classes/init.properties; \
    sed -i 's#^FILE_DEFAULT_THUMBNAIL_URN=.*#FILE_DEFAULT_THUMBNAIL_URN=/repos/%s/thumbnail/%s#' /tmp/timecloud/WEB-INF/classes/init.properties; \
    rm -f /tmp/timecloud/WEB-INF/lib/servlet-api.jar; \
    cp /tmp/timecloud/WEB-INF/lib/ojdbc14.jar /usr/local/tomcat/lib/ojdbc14.jar; \
    mkdir -p /usr/local/tomcat/webapps/ROOT/repos; \
    cp -R /tmp/timecloud/. /usr/local/tomcat/webapps/ROOT/; \
    rm -rf /tmp/timecloud /tmp/timecloud-sources.txt
