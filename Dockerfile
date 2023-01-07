FROM nginx:latest
MAINTAINER ifeng ygkkk
EXPOSE 80
USER root
RUN apt-get update && apt-get install -y supervisor wget unzip
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/xray /usr/local/xray
COPY config.yaml /etc/xray/
COPY entrypoint.sh /usr/local/xray/
ENTRYPOINT [ "/usr/local/xray/entrypoint.sh" ]
CMD ["/usr/bin/supervisord"]
