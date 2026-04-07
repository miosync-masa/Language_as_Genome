#!/usr/bin/env bash
# SEED: Beyond the Family Tree — Data Setup
# Downloads required datasets for reproducing all analyses.
#
# Usage:
#   chmod +x setup_data.sh
#   ./setup_data.sh

set -e

echo "=== SEED: Data Setup ==="
echo ""

# WOLD (World Loanword Database)
if [ -d "wold" ]; then
    echo "[SKIP] wold/ already exists"
else
    echo "[CLONE] World Loanword Database (lexibank/wold)..."
    git clone --depth 1 https://github.com/lexibank/wold.git
fi

# Glottolog CLDF
if [ -d "glottolog-cldf" ]; then
    echo "[SKIP] glottolog-cldf/ already exists"
else
    echo "[CLONE] Glottolog CLDF (glottolog/glottolog-cldf)..."
    git clone --depth 1 https://github.com/glottolog/glottolog-cldf.git
fi

echo ""
echo "=== Data setup complete ==="
echo ""
echo "Data sources:"
echo "  wold/             World Loanword Database (Haspelmath & Tadmor 2009)"
echo "  glottolog-cldf/   Glottolog language classifications (Hammarstrom et al. 2023)"
echo ""
echo "To run the analysis pipeline:"
echo "  python3 01_arabic_dna_extraction.py"
echo "  python3 02_corridor_vs_family.py"
echo "  python3 03_genealogical_control.py"
echo "  python3 04_semantic_domains.py"
echo "  python3 05_generate_figures.py    # requires matplotlib, seaborn"
