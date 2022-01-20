import argparse
import numpy as np
import pandas as pd
import os
import argparse

def createCombinedHeaders(path):
	df = pd.read_csv(path, sep="\t", header=[0,1])
	df.columns = [x[0]+'_'+x[1].replace(' ', '_') for x in df.columns]
	return df

def processAllSubdirFiles(inputPath, outputPath, ext =".dat"):
	for subdir, dirs, files in os.walk(inputPath):
		for file in files:
			if file.endswith(ext):
				print(file)
				df = createCombinedHeaders(os.path.join(subdir, file))
				if not os.path.isdir(os.path.join(outputPath, subdir)):
					os.makedirs(os.path.join(outputPath, subdir))
				df.to_csv(os.path.join(os.path.join(outputPath, subdir), file), sep="\t", index=False)

if __name__ == '__main__':
	argparser = argparse.ArgumentParser(description='Combine rows in a table.')
	argparser.add_argument('-i', '--input', help='Input directory', required=True)
	argparser.add_argument('-o', '--outdir', help='Output directory', required=True)
	args = argparser.parse_args()
	processAllSubdirFiles(args.input, args.outdir)
	print("Done!")