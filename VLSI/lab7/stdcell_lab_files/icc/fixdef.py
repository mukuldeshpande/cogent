#!/usr/bin/python

import sys,os, string,re


if (len(sys.argv) < 2):
   print "Usage :sys.argv[0] def_filename"
   sys.exit(-1)

deffile = sys.argv[1];

deffile_tmp = "deffile_tmp.def"

if (os.path.exists(deffile) != True):
   s = "File: %s does not exist! Exiting...\n" % (deffile)
   print s
   sys.exit(-1)

   
try:
	infile = open(deffile,'r')
except:
	print "Cannot open file: ",deffile
	sys.exit(-1)
try:
	outfile = open(deffile_tmp,'w')
except:
	print "Cannot open file: ",deffile_tmp
	sys.exit(-1)

state = 0
for line in infile.readlines():
    words = line.split()
    if (len(words) == 0):
       continue
    if (words[0] == '#SNPS_WIRES'):
       continue
    if (words[0] == 'SPECIALNETS'):
       state = 1
    if (len(words) == 2 and words[0] == 'END' and words[1] == 'SPECIALNETS'):
       state = 0
    if (state == 0):
       outfile.write(line)
       continue       

    if (len(words) == 2 and words[0] == '-' and words[1] == 'VDD'):
       outfile.write(line)
       outfile.write("  ( * vdd )\n")
       continue
    if (len(words) == 2 and words[0] == '-' and words[1] == 'VSS'):
       outfile.write(line)
       outfile.write("  ( * gnd )\n")
       continue
    if (len(words) == 4 and words[0] == '(' and words[2] == 'vdd' and words[3] == ')' ):
       continue
    if (len(words) == 4 and words[0] == '(' and words[2] == 'gnd' and words[3] == ')' ):
       continue
    
    outfile.write(line)
     


infile.close()
outfile.close()

os.remove(deffile)
os.rename(deffile_tmp,deffile)



