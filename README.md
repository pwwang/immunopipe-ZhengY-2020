# immunopipe-ZhengY-2020

Reanalysis of the scRNA-seq and scTCR-seq data from [Zheng, Y., et al. 2020](https://www.nature.com/articles/s41467-020-20019-0) using [immunopipe](https://github.com/pwwang/immunopipe).

> [Zheng, Y., Chen, Z., Han, Y., Han, L., Zou, X., Zhou, B., Hu, R., Hao, J., Bai, S., Xiao, H., Li, W. V., Bueker, A., Ma, Y., Xie, G., Yang, J., Chen, S., Li, H., Cao, J., & Shen, L. (2020). Immune suppressive landscape in the human esophageal squamous cell carcinoma microenvironment. Nature Communications, 11(1), 1-17.](https://www.nature.com/articles/s41467-020-20019-0)

## Data preparation

The data was downloaded from [GSE145370](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE145370), where 14 samples from 7 patients were sequenced with scRNA-seq and scTCR-seq.

See `prepare-data.sh` for details.

## Configuration

> [!NOTE]
> This is not a replication of the original paper, primarily due to the irreproducibility of the clustering results. This is a reanalysis of the data using [`immunopipe`](https://github.com/pwwang/immunopipe), showing the potential of the pipeline similar analyses listed in the paper.
>

The configuration in `SeuratClusterStats` section was setup based on Fig 2. The clononality analysis was performed by `Immunarch` by default.

See details at `Immunopipe.config.toml`.

## Results/Reports

You can find the results in the `Immunopipe-output` directory.

The report can be found at [https://imp-zhengy-2020.pwwang.com/REPORTS](https://imp-zhengy-2020.pwwang.com/REPORTS).
