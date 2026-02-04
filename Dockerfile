FROM debian:latest
#MAINTAINER info@niclas-sieveneck.de

RUN apt-get update && apt-get -y install cron curl

# Copy ip-log-cron and iplog.sh file to the cron.d directory
COPY ip-log-cron /etc/cron.d/ip-log-cron
COPY iplog.sh /var/iplog.sh

# Give execution rights on the cron job and iplog.sh
RUN chmod 0744 /etc/cron.d/ip-log-cron
RUN chmod 0755 /var/iplog.sh

# Apply cron job
RUN crontab /etc/cron.d/ip-log-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log