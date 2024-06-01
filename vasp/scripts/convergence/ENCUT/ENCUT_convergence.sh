#!/bin/bash

# Function to replace ENCUT in INCAR file
replace_encut() {
    local dir=$1
    local encut_value=$2
    sed -i "s/ENCUT *= *[0-9]\+/ENCUT  = $encut_value/" $dir/INCAR
}

# Function to extract energy from OUTCAR
extract_energy() {
    local outcar_file=$1
    grep "energy  without entropy" $outcar_file | tail -1 | awk '{print $7}'
}

# Get user inputs
read -p "Enter the starting ENCUT value: " start_encut
read -p "Enter the ending ENCUT value: " end_encut
read -p "Enter the ENCUT step value: " step_encut

# Prepare output file
output_file="encut_vs_energy.dat"
echo "# ENCUT (eV)    Energy (eV)" > $output_file

# Loop over the ENCUT values
for (( encut=$start_encut; encut<=$end_encut; encut+=$step_encut )); do
    # Create a directory for this ENCUT value
    dir="encut_$encut"
    mkdir $dir

    # Copy input files to the directory
    cp INCAR POSCAR POTCAR KPOINTS $dir

    # Replace ENCUT value in the INCAR file
    replace_encut $dir $encut

    # Change to the directory and run VASP
    cd $dir
    vasp_std > vasp_output.log

    # Extract energy from OUTCAR and write to the output file
    energy=$(extract_energy OUTCAR)
    echo "$encut    $energy" >> ../$output_file

    echo "Convergence test completed for ENCUT=$encut eV. Total energy: $energy"

    # Change back to the original directory
    cd ..

    # Clean up the directory if needed (optional)
    # rm -r $dir
done

echo "Convergence test completed. Results are saved in $output_file"
