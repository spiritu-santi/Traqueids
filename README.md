# Traqueids

All versions of the trees (incl. ML and dated trees) are kept, but the final trees used should always be the latest version:
- v3.1 for RAxML trees (November 6, 2024).
- v3 for treePL trees (November 6, 2024).

The latest version of the dated trees (treePL) was further edited for analysis:
- v.3.2 is the tree with angiosperms and ferns 'pruned-out'.
- v.3.3 is the pruned tree (v.3.2) with two unsampled species grafted into the tree. These two species have no molecular data for inclusion in the alingment.
  - 'Zamia_soconuscensis' grafted as sister to the remaining (sampled) species in the genus. 
     - the position below the MRCA of sampled 'Zamia' (point of attachment of new branch) was determined as the mean of the length of all terminal branches gennus.
  - 'Dioon_planifolium' grafted as sister to 'Dioon_holmgrenii'. 
    - the point of attachment of the new branch was determined as approximately half the length of the terminal branch of 'Dioon_holmgrenii'.
    - the branch length was 'floored' to the nearest integer, which was used as the (~mid) point of attachment of the new branch.
- v.3.5 is the tree (v.3.3) with two unsampled 'varieties/subspecies' grafted into the tree.
  - The branch for 'Pinus_patula' was broken into two: 'Pinus_patula_Hidalgo' and 'Pinus_patula_Hidalgo'
     - the point of attachment (break) was set arbitrarily to a small value using rounding and substraction of the original branch length of the species.
  - The branch for 'Pseudotsuga_menziesii' was broken into two: 'Pseudotsuga_menziesii_menziesii' and 'Pseudotsuga_menziesii_glauca'
     - the point of attachment (break) was set arbitrarily to a small value using rounding and substraction of the original branch length of the species.
  - Additional pruning of 'Ephedra' and 'Welwitschia'.
