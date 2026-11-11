\name{celFiles}
\alias{celFiles}
\docType{data}
\title{Access the celFiles files through ExperimentHub}
\description{
  These files are no longer distributed inside the \pkg{hapmapsnp6}
  package. They are deposited on Zenodo and served through ExperimentHub.
  The first call downloads each file and stores it in the local
  ExperimentHub cache; later calls read from that cache.
}
\usage{
celFiles(..., metadata = FALSE, asDir = FALSE)
}
\arguments{
  \item{...}{further arguments passed to
    \code{\link[ExperimentHub]{ExperimentHub}}, which allows an alternate
    hub location to be used.}
  \item{metadata}{logical. With \code{TRUE} only the resource metadata is
    returned, without downloading the files.}
  \item{asDir}{logical. With \code{TRUE} the files are gathered into a
    single directory and its path is returned. This replaces
    \code{system.file("celFiles", package = "hapmapsnp6")}, which cannot
    work for files that are no longer installed with the package.}
}
\format{
  A named character vector of paths on disk, one per file. With
  \code{asDir = TRUE}, a single directory path. With
  \code{metadata = TRUE}, an \code{ExperimentHub} object describing the
  resources instead.
}
\value{
  A character vector of paths on disk, named after the original files; a
  single directory path when \code{asDir} is \code{TRUE}; or the resource
  metadata when \code{metadata} is \code{TRUE}.
}
\source{
  Zenodo, record \code{23990454}.
}
\seealso{
  \code{\link[ExperimentHub]{ExperimentHub}}
}
\examples{
## The accessor and its arguments. This needs no network access.
args(celFiles)

## Resource metadata. This queries the hub but downloads no files.
celFiles(metadata = TRUE)

## The files themselves, downloaded on first use and cached afterwards.
\donttest{
paths <- celFiles()
basename(paths)
}
}
\keyword{datasets}
