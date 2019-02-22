#From centos:centos7
#RUN yum install -y wget java mysql
FROM java:8


# RUN version=$(curl "https://github.com/actiontech/dble/releases/latest"|awk -F "/" '{print $8}') && \
#     wget -P /opt https://github.com/actiontech/dble/releases/download/$version%2Ftag/actiontech-dble-$version.tar.gz && \
#     tar zxvf /opt/actiontech-dble-$version.tar.gz -C /opt

RUN wget -P /opt http://119.29.169.221:10001/download/actiontech-dble-2.18.12.0.tar.gz && tar zxvf /opt/actiontech-dble-2.18.12.0.tar.gz -C /opt

# RUN wget https://raw.githubusercontent.com/actiontech/dble/master/docker-images/quick-start/schema.xml -P /opt/dble/conf/ && \
#     wget https://raw.githubusercontent.com/actiontech/dble/master/docker-images/quick-start/server.xml -P /opt/dble/conf/ && \
#     wget https://raw.githubusercontent.com/actiontech/dble/master/docker-images/quick-start/rule.xml -P /opt/dble/conf/ && \
#     wget https://raw.githubusercontent.com/actiontech/dble/master/docker-images/quick-start/wrapper.conf -P /opt/dble/conf/ && \
#     wget https://raw.githubusercontent.com/actiontech/dble/master/docker-images/quick-start/docker_init_start.sh -P /opt/dble/bin/ && \
#     wget https://raw.githubusercontent.com/actiontech/dble/master/docker-images/wait-for-it.sh -P /opt/dble/bin/ && \
#     chmod 777 /opt/dble/bin/* && \
#     rm -f /opt/actiontech-dble-$version.tar.gz

ADD ./quick-start/schema.xml  /opt/dble/conf/
ADD ./quick-start/server.xml  /opt/dble/conf/
ADD ./quick-start/rule.xml  /opt/dble/conf/
ADD ./dble_start.sh   /opt/dble/bin
ADD ./wait-for-it.sh  /opt/dble/bin

RUN chmod 777 /opt/dble/bin/* && \
    rm -f /opt/actiontech-dble-$version.tar.gz

EXPOSE 8066 9066    

VOLUME /opt/dble

# CMD ["/opt/dble/bin/docker_init_start.sh"]


CMD ["/opt/dble/bin/dble_start.sh"]
