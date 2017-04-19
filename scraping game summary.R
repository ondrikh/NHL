#table 10 je goal summary
#6 je game summary - místo èas atp
#4 je visitor
#7 je home
#12 penalty summary - visitor
#13 penalty summary - home
#možna i 15 a 22  je penalty summary a asi to bude lepší
#33 je shooting summary - visitor
#34 je shooting summary - home
#37 je powerplay summary - visitor
#38 je powerplay summary - home
#41 je even strength summary - visitor
#42 je even strength summary - visitor
#43 je goaltender summary
#45 jsou rozhodci
#50 jsou hvezdy
#
#
#

library(XML)
library(dplyr)

data = data.frame(matrix(nrow=0, ncol=11))

column_names = c("GameID","G","Per","Time","Str","Team","GoalScorer","Assist1","Assist2","AwayOnIce","HomeOnIce")
colnames(data)=column_names

basic_url = "http://www.nhl.com/scores/htmlreports/20162017/GS02"

for (i in 1:1230) {
    i2 = sprintf("%04d",i)
    url = paste(basic_url, i2, ".HTM", sep = "")
    tables = readHTMLTable(url)
    goal_sum = tables[10]
    
    goal_sum=as.data.frame(goal_sum[1])
    goal_sum$matchid = i
    goal_sum = select(goal_sum, matchid, 1:10)
    
    colnames(goal_sum)=column_names
    
    
    data = rbind(data, goal_sum)

    
}







