##### Missing
count_missing <- apply(data,2,function(x) sum(is.na(x)))
sort(count_missing)

# Analysis of COVID experience data missingness
data_sub <- data %>% select(MARRIED, URB_RUR, MAT_AGE_NAPHSIS, MAT_ED, MAT_RACE, PAY, MAT_WIC, STATE, PTB, LBW, CVEXP_MJB, CVEXP_BILL, CVEXP_DEP, CVEXP_ANX)

data_sub <- data_sub %>% mutate(missing_job = ifelse((is.na(CVEXP_MJB)), 1, 0))
data_sub <- data_sub %>% mutate(missing_bill = ifelse((is.na(CVEXP_BILL)), 1, 0))
data_sub <- data_sub %>% mutate(missing_anx = ifelse((is.na(CVEXP_DEP)), 1, 0))
data_sub <- data_sub %>% mutate(missing_dep = ifelse((is.na(CVEXP_ANX)), 1, 0))
data_sub <- data_sub %>% mutate(missing = (missing_job + missing_bill + missing_anx + missing_dep))

# missing variable counts the number of CVEXP variables missing with values ranging from 0 - 4, dichtomized to either no missing or missing since most are either 0 or 4
data_sub %>% count(missing)
data_sub <- data_sub %>% mutate(missing = ifelse(missing > 0, 1, 0))
data_sub %>% count(missing)

missing <- data_sub %>% group_by(missing)
