library(ape)
library(tidyverse)
#liibrary(TreeTools)
a <- read.table(file = "RAxML/phylo_species_lookup_0.txt",header = TRUE)
# phy <- phylotools::read.phylip("phylo_0.phylip")
# phy$seq.name <- a$orig_name[match(phy$seq.name,a$code_name)]
# phylotools::dat2phylip(phy,"phylo_0_renamed.phylip")
phy <- read.FASTA("RAxML/phylo_0.phylip.v4.fasta")
matcha <- a$orig_name[match(names(phy),a$code_name)]
names(phy)[which(!is.na(matcha))] <- matcha[which(!is.na(matcha))]
names(phy) <- strsplit(names(phy),split = "_") %>% lapply(.,"[",1:2) %>% lapply(.,paste,collapse="_") %>% 
  unlist()
write.FASTA(phy,"RAxML/phylo_0.phylip.renamed.v4.fasta")


### RENAME TREES: REPLACE PHYLOGENERATOR CODES WITH NAMES
t <- read.tree(file = "RAxML/RAxML_bipartitions.Traqueids_v3.1.tre")
tips <- t$tip.label
a <- read.table(file = "RAxML/phylo_species_lookup_0.txt",header = TRUE)
t$tip.label <- a$orig_name[match(tips,a$code_name)]
t$tip.label[which(is.na(a$orig_name[match(tips,a$code_name)]))] <- tips[which(is.na(a$orig_name[match(tips,a$code_name)]))]
dup <- which(t$tip.label == "Bowenia_spectabilis")
t <- drop.tip(t, dup[1])
write.tree(t,file="RAxML/RAxML_bipartitions.Traqueids_v3.1_RENAMED.tree")

### PRUNE TREE TO OMIT ANGIOSPERMS AND FERNS
t <- read.tree(file = "treePL/treePL_Gymnosperms.v3.trees")
tips <- t$tip.label
node <- getMRCA(t,tip = tips[c(grep("Amborella",tips), grep("Quercus",tips))])
t.prune <- drop.tip(t, extract.clade(t,node)$tip.label)
node <- getMRCA(t.prune,tip = tips[c(grep("Cyathea",tips), grep("Pteridium",tips))])
t.prune <- drop.tip(t.prune, extract.clade(t.prune,node)$tip.label)
t.prune <- drop.tip(t.prune, "Cycas_revoluta")
write.tree(t.prune,file="treePL/treePL_Gymnosperms.v3.2.trees")

### GRAFT TWO MISSING SPECIES FRORM TREE (NO MOLECULAR DATA!)
### - 'Zamia_soconuscensis' was grafted as sister to the remaining (sampled) species in the genus. 
###     - the position below the MRCA of sampled species (point of attachment of new branch) was determined as the mean of the length of all terminal branches in the 'Zamia' clade.
### - 'Dioon_planifolium' was grafted as sister to 'Dioon_holmgrenii'. 
###     - - the point of attachment of new branch was determined as the approximately half the branch length for 'Dioon_holmgrenii'. The branch length was 'floored' to the nearest integer, which was used as the (~mid) point to attach the new branch.

t <- read.tree(file = "treePL/treePL_Gymnosperms.v5.1.trees")
tips <- t$tip.label
node <- getMRCA(t,tip = tips[grep("Zamia",tips)])
clade <- extract.clade(t,node)
aqui <- which(t$edge[,2]==node)
ind <- which(t$edge[,2]%in% grep("Zamia",tips))
pos <- mean(t$edge.length[ind])
t <- TreeTools::AddTip(t,where = node, label="Zamia_soconuscensis",lengthBelow = pos,
                            edgeLength = pos + max(branching.times(clade)))

tips <- t$tip.label
node <- grep("Dioon_holmgrenii",tips)
pos <- t$edge.length[which(t$edge[,2]==node)]
below <- floor(pos)
prueba <- TreeTools::AddTip(t,where = node, label="Dioon_planifolium",
                            edgeLength = pos - below, lengthBelow = pos - below)
write.tree(prueba,file="treePL/treePL_Gymnosperms.v5.2.trees")


### - A second tip for 'Pinus_patula' was grafted into the tree.
t <- read.tree(file = "treePL/treePL_Gymnosperms.v5.2.trees")
tips <- t$tip.label
node <- grep("Pinus_patula",tips)
t$tip.label[grep("Pinus_patula",tips)] <- "Pinus_patula_Puebla" 
pos <- t$edge.length[which(t$edge[,2]==node)]
below <- round(pos,2)
prueba <- TreeTools::AddTip(t,where = node, label="Pinus_patula_Hidalgo",
                            edgeLength = pos - below, lengthBelow = pos - below)
write.tree(prueba,file="treePL/treePL_Gymnosperms.v5.3.trees")


t <- read.tree(file = "treePL/treePL_Gymnosperms.v5.3.trees")
tips <- t$tip.label
node <- grep("Pseudotsuga_menziesii",tips)
t$tip.label[grep("Pseudotsuga_menziesii",tips)] <- "Pseudotsuga_menziesii_glauca" 
pos <- t$edge.length[which(t$edge[,2]==node)]
below <- floor(pos)
prueba <- TreeTools::AddTip(t,where = node, label="Pseudotsuga_menziesii_menziesii",
                            edgeLength = pos - below, lengthBelow = pos - below)
tips <- prueba$tip.label
# prueba <- drop.tip(prueba, grep("Ephedra|Welwitschia",tips))
write.tree(prueba,file="treePL/treePL_Gymnosperms.v5.4.trees")


t <- read.tree(file = "treePL/treePL_Gymnosperms.v5.4.trees")
tips <- t$tip.label
node <- grep("Jatropha_curcas",tips)
t$tip.label[grep("Jatropha_curcas",tips)] <- "Jatropha_cuneata" 
pos <- t$edge.length[which(t$edge[,2]==node)]
below <- floor(pos) - floor(pos)*0.1
prueba <- TreeTools::AddTip(t,where = node, label="Jatropha_chamelensis",
                            edgeLength = pos - below, lengthBelow = pos - below)
tips <- prueba$tip.label
# prueba <- drop.tip(prueba, grep("Ephedra|Welwitschia",tips))
write.tree(prueba,file="treePL/treePL_Gymnosperms.v5.5.trees")

t <- read.tree(file = "treePL/treePL_Gymnosperms.v5.5.trees")
t$tip.label[which(t$tip.label=="Moringa")] <-  "Moringa_oleifera"
readxl::read_xlsx("Placeholders.xlsx") %>% 
  filter(ACCION=="PLACEHOLDER") %>% 
  pull(`ALTERNATIVA SUGERIDA` ) -> target
target <- target %>% sub(" ","_",.)

readxl::read_xlsx("Placeholders.xlsx") %>% 
  filter(ACCION=="PLACEHOLDER") %>% 
  pull(MISSING) -> replacement



for(i in 1:length(target)){
  cat(i,"\r")
  
  t$tip.label[which(t$tip.label==target[i])] <- replacement[i]

}

write.tree(t,file="treePL/treePL_Gymnosperms.v5.6.trees")


t <- read.tree(file = "treePL/treePL_Gymnosperms.v5.6.trees")
is.ultrametric(t)
sort(t$tip.label)


