mol new wt_all_END.pdb
mol addfile yd_hip_all.dcd waitfor all
set min 0
set max 13

set nf [molinfo top get numframes]
set sel [atomselect top "all"]

for {set i $nf} {$i>0} {incr i -1} {
	$sel frame $i
	set gyr [measure rgyr $sel weight none]
  if {$gyr <= $min || $gyr >= $max } {
     animate delete beg $i end $i
     }}
     
molinfo top get numframes
animate write dcd gyr/gyr_min[list $min]_max$max.dcd waitfor all top

mol delete top

wt_hip
206 656 (0-13)
668 902 (13-16)
324 445 (16-100)

yd_hip
183143 (0-13)
572349 (13-16)
381176 (16-100)
