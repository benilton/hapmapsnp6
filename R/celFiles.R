#' Access the celFiles files through ExperimentHub
#'
#' These files are no longer distributed inside the \pkg{hapmapsnp6}
#' package. They are deposited on Zenodo and served through ExperimentHub.
#' The first call downloads each file and stores it in the local
#' ExperimentHub cache; later calls read from that cache.
#'
#' @param ... further arguments passed to
#'   \code{\link[ExperimentHub]{ExperimentHub}}, which allows an alternate
#'   hub location to be used.
#' @param metadata logical. With \code{TRUE} only the resource metadata is
#'   returned, without downloading the files. Defaults to \code{FALSE}.
#' @param asDir logical. With \code{TRUE} the files are gathered into a
#'   single directory and its path is returned. This replaces
#'   \code{system.file("celFiles", package = "hapmapsnp6")}, which cannot
#'   work for files that are no longer installed with the package.
#'   Defaults to \code{FALSE}.
#'
#' @return A character vector of paths on disk, named after the original
#'   files; a single directory path when \code{asDir} is \code{TRUE}; or
#'   the resource metadata when \code{metadata} is \code{TRUE}.
#'
#' @examples
#' args(celFiles)
#' \donttest{
#'   meta <- celFiles(metadata = TRUE)
#' }
#'
#' @export
celFiles <- function(..., metadata = FALSE, asDir = FALSE) {
    eh <- ExperimentHub::ExperimentHub(...)
    ids <- c(
        "NA06985_GW6_C.CEL" = "EH10671",
        "NA06991_GW6_C.CEL" = "EH10672",
        "NA06993_GW6_C.CEL" = "EH10673"
    )
    if (isTRUE(metadata)) return(eh[unname(ids)])

    paths <- vapply(ids, function(id) eh[[id]], character(1))
    if (!isTRUE(asDir)) return(paths)

    ## Reproduce what system.file() used to return: one directory holding
    ## the files under their original names. Symbolic links keep this free
    ## in disk terms, with a copy as the fallback where they are not
    ## supported.
    target <- file.path(tempdir(), "hapmapsnp6-celFiles")
    dir.create(target, showWarnings = FALSE, recursive = TRUE)
    for (nm in names(paths)) {
        dest <- file.path(target, nm)
        if (file.exists(dest)) next
        ligou <- tryCatch(file.symlink(paths[[nm]], dest),
                          warning = function(w) FALSE,
                          error = function(e) FALSE)
        if (!isTRUE(ligou)) file.copy(paths[[nm]], dest)
    }
    target
}
