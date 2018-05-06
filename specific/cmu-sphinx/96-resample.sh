################################################################################
# 96: RESAMPLE the Greek wav files
################################################################################

cd ~/code/u/cmu-sphinx/el-gr/aero_iap-20150703-ftm/wav/
pwd
array=(34 35 36 37 38 39 40 41 42 43)
for number in "${array[@]}"
do 
  sox el-00$number.wav -r 16000 resample-el-00$number.wav
done
