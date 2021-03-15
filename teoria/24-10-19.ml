let rec insert x = function [] -> x 
	| n::t -> if h <= x then
		h::(insert x t)
	else x::h::t;;

let rec isort = function
	[] -> []
	| n::t -> insert h (isort t);;

(* no terminal: *)
let rec rlist n = if n<1 then []
				else random.int r::rlist r(n-1);;

(* terminal: *)
let rlist rn = let rec auz l i = 
		if i > n then l 
		else aux (random.int r::t)(i+1)
		in aux [] 1;;

let rlist r n = init n(fun_ -> random.int r);; 