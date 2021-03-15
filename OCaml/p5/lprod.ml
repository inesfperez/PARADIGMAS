(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 5 *)

let prod a l = 
	let rec aux listIn listOut = match listIn with
		  [] -> listOut
		| (h::t) -> aux t ((a,h)::listOut)
	in aux l [];;

let lprod al bl = 
	let rec aux l1 l2 out = match l1 with
		  [] -> List.rev out
		| (h::t) -> aux t l2 (List.rev_append (List.rev(prod h l2)) out)
	in aux al bl [];;

