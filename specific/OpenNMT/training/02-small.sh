########################################
# openNMT tutorial
# http://opennmt.net/OpenNMT/quickstart/
########################################

CODEDIR=~/code/OpenNMT
cd $CODEDIR
th preprocess.lua -train_src data/tiny.src-train.txt \
  -train_tgt data/PJR/tiny.tgt-train.txt \
  -valid_src data/PJR/tiny.src-val.txt \
  -valid_tgt data/PJR/tiny.tgt-val.txt \
  -save_data data/PJR/tiny.demo
echo "head of the src training data"
head -n 3 data/PJR/tiny.src-train.txt
echo 
echo "head of the tgt training data"
head -n 3 data/PJR/tiny.tgt-train.txt
echo 
echo "head of the dictionary"
head -n 25 data/tiny.demo.src.dict
head -n 25 data/tiny.demo.tgt.dict

echo; echo; echo "Step 2. Now train the model..."
th train.lua -data data/PJR/tiny.demo.t7 -save_model data/PJR/tiny.demo-model -log_level DEBUG

echo; echo; echo "Step 3. Translate."
th translate.lua -model data/PJR/tiny.demo-model_epochX_PPL.t7 -src data/src-test.txt -output pred.txt -log_level DEBUG
