apt-get -y update &> /dev/null
apt-get -y install pure-ftpd &> /dev/null
echo "Setting MinUID to 0 to enable root ftp login (NOT RECOMMENDED!) "
echo "0" > /etc/pure-ftpd/conf/MinUID
echo "# /etc/ftpusers: list of users disallowed FTP access." > /etc/ftpusers
echo "Adding account 'daemon' to /etc/ftpusers."
echo "daemon" >> /etc/ftpusers
echo "Adding account 'bin' to /etc/ftpusers."
echo "bin" >> /etc/ftpusers
echo "Adding account 'sys' to /etc/ftpusers."
echo "sys"  >> /etc/ftpusers
echo "Adding account 'sync' to /etc/ftpusers."
echo "sync" >> /etc/ftpusers
echo "Adding account 'games' to /etc/ftpusers."
echo "games" >> /etc/ftpusers
echo "Adding account 'man' to /etc/ftpusers."
echo "man" >> /etc/ftpusers
echo "Adding account 'lp' to /etc/ftpusers."
echo "lp" >> /etc/ftpusers
echo "Adding account 'mail' to /etc/ftpusers."
echo "mail" >> /etc/ftpusers
echo "Adding account 'news' to /etc/ftpusers."
echo "news" >> /etc/ftpusers
echo "Adding account 'uucp' to /etc/ftpusers."
echo "uucp" >> /etc/ftpusers
echo "Adding account 'proxy' to /etc/ftpusers."
echo "proxy" >> /etc/ftpusers
echo "Adding account 'majordom' to /etc/ftpusers."
echo "majordom" >> /etc/ftpusers
echo "Adding account 'postgres' to /etc/ftpusers."
echo "postgres" >> /etc/ftpusers
echo "Adding account 'www-data' to /etc/ftpusers."
echo "www-data" >> /etc/ftpusers
echo "Adding account 'backup' to /etc/ftpusers."
echo "backup" >> /etc/ftpusers
echo "Adding account 'msql' to /etc/ftpusers."
echo "msql" >> /etc/ftpusers
echo "Adding account 'operator' to /etc/ftpusers."
echo "operator" >> /etc/ftpusers
echo "Adding account 'list' to /etc/ftpusers."
echo "list" >> /etc/ftpusers
echo "Adding account 'irc' to /etc/ftpusers."
echo "irc" >> /etc/ftpusers
echo "Adding account 'nobody' to /etc/ftpusers."
echo "nobody" >> /etc/ftpusers
echo "Restarting FTP Server..."
service pure-ftpd restart
echo "done."
