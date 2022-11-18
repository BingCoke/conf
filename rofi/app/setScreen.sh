#! sh
xout=$(xrandr | awk  '{print $1,","}')
OLD_IFS="$IFS" 
IFS="," 
arr=($xout) 
IFS="$OLD_IFS" 
start=false
for s in ${arr[@]} 
do
  if [[ $start=="false" ]]; then
   echo "$s" 
  fi
  if [[ "$s"=="eDP-1" ]]; then
   start=true 
  fi
  if [[ "$S"=="HDMI-1" ]]; then
   start=false 
  fi
  echo $start
done


#echo ${xout[0]}

