# remotes::install_github("EllaKaye/BradleyTerryScalable")
library(BradleyTerryScalable)
citations
citations_btdata <- btdata(citations)
citations_btdata
citations_btdata |> class()
summary(citations_btdata)

citations_btfit <- btfit(citations_btdata, 1)
citations_btfit
citations_btfit |> class()
summary(citations_btfit)
