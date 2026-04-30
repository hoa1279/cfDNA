#Required packages
# ==========================================
# 1. Initialize Project Library with renv
# ==========================================

# Install renv if not already installed
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

# Initialize renv (only the first time)
if (!file.exists("renv.lock")) {
  renv::init()
} else {
  renv::restore()
}

# ==========================================
# 2. Install Common Packages
# ==========================================
# Install required packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Core packages
pkgs <- c(
  # Functional enrichment & annotation
  "clusterProfiler",  # GO/KEGG enrichment analysis
  "org.Hs.eg.db",     # human gene annotation database
  "enrichplot",       # visualization for enrichment results
  "ReactomePA",       # pathway analysis (Reactome)
  "AnnotationDbi",    # interface to annotation databases
  # "BSgenome.Hsapiens.UCSC.hg38",                  # full human genome sequence (hg38 build)
  # "IlluminaHumanMethylation450kanno.ilmn12.hg19",  # CpG probe annotation for 450K methylation array (hg19)
  
  # Genomic data structures
  "GenomicRanges",    # genomic interval operations
  "IRanges",          # range-based data structures
  
  # # DNA methylation analysis
  # "methylKit",        # methylation analysis (bisulfite seq)
  # "bsseq",            # bisulfite sequencing data analysis
  # "minfi",            # Illumina methylation array analysis
  # 
  # Data access
  #"GEOquery",          # download data from GEO
  
  # Visualization
  "ComplexHeatmap"

)

for (p in pkgs) if (!requireNamespace(p, quietly=TRUE)) BiocManager::install(p)

##Addition common packages
add_packages <- c(
  # Data manipulation & import
  "tidyverse",     # data science toolkit
  "data.table",    # fast data wrangling
  "readr",         # fast file reading
  "reshape2",      # reshape data (legacy)
  "tidyr",
  
  # Visualization
  "ggplot2",       # plotting system
  "ggpubr",        # publication plots
  "ggrepel",       # non-overlapping labels
  "scales",        # axis/label formatting
  "RColorBrewer",  # color palettes
  "patchwork",  # combine multiple ggplots easily
  "ggsignif",   # add significance brackets to plots
  "ggVennDiagram", # Venn diagrams
  "corrplot",      # correlation plots
 # "VennDiagram",     # Venn diagrams
 "ggridges,"
  
  # Heatmaps & clustering
  "pheatmap",      # static heatmaps
  "heatmaply",     # interactive heatmaps
  "dendextend",    # dendrogram tools
  
  # Statistics & math
  "nnls",          # non-negative LS
  "quadprog",      # quadratic optimization
  
  # Utilities
  "argparse"     # CLI arguments
)
for (pkg in add_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
}



##Save the current packages' versions
renv::snapshot()

