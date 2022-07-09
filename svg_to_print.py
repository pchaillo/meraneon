#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 22 16:31:46 2022

@author: pchaillo

"""
import os
import openpyscad as ops
# from solid import *
import solid as sp


stl_name = "figure_complete.stl"
scad_name = "figure_complete.scad"

path = os.path.dirname(os.path.abspath(__file__))
path_stl = path + '/STL/' + stl_name
path_scad = path + '/SCAD_CODE/' + scad_name

# linear_extrude(14)
# //resize(newsize=[410,497])
# contour = ops.Import("mera_v02_14_best.svg").Linear_Extrude(14);
# extrude = Difference() ops.Linear_Extrude(14) ops.Import("mera_v02_14_best.svg")
extrude = sp.linear_extrude(14)(sp.import_stl("mera_v02_14_best.svg"))


# obj = ops.Import("mera_v02_14_best.svg")

sp.scad_render_to_file(extrude, path_scad)

# (extrude).write(path_scad)
# (obj).write(path_scad)


command = 'openscad -o ' + path_stl + ' ' + path_scad

os.system(command) 

# i = Difference() i.append(Cube[20, 10, 10]) i.append(Cube[10, 20, 10])