# structural equation modeling in R
#-----------------------------------
# not working

sim.con <- function(n, m, p = as.character.condition("cont", "cate")){
 
  # type specification
  n = as.integer(n)
  m = as.integer(m)
  p = as.character(p)
  
  # matrix calculation
  if(p = "cont") sim.con <- matrix(rnorm(n*m), m, n) else 
         sim.con <- matrix(sample(1:2, 20, replace = TRUE), m, n)
}

# working 

sim.cont <- function(n, m, o, p){
  switch(o, 
         sim.cont <- matrix(rnorm(n*m), m, n),
         sim.cont <- matrix(sample(1:p, n*m, replace = TRUE), m, n)
         )
  return(sim.cont)
    }