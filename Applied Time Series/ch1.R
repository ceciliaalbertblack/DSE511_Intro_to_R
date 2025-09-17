library(readxl)
Bioavailability_Master_Spreadsheet <- read_excel("Bioavailability Master Spreadsheet.xlsx",
                                                 sheet = "Speciation Mode")
dat<-(Bioavailability_Master_Spreadsheet)
str(dat)
dat <- as.data.frame(dat)
rownames(dat) <- (dat$Sample)
#change date to character
dat$Date <- as.Date(dat$Date, format = "%Y-%m-%d")
dat$Theme <- as.factor(dat$Theme)
dat$Regime <- as.factor(dat$Regime)
dat$Flow_state <- as.factor(dat$Flow_state)
dat$Type <- as.factor(dat$Type)
dat$Lithology <- as.factor(dat$Lithology)
dat$Development <- as.factor(dat$Development)
dat$Development <- factor(dat$Development, levels = c("High intensity", "Medium intensity", "Low intensity"))
dat$Distance_from_EFPC <- as.factor(dat$Distance_from_EFPC)
dat$Drainage_area <- as.factor(dat$Drainage_area)
dat$Drainage_area <- factor(dat$Drainage_area, levels = c("<1 km2", "1-10 km2", ">10 km2"))
dat$Competing_cations <- as.numeric(dat$Ca_uM + dat$Mg_uM + dat$Na_uM + dat$K_uM)
str(dat)
View(dat)

#Log transform concentrations in columns 27-78
library(dplyr)
dat <- dat %>%
  mutate(across(27:73, ~ log10(.), .names = "log_{.col}"))
View(dat)
str(dat)
colnames(dat)


#Time series model
class(dat$Date)
dat <- dat %>% mutate(Date = substr(date))
dat$Date <- as.numeric(dat$Date)
library(tidyverse)

ggplot(data = dat, aes(x = Date, y = log_Meas_Zn_nM, group=Site))+
  geom_line()+ 
  geom_smooth(method = "lm", se = FALSE)



ggplot(dat, aes(x = Date, y = log_TBL_Zn_nM_gw)) + 
  geom_boxplot(aes(group=Site)) +
  geom_line(aes(group = Site), colour = "#3366FF", alpha = 0.5)


















