#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 22 17:48:18 2022

@author: pchaillo
"""
#### SVG PATH ##############

# Read SVG into a list of path objects and list of dictionaries of attributes 
from svgpathtools import svg2paths, wsvg
paths, attributes = svg2paths('loutre_1p_3.svg')

# Update: You can now also extract the svg-attributes by setting
# return_svg_attributes=True, or with the convenience function svg2paths2
from svgpathtools import svg2paths2
paths, attributes, svg_attributes = svg2paths2('loutre_1p_3.svg')

# Let's print out the first path object and the color it was in the SVG
# We'll see it is composed of two CubicBezier objects and, in the SVG file it 
# came from, it was red
redpath = paths[0]
redpath_attribs = attributes[0]
#print(redpath)
#print(redpath_attribs['stroke'])
#print(type(attributes))
#print(attributes)

print(attributes[0]["stroke-width"])

for i in range(len(attributes)):
    attributes[i]["stroke-width"] = 10
    attributes[i]["stroke"]='rgb(0,0,0)'

#print(len(attributes))
#print(attributes[0]["stroke-width"])
print(attributes)

#print(svg_attributes)

wsvg(paths, attributes=attributes, svg_attributes=svg_attributes, filename='loutre_1p_3_out_new.svg')


#### SVG WRITE ##############
#import svgwrite
#
#svg_document = svgwrite.Drawing(filename = "loutre_1p_2.svg",
#                                size = ("800px", "600px"))
#
#svg_document.add(svg_document.rect(insert = (0, 0),
#                                   size = ("200px", "100px"),
#                                   stroke_width = "5",
#                                   stroke = "black",
#                                   fill = "rgb(255,255,0)"))
#
#svg_document.add(svg_document.text("Hello World",
#                                   insert = (210, 110)))
#
#
#print(svg_document.tostring())
#
#svg_document.save()


#
################ CAIRO ####################
## importing pycairo
#import cairo
#
## creating a SVG surface
## here geek is file name & 700, 700 is dimension
#with cairo.SVGSurface("geek.svg", 700, 700) as surface:
#
#	# creating a cairo context object
#	context = cairo.Context(surface)
#
#	# creating a rectangle(square) for left eye
#	context.rectangle(100, 100, 100, 100)
#
#	# creating a rectangle(square) for right eye
#	context.rectangle(500, 100, 100, 100)
#
#	# creating position for the curves
#	x, y, x1, y1 = 0.1, 0.5, 0.4, 0.9
#	x2, y2, x3, y3 = 0.4, 0.1, 0.9, 0.6
#
#	# setting scale of the context
#	context.scale(700, 700)
#
#	# setting line width of the context
#	context.set_line_width(0.04)
#
#	# move the context to x,y position
#	context.move_to(x, y)
#
#	# draw the curve for smile
#	context.curve_to(x1, y1, x2, y2, x3, y3)
#
#	# setting color of the context
#	context.set_source_rgba(0.4, 1, 0.4, 1)
#
#	# stroke out the color and width property
#	context.stroke()
#
#
## printing message when file is saved
#print("File Saved")
