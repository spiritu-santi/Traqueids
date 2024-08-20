library(ape)
t <- read.tree(file = "RAxML/RAxML_bipartitions.Traqueids_v3.tre")
tips <- t$tip.label
a <- read.table(file = "RAxML/phylo_species_lookup_0.txt",header = TRUE)
t$tip.label <- a$orig_name[match(tips,a$code_name)]
t$tip.label[which(is.na(a$orig_name[match(tips,a$code_name)]))] <- tips[which(is.na(a$orig_name[match(tips,a$code_name)]))]
dup <- which(t$tip.label == "Bowenia_spectabilis")
t <- drop.tip(t, dup[1])
write.tree(t,file="RAxML/RAxML_bipartitions.Traqueids_v3_RENAMED.tree")
