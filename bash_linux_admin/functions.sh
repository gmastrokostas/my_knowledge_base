#CALL A FUNCTION AND PASS THE VALUE OF IT TO ANOTHER FUNCTION

var1=1
var2=2

function example_1()
{
	total=$((var1+var2))
}

example_1 total

function example_2()
{
	echo I am from example_2 $total
}
example_2
