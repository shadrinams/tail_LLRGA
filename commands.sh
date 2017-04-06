 #!/bin/bash
 ##some linux commands##
 
 chmod 755 catdcd              #(rwxr-xr-x)
 ./catdcd -o mc_wtprot_traj.dcd -i wt.ind mc_wt_traj.dcd         #remove water from a trajectory

##Examples##
for i in {1..5}; do COMMAND-HERE; COMMAND2-HERE; done      #a for-loop
for i in 1 2 3 4 5; do COMMAND-HERE; COMMAND2-HERE; done      #a for-loop
for i in {0..10..2}; do echo "Welcome $i times"; done        #a for-loop
for((i=1;i<=10;i+=2)); do echo "Welcome $i times"; done          #a for-loop
for i in *; do echo $i; done        #a for-loop for files
for i in /etc/*.conf; do cp $i /backup; done         #a for-loop for files
for i in */; do (cd “$i” && git fetch) done           #a for-loop for directories
for i in {0..3}; do for j in {0..9}; do echo -n \($i, $j\); echo Is today the $i$j \?; done; done           #a double for-loop

for d in */; do cp del_run1/catdcd "$d"; done
#create prot.ind#
./catdcd -o prot.dcd -i prot.ind mc_wt_traj.dcd
cp prot.dcd analysis0_1E7/
#create prot.in#
for i in {2..10}; do cp -r analysis0_1E7/ analysis0_"$i"E7/; done
for i in {1..10}; do cd analysis0_"$i"E7/; sed -i "s/*/${i}/g" mc_wtprot.key; qsub campari_debug.sh; cd ..; done   #changing line in a file
#wait for debug runs#
mkdir RGHIST
for i in {1..10}; do cp analysis0_"$i"E7/RGHIST.dat RGHIST/$i.dat; done
cd RGHIST
for i in {1..10}; do sed -i "s/Analy./${i}/g" $i.dat; done
paste <(awk '{print $1}' 10.dat) <(awk '{print $2}' 1.dat) <(awk '{print $2}' 2.dat) <(awk '{print $2}' 3.dat) <(awk '{print $2}' 4.dat) <(awk '{print $2}' 5.dat) <(awk '{print $2}' 6.dat) <(awk '{print $2}' 7.dat) <(awk '{print $2}' 8.dat) <(awk '{print $2}' 9.dat) <(awk '{print $2}' 10.dat) > del_run1.dat
