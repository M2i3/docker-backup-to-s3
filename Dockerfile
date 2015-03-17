FROM ubuntu:14.04
MAINTAINER Ilya Stepanov <dev@ilyastepanov.com>

RUN apt-get update && \
    apt-get install -y s3cmd cron && \
    rm -rf /var/lib/apt/lists/*

ENV ACCESS_KEY="<AWS_KEY&gt;: Your AWS key."
ENV SECRET_KEY="<AWS_SECRET>: Your AWS secret."
ENV S3_PATH="s3://<BUCKET_NAME>/<PATH>/: S3 Bucket name and path. Should end with trailing slash."

ADD s3cfg /root/.s3cfg

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
