(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 5 *)

let rec hanoi (x,y,z) n =
	if n=1 then [(x,z)]
	else (hanoi (x,z,y) (n-1))@(x,z)::(hanoi (y,x,z)(n-1));;


