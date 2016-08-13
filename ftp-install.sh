apt-get -y update
apt-get -y install pure-ftpd
echo "0" > /etc/pure-ftpd/conf/MinUID
echo "# /etc/ftpusers: list of users disallowed FTP access." > /etc/ftpusers
echo "daemon" >> /etc/ftpusers
echo "bin" >> /etc/ftpusers
echo "sys"  >> /etc/ftpusers
echo "sync" >> /etc/ftpusers
echo "games" >> /etc/ftpusers
echo "man" >> /etc/ftpusers
echo "lp" >> /etc/ftpusers
echo "mail" >> /etc/ftpusers
echo "news" >> /etc/ftpusers
echo "uucp" >> /etc/ftpusers
echo "proxy" >> /etc/ftpusers
echo "majordom" >> /etc/ftpusers
echo "postgres" >> /etc/ftpusers
echo "www-data" >> /etc/ftpusers
echo "backup" >> /etc/ftpusers
echo "msql" >> /etc/ftpusers
echo "operator" >> /etc/ftpusers
echo "list" >> /etc/ftpusers
echo "irc" >> /etc/ftpusers
echo "nobody" >> /etc/ftpusers
service pure-ftpd restart
echo "done."
