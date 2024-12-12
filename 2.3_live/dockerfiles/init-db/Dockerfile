FROM mariadb:10.9

ENV DB=dockerfiles/init-db/init-db.sh
CMD ["sh", "-c", "cd /app && $DB && echo 'Operation successful!'"]