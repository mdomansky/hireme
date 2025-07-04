# How to install
* Install Git 
* Go to the project folder, example `/var/www/hireme/`
* `git clone git@github.com:mdomansky/hireme.git`
* Check that `git pull` works correct

# How to cron
* `crontab -e`
* add `0 9 * * * /bin/bash /path/to/your/script.sh` for everyday run
