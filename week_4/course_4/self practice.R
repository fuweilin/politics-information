library(httr)
url = "https://graph.facebook.com/v2.12/sujiachyuan?fields=posts&access_token=EAACEdEose0cBAEg6QQX34FtPQZCd26Lo69mNNoKLYw2U0LUCVgwCsUEPuulet8jrgnL4evi5eTp83xqfF8MycmmuCxMLZBzfj8tZAsOPcbwSiYgZCNsEfjHSVKipq5JrgHqSZB9ZAednDtvYPhtZCYqDfHiQueEByZAVZCcHzMLJtDLNAijSeCJIMy8ufV8Ljp6YZD"
res = httr::GET(url)
post = content(res)


data = post$posts$data
date = data[[1]]$created_time
date
month = strsplit(date, "-")[[1]][2]
month

for(i in c(1:25))
{
  date = data[[i]]$created_time
  month = strsplit(date, "-")[[1]][2]

}
 
  




?strsplit
