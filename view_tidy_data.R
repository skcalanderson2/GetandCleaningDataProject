address <- "https://s3.amazonaws.com/coursera-uploads/user-aacbaa01b1fb14b6aa6dc54f/975114/asst-3/c8c13c002b3b11e5994277104cc2b80f.txt"
address <- sub("^https", "http", address)
al_data <- read.delim(url(address), header = TRUE, sep=" ") #if they used some other way of saving the file than a default write.table, this step will be different
View(al_data)