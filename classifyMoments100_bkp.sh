#! /bin/bash

checkAccuracy() {
  filename="a"
  url="http://wow-accuracy.herokuapp.com/check_accuracy?result="
  result=`sort -t'|' -k2 $filename | awk -F'|' '{moments=moments$1}END{print moments}'`
  user=$(whoami)
  url_with_params="${url}${result}"
  url_with_params="${url_with_params}&u=${user}"
  curl -X POST ${url_with_params}
}


result=$(checkAccuracy)
i=0
b=$result
printf "$result hiii"
file="a"
while IFS= read -r line
do
  # display $line or do somthing with $line
  array[i++]="$line"  
done <"$file"



for ((j=0; j<=259; j++)){

  printf "">a
  #result=$(echo $result | sed -e "s/%//")
for ((z=0; z<=259; z++)){
echo ${array[z]} >> a
}

result=$(checkAccuracy)
printf "" >a
for ((i=0; i<=259; i++)){
  if [ $i == $j ] 
  then
    k=$(echo ${array[i]} | sed -e "s/O|/W|/")
    echo $k >> a
  else 
    echo ${array[i]} >> a
  fi
}
b=$(checkAccuracy)

if (( $(echo "$result>=$b" | bc -l) ))
then
  echo "hii$result && $b" 
else
  echo "hello$result && $b"
  array[$j]=$k
fi
}












