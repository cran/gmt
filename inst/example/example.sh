#!/bin/bash

file=map.ps
gmt set -Ds MAP_DEGREE_SYMBOL degree PS_PAGE_ORIENTATION portrait FORMAT_GEO_MAP F
gmt pscoast -JM16c -R30W/15E/54N/70N -Di -G100/200/100 -B10f5g5/4f2g2 -K > $file
gmt psxy tmp/xy.gmt -JM -R -Scp -W2p -O -K >> $file
gmt pstext tmp/text.gmt -JM -R -F+f+a+j -O -K >> $file
gmt psxy tmp/bar.gmt -JM -R -W1p -G180 -O -K -A >> $file
gmt psxy tmp/empty.gmt -JM -R -O >> $file
