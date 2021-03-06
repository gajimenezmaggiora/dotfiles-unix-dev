#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull -u  origin master
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
	source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt

# Process vundels
# if [ ! -d ~/.vim/bundle/vundle ]; then
#   echo "Vim Vundel does not exist."
#   git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# else
#   echo "Vim Vundel does exist."
#   cd ~/.vim/bundle/vundle
#   git pull -u
# fi

vim +BundleInstall +qall

# Get perlbrew
curl -kL http://install.perlbrew.pl | bash
perlbrew init
perlbrew install-patchperl
perlbrew install-cpanm

