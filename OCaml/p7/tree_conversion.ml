(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 7 *)

open St_tree;;
open Bin_tree;;
open St_tree_plus;;

let rec bin_tree_of_st_tree a =
	if St_tree_plus.is_single a then Bin_tree.comp (St_tree.root a) (Bin_tree.empty, Bin_tree.empty)
	else let (i,d) = 
		St_tree.branches a  
		in Bin_tree.comp (St_tree.root a) (bin_tree_of_st_tree i, bin_tree_of_st_tree d);;


let rec st_tree_of_bin_tree a =
	if (is_empty a) then raise (Invalid_argument "st_tree_of_bin_tree")
	else let (i,d) = Bin_tree.branches a in
		if ((Bin_tree.is_empty i) && (Bin_tree.is_empty d)) then St_tree.single (Bin_tree.root a)
		else St_tree.comp (Bin_tree.root a) ((st_tree_of_bin_tree i),(st_tree_of_bin_tree d));;

