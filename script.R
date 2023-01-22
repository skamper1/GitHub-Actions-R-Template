source("require_packages.R")
require_packages(c(
  "xml2",
  "httr"
))


# HTTP GET Request
a <- GET("https://github.com/skamper1/GitHub-Actions-R-Template")

html <- read_html(rawToChar(a$content))

forks_counter_element <- xml_find_first(html, ".//span[@id='repo-network-counter']")

forks_counter <- xml_integer(forks_counter_element)

forks_counter |>  as.character() |> paste(Sys.time()) |> writeLines(format(Sys.Date(), "%m-%Y.txt"))
