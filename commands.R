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

wt<-read.table("wt_all\\distances.dat", colClasses = c(rep("numeric")), sep="", head=T)
yd<-read.table("yd_all\\distances.dat", colClasses = c(rep("numeric")), sep="", head=T)
s10l30_wt <- density(wt$S10.L30, from=0, to=70, n=71)
s10l30_yd <- density(yd$S10.L30, from=0, to=70, n=71)
plot(range(s10l30_yd$x, s10l30_wt$x), range(s10l30_yd$y, s10l30_wt$y), type = "n", xlab = "distance, A", ylab = "fraction")
lines(s10l30_wt, col="blue")
lines(s10l30_yd, col="red")
legend("right", c("WT","Y11D"), lty=c(1,1), lwd=c(2.5,2.5),col=c("blue","red"))

for(i in 2:26){
  mypath <- file.path("D:","Maria","tail_LLRGA_CAMPARI","runs","distances",paste("hist_", gsub("\\.", "_", names(wt[i])), ".png", sep = ""))
  png(file=mypath)
  
  dens_wt <- density(wt[,i], from=0, to=70, n=71)
  dens_yd <- density(yd[,i], from=0, to=70, n=71)
  
  mytitle = paste("Histogram of distance between", gsub("\\.", " and ", names(wt[i])))
  plot(range(dens_wt$x, dens_yd$x), range(0,0.075), type = "n", xlab = "distance, A", ylab = "fraction", main = mytitle)
  lines(dens_wt, col="blue", lwd=2.5)
  lines(dens_yd, col="red", lwd=2.5)
  legend("right", c("WT","Y11D"), lty=c(1,1), lwd=c(2.5,2.5),col=c("blue","red"))
  
  dev.off()
}
