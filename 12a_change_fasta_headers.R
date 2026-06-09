library(dplyr)
library(tibble)
library(tidyr)
library(readr)
library(readxl)
library(stringr)

setwd("/eggnog/gene_lists_for_prot")

eggnog_prot_df<- readRDS(file = "eggnog_prot_df.rds")

write.table(eggnog_prot_df %>% filter(has_annotation == TRUE) %>%
       rowwise() %>%
       mutate(old_header=paste0(">", query)) %>%
  mutate(new_header= paste0(">ref_prot|", query, "|", Preferred_name, "|", Description)) %>%
  ungroup() %>% dplyr::select(old_header, new_header), file = "header_mapping_any.tsv",
            sep = "\t", quote = FALSE, row.names = FALSE, col.names = FALSE)