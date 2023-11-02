##### load libraries
library(dplyr)

##### Table 0
#create grouping variable by job loss, 1=no, 2=yes
job_loss <- data %>% group_by(CVEXP_MJB)

  #marital status, 2=other for this variable
  data %>% count(MARRIED)
  count(job_loss, MARRIED)

  #urbanicity
  data %>% count(URB_RUR)
  count(job_loss, URB_RUR)

  #maternal age
  data %>% count(MAT_AGE_NAPHSIS)
  print(count(job_loss, MAT_AGE_NAPHSIS), n=30)

  #maternal education
  data %>% count(MAT_ED)
  print(count(job_loss, MAT_ED), n=30)

  #maternal race
  data %>% count(MAT_RACE)
  print(count(job_loss, MAT_RACE), n=35)

  ###### income
  data %>% count()

  #insurance payer
  data %>% count(PAY)
  print(count(job_loss, PAY), n=35)

  #WIC
  data %>% count(MAT_WIC)
  print(count(job_loss, MAT_WIC), n=35)

  #Trouble paying bills
  data %>% count(CVEXP_BILL)
  print(count(job_loss, CVEXP_BILL), n=35)

  #State
  data %>% count(STATE)
  print(count(job_loss, STATE), n=35)

  #Depression
  data %>% count(CVEXP_DEP)
  print(count(job_loss, CVEXP_DEP), n=35)

  #Anxiety
  data %>% count(CVEXP_ANX)
  print(count(job_loss, CVEXP_ANX), n=35)

  #PTB
  data %>% count(PTB)
  print(count(job_loss, PTB), n=35)

  #LBW
  data %>% count(LBW)
  print(count(job_loss, LBW), n=35)

