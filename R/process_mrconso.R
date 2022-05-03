library(kiln)
library(purrr)
library(arrow)
library(rvest)
library(dplyr)

cache_dir <- "cache"
data_dir <- "data"
mkdir(data_dir)
# unzip the files
list.files(cache_dir, full.names = TRUE) |>
    keep(~ grepl("*.zip", .x)) |>
    walk(~ unzip(.x, exdir = cache_dir))

# Process UMLS
# get the df
df <- vroom::vroom(file.path(cache_dir, "MRCONSO.RRF"), delim = "|")
# get the names from the table descriptors
df <- df[1:length(df)-1]
table_url <- "https://www.ncbi.nlm.nih.gov/books/NBK9685/table/ch03.T.concept_names_and_sources_file_mr/?report=objectonly"
UMLS_names <- table_url |>
    rvest::read_html(table_url) |>
    rvest::html_elements("table") |>
    html_table() |>
    pluck(1) |> select("Col.") |> as.list() |> 
    pluck("Col.")
colnames(df) <- UMLS_names
arrow::write_parquet(df,file.path(data_dir,"MRCONSO.parquet"))
rm(df)
gc()