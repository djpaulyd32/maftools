% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oncodrive.R
\name{oncodrive}
\alias{oncodrive}
\title{Detect cancer driver genes based on positional clustering of variants.}
\usage{
oncodrive(maf, AACol = NULL, minMut = 5, pvalMethod = "zscore",
  nBgGenes = 100, bgEstimate = TRUE, ignoreGenes = NULL)
}
\arguments{
\item{maf}{an \code{\link{MAF}} object generated by \code{\link{read.maf}}}

\item{AACol}{manually specify column name for amino acid changes. Default looks for field 'AAChange'}

\item{minMut}{minimum number of mutations required for a gene to be included in analysis. Default 5.}

\item{pvalMethod}{either zscore (default method for oncodriveCLUST), poisson or combined (uses lowest of the two pvalues).}

\item{nBgGenes}{minimum number of genes required to estimate background score. Default 100. Do not change this unless its necessary.}

\item{bgEstimate}{If FALSE skips background estimation from synonymous variants and uses predifined values estimated from COSMIC synonymous variants.}

\item{ignoreGenes}{Ignore these genes from analysis. Default NULL. Helpful in case data contains large number of variants belonging to polymorphic genes such as mucins and TTN.}
}
\value{
data table of genes ordered according to p-values.
}
\description{
Clusters variants based on their position to detect disease causing genes.
}
\details{
This is the re-implimentation of algorithm defined in OncodriveCLUST article. Concept is based on the fact that most of the variants in cancer causing genes are enriched at few specific loci (aka hotspots).
This method takes advantage of such positions to identify cancer genes. Cluster score of 1 means, a single hotspot hosts all observed variants. If you use this function, please cite OncodriveCLUST article.
}
\examples{

laml.maf <- system.file("extdata", "tcga_laml.maf.gz", package = "maftools")
laml <- read.maf(maf = laml.maf)
laml.sig <- oncodrive(maf = laml, AACol = 'Protein_Change', minMut = 5)

}
\references{
Tamborero D, Gonzalez-Perez A and Lopez-Bigas N. OncodriveCLUST: exploiting the positional clustering of somatic mutations to identify cancer genes. Bioinformatics. 2013; doi: 10.1093/bioinformatics/btt395s
}
\seealso{
\code{\link{plotOncodrive}}
}
