README – Korneisel_TetNecks_2026
	This is the README file for the GitHub Repository Korneisel_TetNecks_2026 associated with the paper titled: Early tetrapod neck mobility modeled from an extant analogue (currently Nature manuscript 2025-12-33097).

Files in this Repository
	AverageOutput.xlsx
	DeflectionCalculations.xlsx
	MaterialsTable.xlsx
	SturgeonBending_2026.csv
	SturgeonDataPlottingCode
	SturgeonTorsion_2026.csv
	SummaryStats.csv
	TaxaForMobilityEstimates.xlsx

File Description
	AverageOutput.xlsx: Average material properties sorted by position and dissection condition
	DeflectionCalculations.xlsx: deflection calculations based on material properties from AverageOutput.xlsx
	MaterialsTable.xlsx: measurements of tested specimens
	SturgeonBending_2026.csv: combined measurement and material testing data for bending
	SturgeonDataPlottingCode.rmb: R code used for mechanical analysis and plotting
	SturgeonTorsion_2026.csv: combined measurement and material testing data for torsion
	SummaryStats.csv: Summary statistics of material data generated in r-code
	TaxaForMobilityEstimates.xlsx: Mobility data estimates for different taxa using material properties described by sturgeon data

How to Run the Code
	NOTE that the script reads in several of the data files in this folder. For ease of sharing, no working directories are set in the code. That said, the code should run normally if the repository is downloaded in full and everything remains in the same folder.
	1)	Download and install the most recent version of R and R-Studio: https://posit.co/download/rstudio-desktop/
	2)	Download or sync this entire repository (Korneisel_TetNecks_2026) to your machine by clicking the “Code” dropdown menu and selecting the option that works best for your setup (either “Open with GitHub Desktop” or “Download ZIP”)
	3)	If you download the file as a ZIP file, unzip the file on your machine. This step is necessary if you download the repository as a zip file from GitHub, but not if you sync the repository using Git or GitHub Desktop
	4)	Open the StirgeonDataPlottingCode.rmb in R-Studio
	5)	Install the necessary libraries (first chunk of the code)
	6)	Once libraries are installed, code should run easily.
