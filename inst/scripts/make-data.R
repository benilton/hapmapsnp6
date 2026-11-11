## make-data.R -- provenance of the data served by the hapmapsnp6 package
##
## The data distributed with this package used to live in data/ and
## inst/celFiles/. Both were moved out of the package to meet the
## Bioconductor 100MB per-file limit, and are now served through
## ExperimentHub. See inst/extdata/metadata.csv for the resource records.
##
## Zenodo deposit
##   https://doi.org/10.5281/zenodo.23990454
##   record 23990454, holding all four files:
##     crlmmResult.rda
##     NA06985_GW6_C.CEL
##     NA06991_GW6_C.CEL
##     NA06993_GW6_C.CEL
##

## ------------------------------------------------------------- raw data ---
##
## Three CEL files from the Affymetrix Genome-Wide Human SNP Array 6.0,
## for the HapMap samples NA06985, NA06991 and NA06993. These samples are
## part of the International HapMap Project, and the corresponding cell
## lines are distributed by the Coriell Institute for Medical Research.
##
## The package has always described its source as http://www.hapmap.org,
## both in the DESCRIPTION and in the start-up message in R/zzz.R. That
## site is no longer active; the SourceUrl field in metadata.csv points to
## the Coriell collection that now holds the HapMap material.
##
## The CEL files were downloaded from the HapMap data portal on
## 14 March 2008, from the HapMap Phase 3 release. The SourceVersion
## field in metadata.csv records that release as "hapmap3". Back then
## the files were available through www.hapmap.org

## ----------------------------------------------------------- processing ---
##
## crlmmResult is the genotype calling result obtained by running the crlmm
## algorithm on the 90 initial HapMap samples that were made available in 2008.
## It is stored as a SnpSet, which is the value declared in the RDataClass field of metadata.csv.
##
## library(oligoClasses)
## library(crlmm)
##
## cels <- list.celfiles("inst/celFiles", full.names = TRUE)
## crlmmResult <- crlmm(cels)
## save(crlmmResult, file = "crlmmResult.rda")

## --------------------------------------------------------- final objects ---
##
## Four resources are served, all from the single Zenodo record above.
##
##   crlmmResult      SnpSet,    DispatchClass Rda
##   NA06985_GW6_C    raw file,  DispatchClass FilePath
##   NA06991_GW6_C    raw file,  DispatchClass FilePath
##   NA06993_GW6_C    raw file,  DispatchClass FilePath
##
## The SnpSet is retrieved by crlmmResult(); the three CEL files are
## retrieved together by celFiles(), which returns their paths on disk.
##
## The data are provided for demonstration of Bioconductor tools only, as
## stated in the package start-up message. Please cite the International
## HapMap Project; see inst/CITATION.
