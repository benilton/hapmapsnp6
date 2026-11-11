## Gera inst/extdata/metadata.csv deste pacote.
## Validar com ExperimentHubData::makeExperimentHubMetadata(".").

metadata <- data.frame(
    Title = c("crlmmResult", "NA06985_GW6_C", "NA06991_GW6_C", "NA06993_GW6_C"
),
    Description = c("Recurso crlmmResult do pacote hapmapsnp6, hospedado no Zenodo e servido pelo ExperimentHub.", 
"Recurso NA06985_GW6_C do pacote hapmapsnp6, hospedado no Zenodo e servido pelo ExperimentHub.", 
"Recurso NA06991_GW6_C do pacote hapmapsnp6, hospedado no Zenodo e servido pelo ExperimentHub.", 
"Recurso NA06993_GW6_C do pacote hapmapsnp6, hospedado no Zenodo e servido pelo ExperimentHub."
),
    BiocVersion = c("3.24", "3.24", "3.24", "3.24"),
    Genome = c("hg18", "hg18", "hg18", "hg18"),
    SourceType = c("CEL", "CEL", "CEL", "CEL"),
    SourceUrl = c("https://www.coriell.org/1/NIGMS/Collections/HapMap-project", 
"https://www.coriell.org/1/NIGMS/Collections/HapMap-project", 
"https://www.coriell.org/1/NIGMS/Collections/HapMap-project", 
"https://www.coriell.org/1/NIGMS/Collections/HapMap-project"),
    SourceVersion = c("hapmap3", "hapmap3", "hapmap3", "hapmap3"),
    Species = c("Homo sapiens", "Homo sapiens", "Homo sapiens", "Homo sapiens"
),
    TaxonomyId = c("9606", "9606", "9606", "9606"),
    Coordinate_1_based = c(NA, NA, NA, NA),
    DataProvider = c("HapMap / Affymetrix", "HapMap / Affymetrix", "HapMap / Affymetrix", 
"HapMap / Affymetrix"),
    Maintainer = c("Benilton Carvalho <benilton@unicamp.br>", "Benilton Carvalho <benilton@unicamp.br>", 
"Benilton Carvalho <benilton@unicamp.br>", "Benilton Carvalho <benilton@unicamp.br>"
),
    RDataClass = c("SnpSet", "character", "character", "character"),
    DispatchClass = c("Rda", "FilePath", "FilePath", "FilePath"),
    Location_Prefix = c("https://zenodo.org/", "https://zenodo.org/", "https://zenodo.org/", 
"https://zenodo.org/"),
    RDataPath = c("records/23990454/files/crlmmResult.rda", "records/23990454/files/NA06985_GW6_C.CEL", 
"records/23990454/files/NA06991_GW6_C.CEL", "records/23990454/files/NA06993_GW6_C.CEL"
),
    Tags = c("Bioconductor:hapmapsnp6", "Bioconductor:hapmapsnp6", "Bioconductor:hapmapsnp6", 
"Bioconductor:hapmapsnp6"),
    stringsAsFactors = FALSE
)

write.csv(metadata, "inst/extdata/metadata.csv", row.names = FALSE)
