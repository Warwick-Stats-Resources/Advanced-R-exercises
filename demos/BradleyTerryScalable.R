# remotes::install_github("EllaKaye/BradleyTerryScalable")
library(BradleyTerryScalable)
citations
citations_btdata <- btdata(citations)
citations_btdata
summary(citations_btdata)

citations_btfit <- btfit(citations_btdata, 1)
citations_btfit
summary(citations_btfit)
