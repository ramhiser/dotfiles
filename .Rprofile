.First <- function() {
  Sys.setenv(
    PATH =
    "/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/texbin:/usr/X11/bin"
  )
  options(
    repos = c(CRAN="https://cran.rstudio.com/"),
    browserNLdisabled = TRUE,
    deparse.max.lines = 2)
}
# This code is copied directly from ?savehistory
# It saves the history of commands from interactive sessions to my home path
# when R is closed.
.Last <- function() {
    if(interactive()) try(savehistory("~/.Rhistory"))
}
if (interactive()) {
  suppressMessages(require(devtools))
}
