.onAttach <- function(libname, pkgname) {
    msg <- c(
        "/-------------------------------------------\\",
        "|         SAMPLE HAPMAP SNP 6.0             |",
        "|-------------------------------------------|",
        "| Data obtained from http://www.hapmap.org  |",
        "| This package is meant to be used only for |",
        "| demonstration of BioConductor packages.   |",
        "| Access http://www.hapmap.org for details. |",
        "|-------------------------------------------|",
        "| The contents of this package are provided |",
        "| in good faith and the maintainer does not |",
        "| warrant their accuracy.                   |",
        "\\-------------------------------------------/"
    )
    packageStartupMessage(paste(msg, collapse = "\n"))
}
