#My hackbio notes

# create variable
name <- "blessing"
x <- 3
print(name)
print(x)

paste0(name, " ", x)

#Data types - use class() to print the datatype

class(10.5) #numeric
class(3L) #integer
class(9i) #complex
class('JohnBull') #characters
class(TRUE)  #logicals or Booleans
class(FALSE) #logicals
class(T) #true - logicals

#Data Structure - Vectors and data frames
# we use the 'c' notation to define a vector

c() #null vector
c(2) #A vector of length 1
c(1, 2) #A vector of length 2 

#calculating the length of a vector
length( c(1, 2) ) #how to check the length of a vector - should return 2
length( c(1:400) )
c(1:400) # this prints the number 1 to 400

#MIXING VECTORS CONTENT
c(1, 2, '3') # this turns all the vectors to strings/character. 
c(1, 2, TRUE) #turns it to numeric
c(1, 2, TRUE, 'bee') #turns it to character

#characters > numeric > logical
#as powerful and beautiful as vectors are, theyre unable to house different data types
#all vectors must have the same datatype

#Naming Vectors
#c(10, 14.2, 3.5)
gene_expr <- c('A' = 10, 'B' = 14.2, 'c' = 3.5)
print(gene_expr)
class(gene_expr)

names(gene_expr) #names tells us what the dataset is refering to. its like naming your samples in real life laboratory

#Indexing Vectors
gene_expr[1] #returns the first item => 10.0
gene_expr[2] #returns the second item => 14.2
gene_expr[3] #returns the third item => 3.5
gene_expr[-2]

#gene_expr <- gene_expr[-2] #to overite our original dataset
#print(gene_expr)

#indexing with names
gene_expr['A']
gene_expr['c']

#returning an unnamed output
gene_expr[[1]] #returns only the value =>  10.0
gene_expr[[3]]
gene_expr[[ 'c' ]]

#dataframes
my_genes <- c('A', 'B', 'C')

sample_1 <- c(89, 323, 56)
sample_2 <- c(23, 242, 998)
sample_3 <- c(120, 23, 189)

gene_expr_df <- data.frame(my_genes, sample_1, sample_2, sample_3)
print(gene_expr_df)

#exploring our matrix
gene_expr_df$my_genes #this gives us the data inside my_genes column
gene_expr_df$sample_1 #this gives us data for sample_1 column
gene_expr_df$sample_2
gene_expr_df$sample_3

#selecting from rows
gene_expr_df[2,] #this gives us all the data on the second row, accros all samples and dataset
gene_expr_df[1,]
gene_expr_df[c(1,3),] #this returns only rows 1 and 3
gene_expr_df[c(1,3), 2] # this return rows 1 and 3 but only data/values in their 2nd column
gene_expr_df[c(1,3), 1:2]

fileOnline <- 'https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/bacteria.csv'

#read in the files
read.csv(fileOnline, header = T)

#read in the files specially
bacteria <- read.delim(fileOnline, header = T, sep =',' )

bacteria$C1
bacteria$species
bacteria$BSL

table(bacteria$BSL) # This will count how many times each unique value appears in the BSL column of your bacteria data frame, showing the distribution of biosafety levels in your dataset.

nrow(bacteria) # no of rows
ncol(bacteria) # no of columns
head(bacteria) # to look at the first 5 rows
tail(bacteria) # last five rows
dim(bacteria) # dimension - no of rows and column

#visualizing biosafety level

bsl_data <- table(bacteria$BSL)

plot(bsl_data)
barplot(bsl_data)

#LOOPS(for loop) - iteration
seq(1, 10) # generates number 1-10
(1: 10) #also generates number 1-10 
#but the advantage of seq is that is it has more flexibility and control takes it another parameter that an specify the incremental value
seq(1, 50, 2) #this count from 1-50 but increments by 2. ie odd numbers between 1-50
even_nums <- seq(0, 10, 2)
print(even_nums) #prints even numbers between 0 to 10

for (i in even_nums) {
  print(i)
}

#conditions
my_new_sequence <- c(seq(23, 87, 5), seq(2, 47, 3))
if(2 %in% my_new_sequence){
  print("YES")
}else{
  print("No")
}

#combining for loop and if statements
for (i in my_new_sequence) {
  if (i %% 2 == 0) {
    print(paste0(i , 'is an even number'))
  }else{
  print(paste0(i , 'is an odd number'))
  }
}


seq(0,1, 0.2)
seq(0,1, length.out=5)
seq(0,5, 1)

#Functions
#inbuilt fxns

c()
print()
sum(c(1,2,3))
mean(c(89, 2, 33, 45))

abs() #to get the absolute value of mathematical operations - eg you have -34 and you want just 34
cbind() #joining of columns
rbind() # joining of rows
matrix()
lm() #linear regression
install.packages() # to install packages

#custom functions
#lets calculate the GC content of a sequence -GC content is the percentage of G and C in a nucleotide sequence

geneA = 'GTCAAATGGAAAACCC'

length(geneA)
geneA <- strsplit(x= geneA, split = "") [[1]]
print(geneA)

gc_counter <- 0 #initialize with zero

for (nuc in geneA){ #for loop
  print(nuc)
  
  if (nuc == 'G' | nuc == 'C'){ #if statement
    gc_counter = gc_counter +1 #operation
  }
}
(gc_counter/ length(geneA) ) * 100



gc_calculator <- function(input_gene) {
  input_gene <- strsplit(x= input_gene, split = "") [[1]]
  
  gc_counter <- 0 #initialize with zero
  
  for (nuc in input_gene){ #for loop
    print(nuc)
    
    if (nuc == 'G' | nuc == 'C') { #if statement
      gc_counter = gc_counter +1 #operation
    }
  }
  return (gc_counter/ length(input_gene) ) * 100
}

myfinal_GC <- gc_calculator(geneA)
print(myfinal_GC)

#installing packages

install.packages("pheatmap")

#data visualization
# categorical plots: These are uses to represent the abundance of a specific category withing yoyr dataset.

isolation_origin_freq <- table(bacteria$Isolation.origin)
print(isolation_origin_freq)

barplot(height = isolation_origin_freq,
        width = c(1, 1, 1, 1),
        names.org = c('Animal', 'Blood' , 'Feces',  'Urine' ),
        legend = T,
        las = 2,
        ylim = c(8, 18),
        col = c(0:3),
        )

#pie chart
pie(isolation_origin_freq,
    col = c(0:3),
    radius = 1.01,
    clockwise = F,
    lty = 1)
    
#always decide what kind of plot would best represent your data
#multiple categories
multiple_cat <- table(bacteria$Phenotype, bacteria$Isolation.origin) #pie chart wont represent this correctly
barplot(height = multiple_cat,
        width = c(1, 1, 1, 1),
        names.org = c('Animal', 'Blood' , 'Feces',  'Urine' ),
        legend = T,
        las = 2,
        ylim = c(8, 18),
        col = c(3:2),
)
#Distribution plots
# Install from source (compiles on your machine)
install.packages("dplyr", type = "source")

library(ggplot2)
library(dplyr)

isolation_origin_df <- bacteria %>%
  count(Isolation.origin)
isolation_origin_df

ggplot(isolation_origin_df,
       aes(x= Isolation.origin, y= n))+
  geom_bar(stat="identity", fill="steelblue")+
  labs(
    x="Isolation Origin",
    y="Count",
    title="Frequency of Isolation Origins"
  )+
  theme_minimal()

#Pie chart: here, A bar plot is created first `coord_polar()` bends it into a circle
ggplot(isolation_origin_df,
       aes(x="", y= n, fill= Isolation.origin))+
  geom_bar(stat="identity", width=1)+
  coord_polar("y")+
  theme_void()+
  labs(title="Isolation Origin Distribution")

#Multiple categories Phenotype × Isolation origin (stacked bar plot)
multiple_cat_df<- bacteria%>%
  count(Phenotype, Isolation.origin)
multiple_cat_df

ggplot(multiple_cat_df,
       aes(x= Isolation.origin, y= n, fill= Phenotype))+
  geom_bar(stat="identity")+
  labs(
    x="Isolation Origin",
    y="Count",
    title="Phenotype by Isolation Origin"
  )+
  theme_minimal()

#Box plots
boxplot(x= bacteria$carb_fit,
        notch = T,
        ylim = c(0, 1.5),
        main = 'My First Boxplot',
        ylab = 'Fitness',
        xlab = 'carbenicillin',
        col= 3)

#Density plots
plot(density(x = bacteria$carb_fit))

#scatter plots numerical- continuous 
plot(C1~C2, data = bacteria)
plot(x = bacteria$C1,
     y = bacteria$C2,
     xlab = 'PC1',
     ylab = 'PC2',
     xlim = c(0, 10),
     ylim = c(0, 10),
     las = 1,
     main = 'PC Plot',
     col = as.factor(bacteria$labels),
     pch = 16,
     cex = 0.8)

#Heat maps 
library(pheatmap)
colnames(bacteria[, 8:13])
pheatmap(mat = bacteria[, 8:13],
         border_color = 'black',
         legend = T,
         labels_row = bacteria$sample_id,
         fontsize_row = 6,
         cluster_cols = T,
         cluster_rows = T)
