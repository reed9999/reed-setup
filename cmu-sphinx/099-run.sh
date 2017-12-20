################################################################################
# 099 RUN POCKETSPHINX
# Works, AFAICT. 
# However, I don't know what I did to fix the acmod.c error below. All I can
# think of is that compiling ./hello_ps.c may have somehow put things in the 
# right place?
################################################################################

#pocketsphinx_continuous -infile 17-11-06-19-51-56.wav
pocketsphinx_continuous -infile 17-11-06-19-51-56.wav > decode-result.txt



#earlier
#INFO: cmn.c(143): mean[0]= 12.00, mean[1..12]= 0.0
#ERROR: "acmod.c", line 80: Acoustic model definition is not specified either with -mdef option or with -hmm
