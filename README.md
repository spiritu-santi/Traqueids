# Traqueids

All versions of the trees (incl. ML and dated trees) are kept, but the final trees used should always be the latest version:
- v5 for RAxML trees (February 11, 2025).
- v5.* for treePL trees (February 11, 2025).

The latest version of the dated trees (treePL) was further edited for analysis:
- v.5.1 tree with species with molecular data.
- v.5.2 is the tree (v.5.1) with two unsampled species grafted into the tree. These two species have no molecular data for inclusion in the alingment.
  - 'Zamia_soconuscensis' grafted as sister to the remaining (sampled) species in the genus. 
     - the position below the MRCA of sampled 'Zamia' (point of attachment of new branch) was determined as the mean of the length of all terminal branches gennus.
  - 'Dioon_planifolium' grafted as sister to 'Dioon_holmgrenii'. 
    - the point of attachment of the new branch was determined as approximately half the length of the terminal branch of 'Dioon_holmgrenii'.
    - the branch length was 'floored' to the nearest integer, which was used as the (~mid) point of attachment of the new branch.
- v.5.4 is the previous tree with two unsampled 'varieties/subspecies' grafted into the tree.
  - The branch for 'Pinus_patula' was broken into two: 'Pinus_patula_Hidalgo' and 'Pinus_patula_Hidalgo'
     - the point of attachment (break) was set arbitrarily to a small value using rounding and substraction of the original branch length of the species.
  - The branch for 'Pseudotsuga_menziesii' was broken into two: 'Pseudotsuga_menziesii_menziesii' and 'Pseudotsuga_menziesii_glauca'
     - the point of attachment (break) was set arbitrarily to a small value using rounding and substraction of the original branch length of the species.
- v.5.5 is the previous tree with two unsampled species of the same genus grafted into the tree using a placeholder for the genus.
  - The branch for 'Jatropha_curcas' was broken into two: 'Jatropha_cuneata' and 'Jatropha_chamelensis'
     - the point of attachment (break) was set arbitrarily to a 1/10 of the placeholder's branch length using rounding and substraction.
- v.5.6 is the previous tree with replacement names for placeholder species.
  - The names of the placeholders were replaced by the species (target) that were actually sampled for anatomical data.
     - All placeholders belong to the same genera as the target species.
     - Names for placeholders is available in a supplementary table.
