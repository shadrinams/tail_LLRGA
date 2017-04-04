### some commands for R  ###

data <- read.table("runs\\moveset_run1\\FYC.dat", colClasses = c(rep("numeric")), sep="", head=T)
head(data)
qplot(data=data,x=X29DI, y=X30DI, alpha=I(0.01))

data <- read.csv("runs\\wt_run1\\RAMACHANDRAN.dat", colClasses = c(rep("numeric")), sep="", head=F)
mat=as.matrix(data)
names(mat) <- seq(-180, 180, 6)
row.names(mat) <- seq(-180, 180, 6)
heatmap(mat, symm=T, Rowv = NA, Colv = NA, scale='none', revC=T, col = colorRampPalette(c("red","white","blue"))(256))
