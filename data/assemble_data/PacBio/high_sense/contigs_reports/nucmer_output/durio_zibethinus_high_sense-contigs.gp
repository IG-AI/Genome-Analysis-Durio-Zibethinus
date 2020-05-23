set terminal canvas jsdir ""
set output "/home/daniagst/Genome-Analysis/data/assemble_data/PacBio/high_sense/contigs_reports/nucmer_output/durio_zibethinus_high_sense-contigs.html"
set ytics ( \
 "0" 0, \
 "5000000" 5000000, \
 "10000000" 10000000, \
 "15000000" 15000000, \
 "20000000" 20000000, \
 "25000000" 25000000, \
 "30000000" 30000000, \
 "35000000" 35000000, \
 "" 38309010 \
)
set size 1,1
set grid
set key outside bottom right
set border 0
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "Assembly" noenhanced
set format "%.0f"
set xrange [1:*]
set yrange [1:38309010]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/home/daniagst/Genome-Analysis/data/assemble_data/PacBio/high_sense/contigs_reports/nucmer_output/durio_zibethinus_high_sense-contigs.fplot" title "FWD" w lp ls 1, \
 "/home/daniagst/Genome-Analysis/data/assemble_data/PacBio/high_sense/contigs_reports/nucmer_output/durio_zibethinus_high_sense-contigs.rplot" title "REV" w lp ls 2
