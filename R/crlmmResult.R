#' Access the crlmmResult resource through ExperimentHub
#'
#' The data is no longer distributed inside the \pkg{hapmapsnp6} package.
#' It is deposited on Zenodo and served through ExperimentHub under the
#' identifier \code{EH10670}. The first call downloads the resource and
#' stores it in the local ExperimentHub cache; later calls read from that
#' cache.
#'
#' @param ... further arguments passed to
#'   \code{\link[ExperimentHub]{ExperimentHub}}, which allows an alternate
#'   hub location to be used.
#' @param metadata logical. With \code{TRUE} only the resource metadata is
#'   returned, without downloading the data. Defaults to \code{FALSE}.
#'
#' @return An object of class \code{SnpSet}, or the resource metadata
#'   when \code{metadata} is \code{TRUE}.
#'
#' @examples
#' args(crlmmResult)
#' \donttest{
#'   meta <- crlmmResult(metadata = TRUE)
#' }
#'
#' @export
crlmmResult <- function(..., metadata = FALSE) {
    eh <- ExperimentHub::ExperimentHub(...)
    id <- "EH10670"
    if (isTRUE(metadata)) eh[id] else eh[[id]]
}
