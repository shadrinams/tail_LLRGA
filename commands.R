### some commands for R  ###

data <- read.table("runs\\moveset_run1\\FYC.dat", colClasses = c(rep("numeric")), sep="", head=T)
head(data)
qplot(data=data,x=X29DI, y=X30DI, alpha=I(0.01))

data <- read.csv("runs\\wt_run1\\RAMACHANDRAN.dat", colClasses = c(rep("numeric")), sep="", head=F)
mat=as.matrix(data)

resmat[lower.tri(resmat)] <- NA
heatmap(resmat, symm=F, Rowv = NA, Colv = NA, scale='none', revC=F, col = colorRampPalette(c("white","black"))(256))

names(mat) <- seq(-180, 180, 6)
row.names(mat) <- seq(-180, 180, 6)
heatmap(mat, symm=T, Rowv = NA, Colv = NA, scale='none', revC=T, col = colorRampPalette(c("red","white","blue"))(256))
heatmap(mat, symm=F, Rowv = NA, Colv = NA, scale='none', revC=F, col = colorRampPalette(c("red","white","blue"))(299), breaks=c(seq(-1,-0.33,length=100),seq(-0.33,0.33,length=100),seq(0.33,1,length=100)))  #assign colors
