## These tests never touch the network. They check the interface of the
## package and the resource metadata shipped with it, not the data itself,
## which lives on Zenodo and is served through ExperimentHub.

test_that("the accessors are exported functions", {
    expect_true(is.function(crlmmResult))
    expect_true(is.function(celFiles))
})

test_that("the accessors take the documented arguments", {
    expect_identical(names(formals(crlmmResult)), c("...", "metadata"))
    expect_identical(names(formals(celFiles)), c("...", "metadata", "asDir"))
    expect_false(formals(crlmmResult)$metadata)
    expect_false(formals(celFiles)$metadata)
    expect_false(formals(celFiles)$asDir)
})

test_that("the resource metadata is shipped and complete", {
    path <- system.file("extdata", "metadata.csv", package = "hapmapsnp6")
    expect_true(file.exists(path))

    md <- read.csv(path, stringsAsFactors = FALSE)
    expect_identical(nrow(md), 4L)

    required <- c("Title", "Description", "BiocVersion", "Genome",
                  "SourceType", "SourceUrl", "SourceVersion", "Species",
                  "TaxonomyId", "Coordinate_1_based", "DataProvider",
                  "Maintainer", "RDataClass", "DispatchClass",
                  "Location_Prefix", "RDataPath", "Tags")
    expect_true(all(required %in% names(md)))
})

test_that("the four resources are the expected ones", {
    path <- system.file("extdata", "metadata.csv", package = "hapmapsnp6")
    md <- read.csv(path, stringsAsFactors = FALSE)

    expect_setequal(md$Title, c("crlmmResult", "NA06985_GW6_C",
                                "NA06991_GW6_C", "NA06993_GW6_C"))
    expect_identical(md$DispatchClass[md$Title == "crlmmResult"], "Rda")
    expect_identical(md$RDataClass[md$Title == "crlmmResult"], "SnpSet")
    expect_true(all(md$DispatchClass[md$Title != "crlmmResult"] == "FilePath"))
})

test_that("every resource resolves to the Zenodo record", {
    path <- system.file("extdata", "metadata.csv", package = "hapmapsnp6")
    md <- read.csv(path, stringsAsFactors = FALSE)

    urls <- paste0(md$Location_Prefix, md$RDataPath)
    expect_true(all(startsWith(urls,
                               "https://zenodo.org/records/23990454/files/")))
})
