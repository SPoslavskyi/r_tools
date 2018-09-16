MC <-
matrix(c(
1, 0,
4, 7,
1, 2
), ncol = 2, byrow = TRUE )
MC
fisher.test(MC)
