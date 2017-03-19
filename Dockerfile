FROM elasticsearch:5.2.2

# Head Plugin 설치
RUN \
  cd /usr/share/elasticsearch && \
  bin/plugin -v -i mobz/elasticsearch-head
