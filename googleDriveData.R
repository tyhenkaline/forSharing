# Here's how you can access data in google drive spreadsheets with R.

# You'll need these.

install.packages("RCurl")
library("RCurl")

install.packages("XML")
library("XML")

install.packages("RGoogleDocs", repos = "http://www.omegahat.org/R", type="source")
library("RGoogleDocs")

# You've gotta login to the google account you want to pull the data from.

auth = getGoogleAuth("put.your.gmail.username.here@gmail.com", "put.your.password.here",service="wise")
con = getGoogleDocsConnection(auth)

# Here's a list of the docs you have in that account.

docs <- getDocs(con)
docs <- as(docs,"data.frame")
View(docs)

# Here's a closer look at our test data sheet.

ts = getWorksheets("Test RGoogleData", con)
names(ts)

# And here we print our test data.

sheetAsMatrix(ts$Sheet1, header = TRUE, as.data.frame = TRUE, trim = TRUE)
