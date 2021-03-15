(* INES FARO PEREZ - GRUPO 1.2 *)
(* PRACTICA 3: *)

(* EJERCICIO 1: *)

let f = function x -> function y -> function z -> 
		if z>y then
			x<>y 
		else 
			(z/(x-y)>y);;

false && (2 / 0 > 0);;
(* bool = false *)

true && (2 / 0 > 0);;
(* Exception: division by zero *)

true || (2 / 0 > 0);;
(* bool = true *)

false || (2 / 0 > 0);;
(* Exception: division by zero *)

let con = (&&);;
(* val con: bool -> bool -> bool = <fun> *)

let dis = (||);;
(* val: bool -> bool -> bool = <fun> *)

(&&) (1 < 0) (2 / 0 > 0);;
(* bool = false *)

con (1 < 0) (2 / 0 > 0);;
(* Exception: division by zero *)

(||) (1 > 0) (2 / 0 > 0);;
(* Exception: division by zero *)

dis (1 > 0) (2 / 0 > 0);;
(* Exception: division by zero *)


(* EJERCICIO 2: *)
(* Definicion de la funcion carry *)
let curry = function f -> (function a -> function  b -> f (a,b));;
(* val curry : ('a * 'b -> 'c) -> 'a -> 'b -> 'c = <fun> *)

(* Definicion de la funcion uncurry *)
let uncurry = function g -> (function (a,b) -> g a b);;
(* val uncurry : ('a -> 'b -> 'c) -> 'a * 'b -> 'c = <fun> *)


uncurry (+);;
(* int*int -> int = <fun> *)

let sum = (uncurry (+));;
(* val sum: int*int -> int = <fun> *)

(*sum 1;;*)
(* Error: This expression has type int but an expression was expected of type int*int *)
(*Podríamos poner: *) sum (1,1);; (* int = 2 *)

sum (2,1);;
(* int = 3 *)

let g = curry (function p -> 2 * fst p + 3 * snd p);;
(* val g: int -> int -> int = <fun> *)

(*g (2,5);;*)
(* Error: This expression has type 'a * 'b but an expression was expected of type int *)
(* Podría ser: *) g 2;; (* int -> int = <fun> *)

let h = g 2;;
(* val h: int -> int = <fun> *)

(*h 1, h 2, h 3;;*)
(* Error: unbound value h1 *)

(* EJERCICIO 3: *)
let comp a b c = a(b(c));;
let f2 = let square x = x * x in comp square ((+) 1);;
(* val f2: int -> int = <fun> *)

f2 1, f2 2, f2 3;;
(* int* int * int = (4, 9, 16) *)

