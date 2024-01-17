#!/usr/bin/env bash

# The URL to the tar file
DATAURL="https://ftp.ncbi.nlm.nih.gov/geo/series/GSE145nnn/GSE145370/suppl/GSE145370_RAW.tar"
DATAFILE="prepared-data/GSE145370.tar"

echo "- Make the directory for prepared data ..."
mkdir -p prepared-data

echo "- Download the data if needed ..."
if [ ! -e $DATAFILE ]; then
    wget -O $DATAFILE $DATAURL
fi

echo "- Extract the data ..."
tar -xvf $DATAFILE --directory=./prepared-data

echo "- Separate desired samples ..."
for sample in $(ls -1b prepared-data/GSM*.*.gz | xargs -n 1 basename | cut -d_ -f2 | sort -u); do
    echo "  - $sample ..."
    mkdir -p prepared-data/"$sample"
    rnafile=$(ls -1b prepared-data/GSM*_"${sample}"_filtered_feature_bc_matrix.tar.gz)
    tar -zxf "$rnafile" -C prepared-data/"$sample" --strip-components=1
    tcrfile=$(ls -1b prepared-data/GSM*_"${sample}"_filtered_contig_annotations.csv.gz)
    mv "$tcrfile" prepared-data/"$sample"/
done

echo "- Remove unnecessary files ..."
rm -rf prepared-data/*.gz

echo "- Done!"
