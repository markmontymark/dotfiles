bash_profile_d=$HOME/.bash_profile.d
for i in `ls $bash_profile_d`; do
	. $bash_profile_d/$i
done

# MacPorts Installer addition
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished MacPorts changes
