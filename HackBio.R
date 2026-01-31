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
