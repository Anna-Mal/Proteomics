library(dplyr)
library(tibble)
library(tidyr)
library(readr)
library(readxl)
library(stringr)


setwd("/eggnog/results")

lines_prot <- readLines("annot_ref_new.emapper.annotations")
header_line_prot_index <- which(grepl("^#query", lines_prot))
header_prot <- strsplit(sub("^#", "", lines_prot[header_line_prot_index]), "\t")[[1]] 

eggnog_prot_df <- read_tsv("annot_ref.emapper.annotations", skip = header_line_prot_index, col_names = header_prot)

columns_to_check <- c(
  "COG_category", "Description", 
  "Preferred_name", "GOs", "EC", "KEGG_ko", "KEGG_Pathway", 
  "KEGG_Module", "KEGG_Reaction", "KEGG_rclass", "BRITE", 
  "KEGG_TC", "CAZy", "BiGG_Reaction", "PFAMs"
)

eggnog_prot_df<- eggnog_prot_df %>% mutate(across(everything(), ~ na_if(as.character(.), "-"))) %>% filter(!is.na(seed_ortholog)) %>% mutate(gene_name = !is.na(Preferred_name))%>%
  rowwise() %>%
  mutate(has_annotation = any(!is.na(c_across(all_of(columns_to_check))))) %>%
  ungroup()


saveRDS(eggnog_prot_df, file = "../gene_lists_for_prot/eggnog_prot_df.rds")

eggnog_prot_df %>% filter(has_annotation == TRUE) %>% pull(query) %>% writeLines("../gene_lists_for_prot/gene_queries_prot.txt")
