// Generated by SolidPython 1.1.3 on 2022-07-09 18:21:30


intersection() {
	difference() {
		linear_extrude(height = 14) {
			import(file = "mera_v02_14_best.svg", origin = [0, 0]);
		}
		union() {
			translate(v = [0, 0, 6]) {
				linear_extrude(height = 9) {
					import(file = "mera_v02_10_best.svg", origin = [0, 0]);
				}
			}
			translate(v = [0, 0, -1]) {
				linear_extrude(height = 4) {
					import(file = "mera_v02_10_best.svg", origin = [0, 0]);
				}
			}
		}
	}
	translate(v = [30, 250, 0]) {
		cube(size = [210, 210, 20]);
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 22 16:31:46 2022

@author: pchaillo

"""
import os
import solid as sp
import math as math


stl_name = "figure_split_auto"
scad_name = "figure_split_auto"
# scad_name_trans = scad_name + "trans"

taille_fig_x = 400 # taille de la figure à imprimer
taille_fig_y = 450

taille_plat_x = 210 # en mm
taille_plat_y = 210

trans_e = 20 # taille de la transition

off_x = 30 # offset pour le placement du premier plateau 
off_y = 40

path = os.path.dirname(os.path.abspath(__file__))
path_stl_raw = path + '/STL/' + stl_name
path_scad_raw = path + '/SCAD_CODE/' + scad_name

contour = sp.linear_extrude(14)(sp.import_stl("mera_v02_14_best.svg"))
contour_plat = sp.linear_extrude(2)(sp.import_stl("mera_v02_10_best.svg"))
coeur_down = sp.translate([0,0,-1])(sp.linear_extrude(4)(sp.import_stl("mera_v02_10_best.svg")))
coeur_up = sp.translate([0,0,6])(sp.linear_extrude(9)(sp.import_stl("mera_v02_10_best.svg")))
coeur = sp.union()(coeur_up,coeur_down)

piece = sp.difference()(contour,coeur)

plateau = sp.cube([taille_plat_x,taille_plat_y,20])

bordure_ext = sp.translate([-trans_e/2,-trans_e/2,-2])(sp.cube([taille_plat_x+trans_e,taille_plat_y+trans_e,20]))
bordure_int = sp.translate([trans_e/2,trans_e/2,-4])(sp.cube([taille_plat_x-trans_e,taille_plat_y-trans_e,20+6]))
bordure = sp.difference()(bordure_ext,bordure_int)

nb_p_x = math.ceil((taille_fig_x-off_x)/taille_plat_x) # nombre de décalages en x nécessaires
nb_p_y = math.ceil((taille_fig_y-off_y)/taille_plat_y) # nombre de décalages en x nécessaires

ind = 0
for x in range(nb_p_x) : 
	for y in range(nb_p_y):
		ind += 1
		carre = sp.translate([off_x+taille_plat_x*x ,off_y+taille_plat_y*y,0])(plateau)
		to_print = sp.intersection()(piece,carre)
		path_scad = path_scad_raw + "_0" + str(ind) + ".scad"
		sp.scad_render_to_file(to_print, path_scad)

		bord_dec = sp.translate([off_x+taille_plat_x*x ,off_y+taille_plat_y*y,0])(bordure)
		to_print_trans = sp.intersection()(contour_plat,bord_dec)
		path_scad = path_scad_raw + "_trans" + str(ind) + ".scad"
		sp.scad_render_to_file(to_print_trans, path_scad)

# carre = sp.translate([off_x,off_y,0])(plateau);
# to_print = sp.intersection()(piece,carre)
# sp.scad_render_to_file(to_print, path_scad)

# command = 'openscad -o ' + path_stl + ' ' + path_scad
# os.system(command) 
 
 
************************************************/
