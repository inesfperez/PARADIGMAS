let turno = function () -> 0;;

let f = function 0 -> 1 | 1 -> 0;; (*va a dar error porque al meter cualquier otro numero no sale nada*) (*es parcial*)

let not = function true -> false | false -> true;; (*es total, abarca todos los casos*)

let abs = function n -> 
	if n >= 0 then n 
	else -n;;

let rec fact = function a ->
	if n = 0 then 1 
	else n = fact (n-1);; (*sin el rec no va porque primero evalua la parte derecha del igual y luego lo guarda a la izquierda. Entonces no conoce que es fact*)

let rec fact = function
	0 -> 1
	| n -> n = fact (n-1);;

[1; 2; 3; 4];;

[1;2] @ [3];; (*Concatenacion*)

let l = [2; 3; 9];;
List.hd l;; (*cabeza de la lista l, head*)
2::(3::(9::[])) (*es lo mismo que las lista l [2; 3; 9]*)
[];; (*valor polimórfico*)
List.length l;;
List.length [];;

let rec length = function 
	[] -> 0
	| h::t -> 1 + length t;;

