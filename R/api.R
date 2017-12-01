de <- function(g, c, r, d) {
        countData <- as.data.frame(t(d) )
        countData <- cbind(unlist(r), countData)
        colnames(countData) <- c('gene', unlist(c))

        colData <- data.frame(c, g)
        colnames(colData) <- c('id','group')

        dds <- DESeq2::DESeqDataSetFromMatrix(countData=countData, colData=colData, design=~group, tidy=TRUE)
        dds <- DESeq2::DESeq(dds)
        result <- DESeq2::results(dds, tidy=TRUE)

        print(result)
}