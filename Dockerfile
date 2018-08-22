FROM loraneo/docker-java:10.0.2a

WORKDIR /opt

ENV ZOOKEEPER_HOME /opt/zookeeper

RUN cd /tmp &&\
	wget -L http://mirror.klaus-uwe.me/apache/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz &&\
	tar -xvf zookeeper-3.4.10.tar.gz  &&\
	mv zookeeper-3.4.10 /opt && \
	ln -s /opt/zookeeper-3.4.10 $ZOOKEEPER_HOME

RUN mkdir -p $ZOOKEEPER_HOME/data

COPY config/zoo.cfg $ZOOKEEPER_HOME/conf/zoo.cfg
EXPOSE 2181
CMD echo $MY_ID > /opt/zookeeper/data/myid && \
	$ZOOKEEPER_HOME/bin/zkServer.sh start-foreground


