library(genio)
library(parallel)

plink <- read_plink("/home/rdc143/trag_analyses/bed/BosTau9_tragmain_sites_variable_noindels_nomultipoly_nomissing")

popinfo <- substr(plink$fam$fam, 1, 4)


getpolycount <- function(index){
    row <- plink$X[index,]
    ma <- aggregate(row, by=list(popinfo=popinfo), FUN=mean)$x
    npoly <- sum(ma > 0)
    npoly > 1
}



keep <- unlist(mclapply(1:nrow(plink$X), getpolycount, mc.cores=180))

mean(keep)

plink$X <- plink$X[keep, ]
plink$bim <- plink$bim[keep, ]

write_plink("/home/rdc143/trag_analyses/bed/BosTau9_tragmain_sites_variable_noindels_nomultipoly_nomissing_nosinglepopsites", plink$X, plink$bim, plink$fam)
