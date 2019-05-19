#! /usr/bin/awk -f
function checkWowOuchMoment(currentLine){
  result=1
  for(i=1;i<=ouchWordsLength;i++){
    if(tolower(currentLine) ~ ouchWords[i]){
      result=0
      break
    }
  }
  return result
}

BEGIN{
  ouchKeywords="can't|boring|tired|hurt|bye|small|slow|congested|fear|sleepy|difficult|lack|missing|leave|left|worst|low|heavy|far|next| rent|lift|pay |long distance| wala|practice|change|unable|not|:p|too far|bore|no |day in pg|bad|hard|tough|injur|leaving|paying|hard"

  split(ouchKeywords,ouchWords,"|")
  ouchWordsLength=length(ouchWords)
}

{
  if(checkWowOuchMoment($0))
    print "W|"$0
  else
    print "O|"$0
}
