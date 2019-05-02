# Simpsons Intergration Function
This function intergrates a set of equally spaced x values for there output values.
#### Inputs
(x values, y values) 
x values have to be an equally spaced array.
y values is the outputs of the x values for a function or tabulated data. 
#### Outputs 
I- The estimated intergral over the x array
#### Restrictions
The x array must be equally spaced or the function will not run. The x and y arrays must be of the same length as well or it will not run.

The function will still run if the x and y lengths are odd and not even, but the last interval on x and y will be estimated using a trapz function
The function will warn you if this happens. This is because the Simpson's method requires and equal amount of array points. 
