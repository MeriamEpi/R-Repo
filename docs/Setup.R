##### load libraries
library(haven)
library(dplyr)

##### load data and merge experience and vaccine sets
setwd ("/Users/meriamberka/Desktop/Thesis/Data/Berka_2020_2021/dta")
exp_data <- read_dta("berka_covid_exp.dta")
vac_data <- read_dta("berka_covid_vac.dta")
data <- left_join(exp_data, vac_data)

##### Create outcome variables
# LBW = 1 if BW is <2,500g
data <- data %>% mutate(LBW = ifelse(GRAM_NAPHSIS < 2500, 1, 0))
# PTB = 1 if baby was born at <37 weeks
data <- data %>% mutate(PTB = ifelse(GEST_WK_NAPHSIS < 4, 1, 0))

##### Recode variables to have a reference category (0).

# marital status, 0 = married, 1 = other
data <- data %>% mutate(MARRIED = ifelse(MARRIED == 2, 1, 0))

# urbanicity, 0 = urban, 1 = rural
data %>% mutate(URB_RUR = ifelse((URB_RUR = 2), 1, 0))

# maternal age, <=17 is the reference group, 5 year age ranges from 18-39, final category is 40+
data %>% mutate(MAT_AGE_NAPHSIS = MAT_AGE_NAPHSIS-1)

# maternal education, 0-8 years is the reference, 3 year ranges up to 15 years, last range is 16+
data %>% mutate(MAT_ED = MAT_ED-1)

# maternal race, white is the reference category, 1. Black, 2.AM Indian, 3.Chinese, 4.Japanese, 5.Filipino, 6.Hawaiian, 7.AK Native, 8. Mixed race, 9. Oth Asian, 10. Oth Nonwhite
data %>% mutate(MAT_RACE = case_when(MAT_RACE==2 ~ 0,
                                     MAT_RACE==3 ~ 1,
                                     MAT_RACE==4 ~ 2,
                                     MAT_RACE==5 ~ 3,
                                     MAT_RACE==6 ~ 4,
                                     MAT_RACE==7 ~ 5,
                                     MAT_RACE==8 ~ 6,
                                     MAT_RACE==10 ~ 7,
                                     MAT_RACE==11 ~ 8,
                                     MAT_RACE==1 ~ 9,
                                     MAT_RACE==9 ~ 10,
                                     TRUE ~ MAT_RACE))

# Insurance payer, MEDICAID is reference, 1. Private, 2. Self-pay, 3. Indian HS, 4. Champus/tricare, 5. Other gov, 7. Other
data %>% mutate(PAY = PAY - 1)

# Received WIC, no is reference category
data %>% mutate(MAT_WIC = ifelse((MAT_WIC=2),0,1))

# Trouble paying bills, no is reference category
data %>% mutate(CVEXP_BILL = CVEXP_BILL - 1)

# Depression, no is the reference category
data %>% mutate(CVEXP_DEP = CVEXP_DEP - 1)

# Anxiety, no is the reference category
data %>% mutate(CVEXP_ANX = CVEXP_ANX - 1)
