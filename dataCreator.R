library(tigris)
library(magrittr)
load("shinyData1.RData")


ohio <- counties(state = "39", cb=T)

new <- merge(ohio, new, by="COUNTYFP")

rm(ohio)

#make the popup
countypop <- paste0("<p><b>", new$CTYNAME, "</b>",
                    "<br><br><u>Demographics for ages 12-25</u>",
                    "<br><em>Population: </em>",
                    prettyNum(new$total_popn,big.mark=",",scientific=FALSE),
                    "<br><em>Number of Minority Individuals: </em>", 
                    prettyNum(new$total_minority_popn,big.mark=",",scientific=FALSE), 
                    "<br><em>Percent of Minorities in Population: </em>",
                    round(new$pct_minority_popn, 2),"%",
                    "<br><br><u>Demographics for Entire Population</u>",
                    "<br><em>Total Population: </em>", 
                    prettyNum(new$TOT_POP,big.mark=",",scientific=FALSE),
                    "<br><em>Percent of Minorities in Population: </em>",
                    round(new$PCTMINOR, 2),"%</p>")



block <- blocks(state = '39')
block <- merge(block, blockDat, by="GEOID10")

save(top, bot, All, appalachian, rural, new, plc, citypop, tabledata, placeTable, new, countypop, block, file = "shinyData2.RData")
