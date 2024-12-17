# Defectista

Defectista is a Python package designed to facilitate defect calculations using the SIESTA software. It provides tools to:

- Create input files for SIESTA calculations of isolated defects (e.g., NV centers).
- Visualize structures and relaxation processes.
- Analyze results, including plotting formation energy diagrams, calculating chemical potentials, and defect level plotting.

## Features

- **Input File Generation**: Simplify the creation of SIESTA-compatible input files for defect calculations.
- **Visualization**: View atomic structures and visualize relaxation processes.
- **Data Analysis**: Generate formation energy diagrams, calculate chemical potentials, and analyze defect levels.

## Installation

To install Defectista, clone this repository and install the package using pip:

```bash
$ git clone https://github.com/yourusername/defectista.git
$ cd defectista
$ pip install .
```

## Usage

### Generating Input Files

```python
from defectista import input_generator

# Example usage
input_generator.create_input_file("defect_structure.xyz", "output.fdf")
```

### Visualization

```python
from defectista import visualization

# Visualize a structure
visualization.view_structure("relaxed_structure.xyz")
```

### Data Analysis

```python
from defectista import analysis

# Plot formation energy diagram
analysis.plot_formation_energy("results.csv")
```

## Requirements

- Python 3.8+
- Required libraries: (list dependencies here)
- SIESTA installed and configured

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments

Special thanks to the SIESTA community and all contributors to the field of defect calculations.
