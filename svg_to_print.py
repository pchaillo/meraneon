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

taille_fig_x = 400
taille_fig_y = 450

taille_plat_x = 210 # en mm
taille_plat_y = 210

off_x = 30 # offset pour le placement du premier plateau 
off_y = 40

path = os.path.dirname(os.path.abspath(__file__))
path_stl_raw = path + '/STL/' + stl_name
path_scad_raw = path + '/SCAD_CODE/' + scad_name

contour = sp.linear_extrude(14)(sp.import_stl("mera_v02_14_best.svg"))
coeur_down = sp.translate([0,0,-1])(sp.linear_extrude(4)(sp.import_stl("mera_v02_10_best.svg")))
coeur_up = sp.translate([0,0,6])(sp.linear_extrude(9)(sp.import_stl("mera_v02_10_best.svg")))
coeur = sp.union()(coeur_up,coeur_down)

piece = sp.difference()(contour,coeur)

plateau = sp.cube([taille_plat_x,taille_plat_y,20])

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


# carre = sp.translate([off_x,off_y,0])(plateau);
# to_print = sp.intersection()(piece,carre)
# sp.scad_render_to_file(to_print, path_scad)

# command = 'openscad -o ' + path_stl + ' ' + path_scad
# os.system(command) 
