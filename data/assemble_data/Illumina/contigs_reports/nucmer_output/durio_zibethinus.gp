set terminal canvas jsdir ""
set output "/domus/h1/daniagst/Genome-Analysis/data/assemble_data/Illumina/contigs_reports/nucmer_output/durio_zibethinus.html"
set ytics ( \
 "0" 0, \
 "5000000" 5000000, \
 "10000000" 10000000, \
 "15000000" 15000000, \
 "20000000" 20000000, \
 "25000000" 25000000, \
 "30000000" 30000000, \
 "35000000" 35000000, \
 "" 37518394 \
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
set yrange [1:37518394]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/domus/h1/daniagst/Genome-Analysis/data/assemble_data/Illumina/contigs_reports/nucmer_output/durio_zibethinus.fplot" title "FWD" w lp ls 1, \
 "/domus/h1/daniagst/Genome-Analysis/data/assemble_data/Illumina/contigs_reports/nucmer_output/durio_zibethinus.rplot" title "REV" w lp ls 2
