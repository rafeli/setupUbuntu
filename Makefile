
# all targets depend on logFiles only: this allows to create
# one sequence actions, but if one target fails, this creates chaos

all:  log/makeDirs

log/chmod:
	chmod 755 *.sh > log/chmod

log/makeDirs : log/chmod
	./makeDirs.sh > log/makeDirs

log/apt_get : log/chmod
	./apt_get.sh > log/apt_get

log/npmInstall : log/apt_get
	./npmInstall.sh > log/npmInstall

log/non_apt_install : log/apt_get
	./non_apt_install.sh > log/non_apt_install

log/getProjects : log/non_apt_install
	./getProjects.sh > log/getProjects

log/makeProjects : log/getProjects
	./makeProjects.sh > log/makeProjects

apt_purge:
	chmod 755 apt_purge.sh; ./apt_purge.sh



