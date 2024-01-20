library(ape)

#m <- as.matrix(read.table("trag2hd_snps_varonly.dist", header=F))
m <- as.matrix(read.table("tragmain_sites_variable_noindels_nomultipoly_nomissing.dist", header=F))

#names <- read.table("trag2hd_snps_varonly.dist.id", sep=",")
names <- read.table("tragmain_sites_variable_noindels.dist.id", sep=",")
names <- gsub("\t", "_", names$V1)
names
rownames(m) <- names
colnames(m) <- names
spec <- substring(colnames(m), 1, 4)
spec
colors <- c("Tory" = "#F8766D", "Tder" = "#CD9600",
"Tstr" = "#7CAE00", "Timb" = "#00BE67",
"Tbux" = "#00BFC4","Scaf" = "#C77CFF","Tspe" = "#FF61CC")

#neighbour joining
out <- c("TstrZam_0843")
pdf("ibstree_new.pdf")
plot.phylo(root(nj(m), outgroup = out), tip.color = colors[spec], cex = 0.2)
#ape::add.scale.bar()
legend("bottomright",legend=c("Eland", "Giant Eland","Greater kudu", "Lesser kudu","Mountain nyala","Nyala","Sitatunga"),  
       fill = c("#F8766D","#CD9600","#7CAE00", "#00BE67","#00BFC4","#C77CFF","#FF61CC")
)
dev.off()

