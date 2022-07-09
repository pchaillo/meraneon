#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 22 16:31:46 2022

@author: pchaillo

"""

#import nest_asyncio
#nest_asyncio.apply()
#__import__('IPython').embed()

from pathlib import Path
from svgtrace import trace

# récupère la localisation des fichiers
THISDIR = str(Path(__file__).resolve().parent)

# converti le png en svg (bitmap trace equivalent)
bw = open(THISDIR + "/loutre_1p_new.svg", "w")
bw.write(trace(THISDIR + "/loutre_1p2.png", True))
bw.close()
colour = open(THISDIR + "/loutre_1p_new.svg", "w")
colour.write(trace(THISDIR + "/loutre_1p2.png"))
colour.close()

