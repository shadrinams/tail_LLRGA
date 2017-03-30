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
