sim.num.data <- function(type = getOption("univariate", "bivariate", "multivariate"), N, m, n){
  
  # define number of rows and columns
  
  data.points = as.numeric(N)
  rows = as.numeric(m)
  columns = as.numeric(n)
  
  # take the option from
  
  data.type = type
  
  # make the data set
  
  switch(data.type, 
         
         univariate ={x <- abs(round(rnorm(m)*10, 0))
         }, 
         bivariate ={x <- matrix(round(rnorm(N)*10, 0), m, 2); x <- abs(x)
                                     }, 
         multivariate ={x <- matrix(round(rnorm(N)*10, 0), m, n); x <- abs(x)
                                        }, 
                  stop("Please check your options")
         )
         
         return(x)
}