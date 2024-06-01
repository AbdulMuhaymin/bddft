#!/usr/bin/gnuplot

# Set terminal type to qt
set terminal qt enhanced font 'Arial, 12'

# if you want to save the image, uncomment the following two lines and comment the previous line
# set terminal pngcairo enhanced font 'Arial, 12'
# set output 'encut_vs_energy.png'

# Set title and labels
set title "ENCUT vs Energy"
set xlabel "ENCUT (eV)"
set ylabel "Energy - Reference Energy (meV)"

# Set grid for better readability
set grid

# Read the data from the file
datafile = "encut_vs_energy.dat"

# Find the minimum energy value to use as reference
stats datafile using 2 nooutput
reference_energy = STATS_min

# Plot the data with energy relative to the reference energy
plot datafile using 1:($2 - reference_energy)*1000 with linespoints title "Energy vs ENCUT" linewidth 2 pointtype 7

# Pause the plot
pause -1
