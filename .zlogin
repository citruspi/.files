if tmux has-session -t "ssh"; then
    tmux attach-session -t "ssh"
else
    tmux new-session -s "ssh"
fi

clear;

echo $fg[green] "\n\n\n\t              _                              _"
echo $fg[green] "\t__      _____| | ___ ___  _ __ ___   ___    | |__   ___  _ __ ___   ___ "
echo $fg[green] "\t\\ \\ /\\ / / _ \\ |/ __/ _ \\| \'_ \` _ \\/ _ \\   | '_ \\ / _ \\| '_ \` _ \\ / _ \\"
echo $fg[green] "\t \ V  V /  __/ | (_| (_) | | | | | |  __/   | | | | (_) | | | | | |  __/"
echo $fg[green] "\t  \\_/\\_/ \\___|_|\\___\\___/|_| |_| |_|\\___|   |_| |_|\\___/|_| |_| |_|\\___|)\n\n\n"

echo $fg[green] "\tHostname    :\t$(echo $HOSTNAME)"
echo $fg[green] "\tCurrent Date:\t$(date "+%y-%m-%d")"
echo $fg[green] "\tCurrent Time:\t$(date "+%H:%M:%S")"
echo $fg[green] "\tCurrent IP  :\t$(/sbin/ifconfig | sed -n '2 p' | awk '{print $2}')"
echo $fg[green] "\tDisk Usage  :\t$(df -Ph $PWD | tail -1 | awk '{ print $4}') / $(df -Ph $PWD | tail -1 | awk '{ print $2}')"
echo $fg[green] "\n\n\t\"$(curl -s http://smacie.com/randomizer/borat.html | sed -nr "s# *<td valign=\"top\"><big><big><big><font face=\"Comic Sans MS\">(.*)</font></big></big></big></td>#\1#p" | sed -e "s/.\{80\}/&\n\t/g")\" - Borat"

#echo $fg[green] "\tBorat Quote :\t$(curl -s http://smacie.com/randomizer/borat.html | sed -nr "s# *<td valign=\"top\"><big><big><big><font face=\"Comic Sans MS\">(.*)</font></big></big></big></td>#\1#p" | sed -e "s/.\{59\}/&\n\t             \t/g")"

echo "\n\n"
