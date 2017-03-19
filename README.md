# elasticsearch
Korean analyzer test in Elasticsearch(5.2.2)

### Prerequisites
You need install Docker service and define $ES_HOME.

### Directories
Create $ES_HOME/log, $ES_HOME/data before you start elasticsearch.
```
$ES_HOME/config/elasticsearch.yml : basic elasticsearch configuration
$ES_HOME/config/log4j2.properties : logging configuration
$ES_HOME/log : output log file of elasticsearch
$ES_HOEM/data : data directories
```

### Usages
Start elasticsearch.
```
. ./servicectl.sh start
```
Stop elasticsearch.
```
. ./servicectl.sh stop
```

Http port : 9222
Tcp port : 9333

