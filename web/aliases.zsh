alias apache-start='sudo systemctl start apache2 && apache-status'
alias apache-stop='sudo systemctl stop apache2 && apache-status'
alias apache-restart='sudo systemctl restart apache2 && apache-status'
alias apache-status='echo "Apache: $(sudo systemctl status apache2 | grep running &>/dev/null && echo "running" || echo "stopped")"'

alias mysql-start='sudo systemctl start mysql && mysql-status'
alias mysql-stop='sudo systemctl stop mysql && mysql-status'
alias mysql-restart='sudo systemctl restart mysql && mysql-status'
alias mysql-status='echo "MySQL: $(sudo systemctl status mysql | grep running &>/dev/null && echo "running" || echo "stopped")"'

alias mongodb-start='sudo systemctl start mongod && mongodb-status'
alias mongodb-stop='sudo systemctl stop mongod && mongodb-status'
alias mongodb-restart='sudo systemctl restart mongod && mongodb-status'
alias mongodb-status='echo "MongoDB: $(sudo systemctl status mongod | grep running &>/dev/null && echo "running" || echo "stopped")"'

alias web-start='apache-start && mysql-start && mongodb-start'
alias web-stop='apache-stop && mysql-stop && mongodb-stop'
alias web-restart='apache-restart && mysql-restart && mongodb-restart'
alias web-status='apache-status && mysql-status && mongodb-status'

alias vhosts='e /etc/apache2/vhosts.conf'
alias hosts='e /etc/hosts'
