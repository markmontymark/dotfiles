bash_profile_d=$HOME/.bash_profile.d
for i in `ls $bash_profile_d`; do
	. $bash_profile_d/$i
done

