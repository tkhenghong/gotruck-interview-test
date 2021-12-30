hist(qunif(10, min = 0, max=9, log.p = FALSE))

library(httr)
library(jsonlite)
library(ggplot2)

getRandomNumbers = function (num = 100) {
  count = 1
  numbers = c();
  while (count <= num) {
    res = GET("http://localhost:8080/question1")
    numbers = c(numbers, as.character((fromJSON(rawToChar(res$content)))[[1]]))
    count = count + 1
  }
  
  return (numbers)
}

x = 0:9

showRandomNumberHistogram = function(num) {
  list = getRandomNumbers(num)
  print(paste(list))
  mean(list)
  str(list)
  listFactor = factor(list)
  df = data.frame(number=x, frequency=list)
  ggplot(df, aes(y=frequency), color = "black", fill = "grey") + geom_bar(show.legend = FALSE) + coord_flip()
}

showRandomNumberHistogram(100)



