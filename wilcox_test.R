# http://www.sthda.com/english/wiki/unpaired-two-samples-t-test-in-r


smp1 <- read.csv(file.choose()) #./data/Results1088.csv
smp2 <- read.csv(file.choose()) #./data/Results1165.csv


my_data <- data.frame( 
                group = c(rep(c("smp1"), nrow(smp1)),rep(c("smp2"), nrow(smp2))),
                area = c(smp1[["Area"]],  smp2[["Area"]])
                )

library("ggpubr")
ggboxplot(my_data, x = "group", y = "area", 
          color = "group", palette = c("#00AFBB", "#E7B800"),
        ylab = "Area", xlab = "Groups")

#Shapiro-Wilk normality test
with(my_data, shapiro.test(area[group == "smp1"]))
with(my_data, shapiro.test(area[group == "smp2"]))

#F-test to test for homogeneity in variances
res.ftest <- var.test(area ~ group, data = my_data)
res.ftest

# Compute t-test
res <- t.test(area ~ group, data = my_data, var.equal = FALSE)
res


my_data <- data.frame( 
                group = c(rep(c("smp1"), nrow(smp1)),rep(c("smp2"), nrow(smp2))),
                round = c(smp1[["Round"]],  smp2[["Round"]])
                )

ggboxplot(my_data, x = "group", y = "round", 
          color = "group", palette = c("#00AFBB", "#E7B800"),
        ylab = "Round", xlab = "Groups")

#Shapiro-Wilk normality test
with(my_data, shapiro.test(round[group == "smp1"]))
with(my_data, shapiro.test(round[group == "smp2"]))

#F-test to test for homogeneity in variances
res.ftest <- var.test(round ~ group, data = my_data)
res.ftest

# Compute t-test
res <- t.test(round ~ group, data = my_data, var.equal = TRUE)
res