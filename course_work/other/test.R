my.fun <- function(x){
	return(sum(x)/length(x))
	}

# my.fun(1:10)


UIinput <- function(){

	x <- readline(prompt = "Enter x1 value: ")
	x <- as.numeric(x)

	if(is.na(x)){
		stop("The input is invalid!")
	}
	
	return(x)

}

UIinput()