set path "runs/ProDy"
mol new "$path/wt_all_ca.pdb"
mol addfile "$path/yd_all_ca_aligned.dcd" waitfor all
set sel1 [atomselect top "resid 1 to 12"]
set sel2 [atomselect top "resid 31 to 39"]

set file [open "dist_along_PC1.dat" w]
set nf [molinfo top get numframes]

for {set i 0 } {$i < $nf } {incr i } {
$sel1 frame $i
$sel2 frame $i
set sel1_center [measure center $sel1]
set sel2_center [measure center $sel2]
set dist [veclength [vecsub $sel1_center $sel2_center]]
set dist [expr {double(round(100*$dist))/100}]
puts $file "$i|$dist"
}

close $file
mol delete top
