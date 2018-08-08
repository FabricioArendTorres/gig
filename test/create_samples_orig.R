library(GIGrvg)
library(statmod)
library(dplyr)
library(jsonlite)
library(readr)


# # Set parameters
# # (chosen arbirtrarily, I'm open for any sound suggestions)
# # With parametrizaiton of GIG as in Wikipedia:
# # lambda=p, chi=b, psi=a
# ##################################################################### 
# 
# # ### compare with inverse gaussian
# # IG.lambdas <- c(0.1, 5, 10, 20)
# # IG.mus <- c(0.1, 1, 2, 3)
# # # IG is a special case of GIG, so compare with IG
# # IG.a <- IG.lambdas/IG.mus
# # IG.b <- IG.lambdas
# # IG.p <- rep(-0.5, length(IG.lambdas))
# # 
# # ### compare with gamma
# # GA.alphas <- c(0.1, 5, 10, 200)
# # GA.betas <- c(0.1, 1, 2, 3)
# # 
# # # Gamma is a special case of GIG, so compare with Gamma
# # GA.a <- 2*GA.betas
# # GA.b <- rep(0, length(GA.alphas))
# # GA.p <- GA.alphas

### compare with original R implementation by Leydolf and Hormann
# https://cran.r-project.org/web/packages/GIGrvg/GIGrvg.pdf

GIG.a <-c(0.1, 10, 100, 200, 34, 3)
GIG.b <-c(100, 10, 0.1, 200, 3, 34)
GIG.p <-c(-3, 2, 0.1, 1, -0.5, 5)
#####################################################################

# draw all samples
# df = data.frame(a = c(IG.a, GA.a, GIG.a), b = c(IG.b, GA.b, GIG.b), p = c(IG.p, GA.p, GIG.p))
df = data.frame(a = GIG.a, b = GIG.b, p = GIG.p)

# TODO: Draw from Inverse Gaussian and Gamma for corresponding parameter values, not only from GIG
tmp = list()
for(i in 1:nrow(df)){
  tmp[[i]] <- (rgig(n = 5000, lambda = df$p[i], chi = df$b[i], psi=df$a[i]))
}
df$samples <- tmp


df %>% 
  toJSON(digits=NA) %>%
  write_lines(path="samples_R.json")
