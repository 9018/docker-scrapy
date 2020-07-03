FROM alpine:latest

#RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main/" > /etc/apk/repositories

RUN apk update && apk upgrade 
RUN apk add python3
RUN apk add --update py3-setuptools
RUN apk add python3-dev
RUN apk -U add \
gcc \
bash \
bash-doc \
bash-completion \
libffi-dev \
libxml2-dev \
libxslt-dev \
libevent-dev \
musl-dev \
openssl-dev \
python3-dev \

py-pip \
redis \
curl ca-certificates \
&& update-ca-certificates \
&& rm -rf /var/cache/apk/*
RUN pip install --upgrade pip \
&& pip install Scrapy

RUN pip install scrapyd \
&& pip install scrapyd-client \
&& pip install scrapydweb

RUN pip install fake_useragent \
&& pip install scrapy_proxies \
&& pip install sqlalchemy \
&& pip install mongoengine \
&& pip install redis

WORKDIR /runtime/app

EXPOSE 5000 

COPY launch.sh /runtime/launch.sh
RUN chmod +x /runtime/launch.sh

# 测试正常后可以打开下面的注释
 ENTRYPOINT ["/runtime/launch.sh"]
