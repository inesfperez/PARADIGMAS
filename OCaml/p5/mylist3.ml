(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 5 *)

(* =====AUXILIARES=====================*)
let rev lista = 
	let rec aux l1 l2 = match l1 with
		| [] -> l2
		| (h::t) -> aux t (h::l2)
	in aux lista [];;

let rec rev_append l1 l2 = match l1 with
	| [] -> l2
	| (h::t) -> rev_append t (h::l2);;

(* ====================================*)

let init len f = 
	if len < 0 then raise (Invalid_argument "len")
	else
		let rec aux i lista = match i with
			  _ when i < 0 -> lista
			| _ -> aux (i-1) ((f i)::lista)
		in aux (len-1) [];;

(* ====================================*)

let suml =
	let rec aux sum lista = match lista with
		  [] -> sum
		| (h::t) -> aux (sum + h) t
	in aux 0;;

(* ====================================*)

let maxl l = match l with 
	  [] -> raise (Failure "maxl")
	| (cabeza::cola) ->
	let rec aux mayor = function
		  [] -> mayor
		| (h::t) -> aux (max mayor h) t
	in aux cabeza l;;

(* ====================================*)

let fromto m n = 
	let rec aux i l =
		if i < m then l
		else aux (i-1) (i::l)
	in aux n [];;
	
(* ====================================*)

let to0from n = rev (fromto 0 n);;
	
(* ====================================*)

let from1to n = fromto 1 n;;

(* ====================================*)

let append la lb = rev_append (rev la) lb;;

(* ====================================*)

let concat lista =
	let rec aux lin lout = match lin with
		  [] -> rev lout
		| (h::t) -> aux t (rev_append h lout)
	in aux lista [];;

(* ====================================*)

let map f l = 
	let rec aux l1 l2 = match l1 with
		| [] -> rev l2
		|(h::t) -> aux t ((f h)::l2)
	in aux l [];;
	
(* ====================================*)

let power x y = 
	let rec aux i ans = 
		if i = y then ans
		else aux (i+1) (ans*x)
	in if y = 0 then 1 else
		if y > 0 then aux 1 x
		else raise (Invalid_argument "power");;

(* ====================================*)

let fib n =
	let rec aux i ans ans2 = 
		if i = n then ans
		else aux (i+1) (ans+ans2) ans
	in if n >= 0 then aux 0 1 0
	else raise (Invalid_argument "fib");;
	
(* ====================================*)

let fact num = 
	let n = float_of_int num in
	let rec aux i ans = 
		if i = 0. then ans
		else aux (i-.1.) (ans *. i)
	in if n = 0. then 0. else
		if n > 0. then aux (n-.1.) n
		else raise (Invalid_argument "fact");;
	
(* ====================================*)

let incseg l = 
	let rec aux suma lin lout = match lin with
		  [] -> rev lout
		| (h::t) -> aux (h+suma) t ((h+suma)::lout)
	in aux 0 l [];;

(* ====================================*)

let multicomp l x = 
	let rec aux resul lista = match lista with
		  [] -> resul
		| (f::t) -> aux (f resul) t
	in aux x l;; 
	
(* ====================================*)

let insert x l = rev (x::(rev l));;

(* ====================================*)

let insert_gen f x l = 
	let rec aux lin lout = match lin with
		  [] -> lout
		| (h::t) -> 
		if f x h then rev_append lout (x::lin)
		else aux t (h::lout)
	in aux l [];;






