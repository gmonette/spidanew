# spidanew
Changed and new functions for the spida package

Version 0.1.0

## Installation

To install this package, use the following commands in R:

    if (!require(devtools)) install.packages("devtools")
    library(devtools)
    install_github("gmonette/spida2")
    install_github("gmonette/spidanew")

This installs the package from the source, so you will need to have 
R Tools installed on your system.  [R Tools for Windows](https://cran.r-project.org/bin/windows/Rtools/)
takes you to the download page for Windows.  [R Tools for Mac OS X](https://cran.r-project.org/bin/macosx/tools/)
has the required programs for Mac OS X.

To use the package, load it after having loaded 'spida2' so the functions in 'spidanew' will have precedence the
functions in 'spida'.

    library(spida2)
    library(spidanew)

