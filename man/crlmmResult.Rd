\name{crlmmResult}
\alias{crlmmResult}
\docType{data}
\title{Access the crlmmResult resource through ExperimentHub}
\description{
  The data is no longer distributed inside the \pkg{hapmapsnp6} package.
  It is deposited on Zenodo and served through ExperimentHub under the
  identifier \code{EH10670}. The first call downloads the resource and
  stores it in the local ExperimentHub cache; later calls read from that
  cache.
}
\usage{
crlmmResult(..., metadata = FALSE)
}
\arguments{
  \item{...}{further arguments passed to
    \code{\link[ExperimentHub]{ExperimentHub}}, which allows an alternate
    hub location to be used.}
  \item{metadata}{logical. With \code{TRUE} only the resource metadata is
    returned, without downloading the data.}
}
\format{
  An object of class \code{SnpSet}. With \code{metadata = TRUE}, an
  \code{ExperimentHub} object describing the resource instead.
}
\value{
  An object of class \code{SnpSet}, or the resource metadata when
  \code{metadata} is \code{TRUE}.
}
\source{
  Zenodo, record \code{23990454}, file \code{crlmmResult.rda}.
}
\seealso{
  \code{\link[ExperimentHub]{ExperimentHub}}
}
\examples{
## The accessor and its arguments. This needs no network access.
args(crlmmResult)

## Resource metadata. This queries the hub but downloads no data.
crlmmResult(metadata = TRUE)

## The data itself, downloaded on first use and cached afterwards.
\donttest{
obj <- crlmmResult()
class(obj)
}
}
\keyword{datasets}
