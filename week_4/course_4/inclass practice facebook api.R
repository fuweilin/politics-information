library(httr)
name = "sujiachyuan"
token = "EAACEdEose0cBAEg6QQX34FtPQZCd26Lo69mNNoKLYw2U0LUCVgwCsUEPuulet8jrgnL4evi5eTp83xqfF8MycmmuCxMLZBzfj8tZAsOPcbwSiYgZCNsEfjHSVKipq5JrgHqSZB9ZAednDtvYPhtZCYqDfHiQueEByZAVZCcHzMLJtDLNAijSeCJIMy8ufV8Ljp6YZD"
# token每兩個小時會不同

url =paste0("https://graph.facebook.com/v2.12/", sujiachyuan, "?fields=posts&access_token=", token)

res = httr::GET(url)
post = content(res)

data = post$posts$data

while( !is.null(url)) #url 不為空的話，也就是url有東西，while就會啟動
{
  if( is.null(post$posts$data)) #FB第二頁沒有包最外曾的post，而是直接從posts開始，因此若第二頁原先的data為空，則令data為posts$data
  {
    data = post$data  
  }
  else
  {
    data = post$posts$data
  }
  pageNo = length(data)
  from = 1 # 盡量不要用數字避免太多數字搞混
  date = data[[from]]$created_time
  currentY = strsplit(date, '-')[[1]][1]
  currentM = strsplit(date, '-')[[1]][2]
  currentM = paste0(currentY,'_',currentM) #重新命名
  from = 1
  saveData = list(data[[from]])
  for( id in c(2:pageNo) ) #第二筆資料開始到最後一筆
  {
    date = data[[id]]$created_time
    year = strsplit(date, '-')[[1]][1]
    month = strsplit(date, '-')[[1]][2]
    month = paste0(year,'_',month)    
    if( currentM == month )
    {
      to = id
      saveData = append(saveData, data[[to]]) #append第一筆抓到的資料進去
    }
    else
    {
      filename = paste0("./",name,"/",currentM,".txt")
      currentM = month
      write(unlist(saveData), filename, append = TRUE)
      saveData = list()
      from = to-1
    }
  }
  
  url = paste0(post$paging$`next`,
               post$posts$paging$`next`) #繼續下一頁
  res = httr::GET(url)
  post = content(res)
}