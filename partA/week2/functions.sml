
fun pow(x:int, y:int) = 
  if y = 0
  then 1
  else x * pow(x, y-1)

fun cube(x:int) =
  pow(x,3)



val test = cube 4;

val test2 = pow(2, 10 );


val test3 = pow(2, cube 3)
