FROM nginx:latest
MAINTAINER ifeng ygkkk
EXPOSE 80
USER root
RUN apt-get update && apt-get install -y supervisor wget unzip
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/xray /usr/local/xray
COPY config.json /etc/xray/
COPY entrypoint.sh /usr/local/xray/
RUN wget -qO- https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep -o '"https://github.com/XTLS/Xray-core/releases/download/.*/Xray-linux-64.zip"' | xargs wget -qO /tmp/Xray-linux-64.zip \
&& unzip -d /usr/local/xray /tmp/Xray-linux-64.zip \
&& chmod a+x /usr/local/xray/entrypoint.sh
ENTRYPOINT [ "/usr/local/xray/entrypoint.sh" ]
CMD ["/usr/bin/supervisord"]
