# how i backup my home directory
#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'


# OPTIONAL: UPDATE SOME GIT REPOS YOU LIKE
#echo -e "${RED}pulling all git projects ${NC}"
#prefix="/home/changeme/git"
#cd $prefix
#for project in $(ls -1 $prefix --color=never)
#do
#	printf "${GREEN}pulling $project:${NC} "
#	cd $prefix/$project && git pull origin master
#done


# OPTIONAL: GET FILES FROM SOMEWHERE ELSE
#echo -e "${RED}packing webserver root${NC}"
#tar cvvzf ~/Dokumente/varwwwhtml.tgz /var/www/html

# OPTIONAL: PACK YOUR PRECIOUS SCRIPTS
echo -e "${RED}packing scripts${NC}"
tar cvvzf ~/Dokumente/usrlocalbin.tgz /usr/local/bin


# MANDATORY: BACKUP ALL THE THINGS, HOPPING THROUGH A BASTION HOST
# REMOVE THE -e SWITCH IF YOU DON'T NEED THIS AND CAN ACCESS THE
# TARGET HOST DIRECTLY; ALSO REMOVE THE : FROM THE TARGET FOLDER IN THIS CASE
echo -e "${RED}running rsync${NC}"
ionice -c 3 rsync -avPSzx --stats --delete-before --ignore-errors -e "ssh -A -t user@bastionhost ssh -A -t rephlex@privatebackuphost" /home/changeme :/backup/backup-blargh/ --exclude='VirtualBox*'

echo -e "${RED}all done!${NC}"


