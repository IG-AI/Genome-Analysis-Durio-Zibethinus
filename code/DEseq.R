library("BiocManager")
library("DESeq2")
library("BiocParallel")
library("vsn")
library("pheatmap")
library("RColorBrewer")
library("ggplot2")

register(MulticoreParam(12))

dir <- "~/Genome-Analysis/data/differential_expression/count"

sampleFiles <- grep("count",list.files(dir),value=TRUE) 
sampleCondition <-c("Musang", "Musang", "Musang", "Musang", "Musang", "Monthong", "Monthong", "Monthong")
sampleName <- c("Durio zibethinus Musang King: leaf", "Durio zibethinus Musang King: root", "Durio zibethinus Musang King: aril 2", "Durio zibethinus Musang King: stem", "Durio zibethinus Musang King: aril 3", "Durio zibethinus Monthong: aril 2", "Durio zibethinus Monthong: aril 3", "Durio zibethinus Monthong: aril 1")
sampleName <- c("leaf", "root", "aril 2", "stem", "aril 3", "aril 2", "aril 3", "aril 1")

sampleTable <- data.frame(sampleName = sampleName,
                          fileName = sampleFiles,
                          condition = sampleCondition,
                          type = sampleType)

sampleTable$condition <- factor(sampleTable$condition)

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = dir,
                                       design= ~ condition)

keep <- rowSums(counts(ddsHTSeq)) >= 10
ddsHTSeq <- ddsHTSeq[keep,]
dds <- DESeq(ddsHTSeq)
res <- results(dds)

plotMA(res, ylim=c(-10,10))

ntd <- normTransform(dds)

meanSdPlot(assay(ntd))

select <- order(rowMeans(counts(dds,normalized=TRUE)),
                decreasing=TRUE)[1:20]
df <- as.data.frame(colData(dds)[,c("condition", "type")])
pheatmap(assay(ntd)[select,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=df)

vsd <- vst(dds, blind=FALSE)
rld <- rlog(dds, blind=FALSE)
sampleDists <- dist(t(assay(vsd)))

sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(vsd$condition, vsd$type, sep="-")
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)

plotPCA(vsd, intgroup=c("condition", "type"))

pcaData <- plotPCA(vsd, intgroup=c("condition", "type"), returnData=TRUE)
percentVar <- round(100 * attr(pcaData, "percentVar"))
ggplot(pcaData, aes(PC1, PC2, color=condition, shape=type)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
  coord_fixed()