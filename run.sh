database="mode"
user_name="test"
user_host="localhost"
user_password="password"

service mysql restart

mysql -e "CREATE DATABASE IF NOT EXISTS ${database};"
mysql -e "USE ${database};"
mysql -e "CREATE USER IF NOT EXISTS '${user_name}'@'${user_host}' IDENTIFIED BY '${user_password}';"
mysql -e "GRANT ALL PRIVILEGES ON ${database}.* TO '${user_name}'@'${user_host}';"