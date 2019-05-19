#! /bin/bash

checkAccuracy() {
  filename="classifiedMoments"
  url="http://wow-accuracy.herokuapp.com/check_accuracy?result="
  result=`sort -t'|' -k2 $filename | awk -F'|' '{moments=moments$1}END{print moments}'`
  user=$(whoami)
  url_with_params="${url}${result}"
  url_with_params="${url_with_params}&u=${user}"
  curl -X POST ${url_with_params
}

file="classifiedMoments"
while IFS= read -r line
do
  array[i++]="$line"  
done <"$file"

for ((j=0; j<=259; j++)){
  printf "">a
  for ((z=0; z<=259; z++)){
    echo ${array[z]} >> classifiedMoments
  }

  actualAccuracy=$(checkAccuracy)
  printf "" > classifiedMoments
  for ((i=0; i<=259; i++)){
    if [ $i == $j ] 
    then
      k=$(echo ${array[i]} | sed -e "s/O|/W|/")
      echo $k >> classifiedMoments
    else 
      echo ${array[i]} >> classifiedMoments
    fi
  }
  modifiedAccuracy=$(checkAccuracy)

  if (( $(echo "$actualAccuracy>=$modifiedAccuracy" | bc -l) ))
  then
    echo ""
  else
    array[$j]=$k
  fi
}
