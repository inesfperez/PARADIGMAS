(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 1 *)

();;
(* () *)

2 + 5 * 3;;
(* int = 17 *)

1.0;;
(* float = 1.0 *)

(*1.0 * 2;;*)
(* Error de tipado, ints y floats mezclados *)

1 * 2;;
(* int = 20 *)

(*2 - 2.0;;*)
(* Error de tipado, ints y floats mezclados *)

2 - 2;;
(* int = 0 *)

(*3.0 + 2.0;;*)
(* Error de tipado, no se usa el operador float *)

3.0 +. 2.0;;
(* float = 5.0 *)

5/3;;
(* int = 1 *)

5 mod 3;;
(* int = 2 *)

3.0 *. 2.0 ** 3.0;;
(* float = 24 *)

3.0 = float_of_int 3;;
(* bool = true *)

(*sqrt 4;;*)
(* Error de tipado, se requiere float *)

sqrt 4.0;;
(* float = 2.0 *)

int_of_float 2.1 + int_of_float (-2.9);;
(* int = 0 *)

truncate 2.1 + truncate (-2.9);;
(* int = 0 *)

floor 2.1 +. floor (-2.9);;
(* float = -1. *)

(*ceil 2.1 +. ceil -2.9;;*)
(* Error de tipado, faltan los parentesis *)

ceil 2.1 +. ceil (-2.9);;
(* float = 1 *)

'B';;
(* char = 'B' *)


int_of_char 'A';;
(* int = 65 *)


char_of_int 66;;
(* char 'B' *)


Char.code 'B';;
(* int = 66 *)


Char.chr 67;;
(* char = 'C' *)


'\067';;
(* char = 'C' *)


(* Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'Ñ') ;; *)
(* Error de sintaxis por la ñ *)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'C');;
(* char = 'c' *)


(*Char.uppercase 'ñ';;*)
(* Error de sintaxis por la ñ *)

Char.uppercase 'c';;
(* char = 'C' *)


Char.lowercase 'O';;
(* char = 'o' *)


"this is a string";;
(* string = "this is a string" *)


String.length "longitud";;
(* int = 8 *)


(*"1999" + "1";;*)
(* Error de tipado, no se pueden sumar strings *)


"1999" ^ "1";;
(* string = 19991 *)


int_of_string "1999" + 1;;
(* int = 2000 *)


"\064\065";;
(* string = "@A"*)


string_of_int 010;;
(* string = "10" *)


not true;;
(* bool = false *)


true && false;;
(* bool = false *)


true || false;;
(* bool = true *)


(1 < 2) = false;;
(* bool = false *)


"1" < "2";;
(* bool = true *)


2 < 12;;
(* bool = true *)


"2" < "12";;
(* bool = true *)


"uno" < "dos";;
(* bool = false *)


2,5;;
(* int * int = (2,5) *)


"hola","adios";;
(* string * string = ("hola","adios") *)


0, 0.0;;
(* int * float = (0, 0.) *)


fst ('a', 0);;
(*  *)


snd (false, true);;
(* char = 'a' *)


(1,2,3);;
(* int * int * int = (1,2,3) *)


(1,2),3;;
(* (int * int) * int = ((1,2),3) *)


fst ((1,2),3);;
(* int * int = (1,2) *)


if 2 = 4 then 0 else 4;;
(* int = 4 *)


if 3 = 4 then "0" else "4";;
(* string = "4" *)


(*if 3 = 4 then 0 else "4";;*)
(* Error de tipado por devolver tipos distintos *)


(if 3 < 5 then 8 else 10) + 4;;
(* int = 12 *)


let pi = 2.0 *. asin 1.0;;
(* float = 3.141516.... *)


sin (pi /. 2.);;
(* float = 1. *)



