library(here)
library(reticulate)
library(text)

df <- read.csv(here("data", "df.csv"))

reticulate::import('torch')
reticulate::import('numpy')
reticulate::import('transformers')
reticulate::import('nltk')
reticulate::import('tokenizers')

embeddings <- textEmbed(x = df$conflict_text,
                        model = "roberta-base",
                        layers = 12)

write.csv(embeddings, here("data", "embeddings.csv"))