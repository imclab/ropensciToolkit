\name{as_ropensci}
\alias{as_ropensci}
\title{Handler for rOpenSci API calls}
\usage{
  as_ropensci(httr_res, data = NULL)
}
\arguments{
  \item{httr_res}{httr response object}

  \item{data}{Data object from parsing, if any, defaults to
  NULL if none passed.}
}
\description{
  Handler for rOpenSci API calls
}
\examples{
\dontrun{
library(httr)
url <- "http://api.plos.org/search?q=author:Ethan White&rows=1&wt=json"
out <- GET(url)
data <- content(out)
somedata <- data$response$docs[[1]]
as_ropensci(out, somedata)

# or assign output object to some class
class(somedata) <- "newobj"
as_ropensci(out, somedata)

# get information on a call
dat <- as_ropensci(out, somedata)
dat$data # the data ouput
dat$status_code # the HTTP status
dat$status_message # a more meaningful HTTP status message
dat$call # the url that was called
dat$meta$handle # the url handle
dat$meta$headers # headers
dat$meta$cookies # cookies
dat$meta$config # any configuration settings passed

# Pass output to print command, same as not using print
pint(dat)
dat
}
}

