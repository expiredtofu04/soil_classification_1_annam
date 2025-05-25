#!/bin/bash

# download.sh - Script to download the soil classification dataset from Kaggle

# Check if kaggle is installed
if ! command -v kaggle &> /dev/null
then
    echo "The kaggle CLI is not installed. Please install it with: pip install kaggle"
    exit
fi

# Check for Kaggle API credentials
if [ ! -f ~/.kaggle/kaggle.json ]; then
    echo "Kaggle API credentials not found. Place kaggle.json in ~/.kaggle/ and set permissions."
    exit
fi

# Make sure proper permissions are set
chmod 600 ~/.kaggle/kaggle.json

# Set dataset name - change this to the actual dataset slug if needed
DATASET="soil-classification/soil_classification-2025"

# Create directory for download
mkdir -p soil_classification-2025
cd soil_classification-2025 || exit

# Download and unzip dataset
kaggle datasets download -d $DATASET
unzip -q *.zip
rm *.zip

echo "Dataset downloaded and extracted to $(pwd)"
