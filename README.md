# Beyond the Family Tree: Historical Corridors Organize Lexical Borrowing Networks

## Analysis Code and Data

This repository contains the complete analysis pipeline for the paper *Beyond the Family Tree: Historical Corridors Organize Lexical Borrowing Networks*.

---

## Quick Start

```bash
# 1. Download data
chmod +x setup_data.sh
./setup_data.sh

# 2. Run analyses (Python 3.8+, standard library only)
python3 01_arabic_dna_extraction.py
python3 02_corridor_vs_family.py
python3 03_genealogical_control.py
python3 04_semantic_domains.py

# 3. Generate figures (requires matplotlib, seaborn)
pip install matplotlib seaborn
python3 05_generate_figures.py
```

## Overview

The code demonstrates that lexical borrowing patterns are better predicted by historical contact corridors (trade routes, religious networks, colonial paths) than by genealogical family-tree proximity, and that different corridors carry distinct semantic bundles through a structured network beneath the family tree.

## Data Sources

| Database | Languages | Content | Source |
|----------|-----------|---------|--------|
| WOLD | 41 | ~1,460 meanings, borrowing status, donor languages | https://github.com/lexibank/wold |
| Glottolog | 8,000+ | Language classification paths | https://github.com/glottolog/glottolog-cldf |

Both datasets are publicly available under open licenses (CC-BY). The `setup_data.sh` script clones them automatically.

## Scripts (Execution Order)

### Phase 1: DNA Fragment Extraction

| # | Script | Section | What it does |
|---|--------|---------|-------------|
| 01 | `01_arabic_dna_extraction.py` | §3–5 | Extracts all Arabic-origin borrowings from WOLD (1,670 fragments across 17 languages). Maps al- prefix distribution. Builds complete 41-language donor-recipient network. Detects stealth (intermediary) pathways. |

### Phase 2: Corridor vs Genealogy

| # | Script | Section | What it does |
|---|--------|---------|-------------|
| 02 | `02_corridor_vs_family.py` | §4.1 | Tests core hypothesis: corridor topology > family tree. Three-layer design: descriptive stats → Mann–Whitney U + Cliff's delta → 10,000-iteration corridor-label permutation test. |
| 03 | `03_genealogical_control.py` | §4.2–4.3 | Computes pairwise Glottolog tree distances, fits baseline regression (overlap ~ tree_distance), extracts residuals. Tests corridor enrichment in positive residuals. |

### Phase 3: Semantic Domain Analysis

| # | Script | Section | What it does |
|---|--------|---------|-------------|
| 04 | `04_semantic_domains.py` | §4.4–4.6 | Classifies WOLD semantic fields into 6 domains (Food, Religion, Climate, Body, Social, Material). Tests domain enrichment per corridor via chi-square. Identifies convergent borrowing patterns. |

### Figures

| # | Script | Figures | What it does |
|---|--------|---------|-------------|
| 05 | `05_generate_figures.py` | 1–6 | Generates all publication figures. Requires matplotlib and seaborn. |

## Key Results Summary

### Corridor vs Family Tree (§4.1)
- Same corridor (diff family): mean overlap = 124.9 (N = 51)
- Same family: mean overlap = 69.9 (N = 44)
- Neither: mean overlap = 18.5 (N = 725)
- Corridor/Family ratio: 1.79×
- Mann–Whitney: p = .002, Cliff's δ = 0.346 (medium)
- Corridor-label permutation: p < .0001 (10,000 iterations)

### Genealogical Control (§4.2–4.3)
- Tree distance R² = 0.0001
- Corridor pairs mean residual: +97.6; non-corridor: −8.5
- Top quartile enrichment: 80% corridor (expected 25%), 3.2× enrichment
- Residual permutation: p < .0001

### Semantic Domain Specificity (§4.4)
- Islamic Law corridor: RELIGION enriched 1.27×, χ² = 82.9, p < .001
- Mesoamerican corridor: FOOD enriched 1.33×, χ² = 74.4, p < .001
- Saharan Trade corridor: RELIGION enriched 1.27×, χ² = 48.5, p < .001
- Sinosphere: SOCIAL enriched 1.25×, χ² = 38.3, p < .001

### Arabic Convergent Borrowing (§4.5–4.6)
- 7-language convergence: "the world," "the time," all weekdays, "the demon," "the mosque"
- 190 meanings in 3+ languages, 108 in 4+, 51 in 5+, 20 in 6+, 7 in 7

## Historical Contact Corridors

| Corridor | Languages | Historical basis |
|----------|-----------|-----------------|
| Indian Ocean | Swahili, Malagasy, Indonesian, Seychelles Creole | Maritime trade network |
| Saharan Trade | Hausa, Kanuri, Tarifiyt Berber, Swahili | Trans-Saharan caravan routes |
| Islamic Law Sphere | Swahili, Hausa, Kanuri, Berber, Indonesian, Bezhta, Archi, Malagasy | Islamic legal-religious network |
| Mesoamerican Colonial | Yaqui, Otomi, Tzotzil, Q'eqchi', Imbabura Quechua | Spanish colonial administration |
| Sinosphere | Japanese, Vietnamese, White Hmong, Mandarin, Thai | Chinese cultural-writing sphere |
| European Core | English, Dutch, Romanian, Lower Sorbian, Selice Romani | European contact zone |
| Caucasus Local | Bezhta, Archi | Dagestanian lingua franca area |
| Port City Chain (SE Asia) | Indonesian, Ceq Wong, Thai, Vietnamese | SE Asian maritime trade |

## Dependencies

**Core analysis (Scripts 01–04):**
```
Python 3.8+
Standard library only (csv, math, collections, random)
No external packages required.
```

**Figure generation (Script 05):**
```
matplotlib
seaborn
numpy
```

## Reproducibility

All randomized procedures use 10,000 iterations with fixed random seeds (seed = 42). Results are fully deterministic and reproducible across platforms.

## License

Code: MIT License
Data: See respective data source licenses (WOLD: CC-BY-4.0; Glottolog: CC-BY-4.0)

## Citation

[To be added upon publication]
