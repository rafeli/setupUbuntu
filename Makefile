
# all targets depend on logFiles only: this allows to create
# one sequence actions, but if one target fails, this creates chaos

all:  log/makeProjects log/non_apt_install log/apt_get log/npmInstall log/getProjects

log/chmod:
	mkdir log
	chmod 755 *.sh > log/chmod

log/makeDirs : log/chmod
	./makeDirs.sh > log/makeDirs

log/apt_get : log/chmod log/makeDirs
	./apt_get.sh > log/apt_get

log/npmInstall : log/non_apt_install
	./npmInstall.sh > log/npmInstall

log/non_apt_install : log/apt_get
	./non_apt_install.sh > log/non_apt_install

# 2016-09 also in above all:target moved getProjects at the end (i.e. tobe exec 1st). Was after apt-get
log/getProjects : log/makeDirs #2016-09 log/non_apt_install log/makeDirs
	./getProjects.sh > log/getProjects

log/makeProjects : log/getProjects log/npmInstall log/non_apt_install
	./makeProjects.sh > log/makeProjects

server : 
	./installServer.sh > log/installServer

purge:
	chmod 755 npm_purge.sh; ./npm_purge.sh
	chmod 755 apt_purge.sh; ./apt_purge.sh



