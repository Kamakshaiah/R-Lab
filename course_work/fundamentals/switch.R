switch(1, 
      'one',
      'two',
      'three'
      )

x <- 1
switch (x,
  "1" = print('one'),
  "2" = print('two'),
  "3" = print('three'),
)

y <- 2
switch (x+y,
        "1" = print('one'),
        "2" = print('two'),
        "3" = print('three'),
)

switch('mean', 
       'mean' = print(mean(1:10)),
       'sd' = print(sd(1:10)),
       'max' = print(max(1:10)),
       'min' = print(min(1:10)),
       'median' = print(median(1:10))
)

option <- 'sd'
switch('sd', 
       'mean' = print(mean(1:10)),
       'sd' = print(sd(1:10)),
       'max' = print(max(1:10)),
       'min' = print(min(1:10)),
       'median' = print(median(1:10))
)

Summaries <- function(v, option = NA){
  out <- switch(option, 
         'mean' = print(mean(1:10)),
         'sd' = print(sd(1:10)),
         'max' = print(max(1:10)),
         'min' = print(min(1:10)),
         'median' = print(median(1:10))
          )

}

Summaries(1:10, 'mean')
Summaries(1:10, 'sd')
Summaries(1:10, 'max')
Summaries(1:10, 'min')
Summaries(1:10, 'median')