########################################
# openNMT tutorial
# http://opennmt.net/OpenNMT/quickstart/
########################################

cd ~/code/OpenNMT
th preprocess.lua -train_src data/short.src-train.txt -train_tgt data/short.tgt-train.txt -valid_src data/short.src-val.txt -valid_tgt data/short.tgt-val.txt -save_data data/short.demo
echo "head of the src training data"
head -n 3 data/short.src-train.txt
echo 
echo "head of the tgt training data"
head -n 3 data/short.tgt-train.txt
echo 
echo "head of the dictionary"
head -n 25 data/short.demo.src.dict

echo; echo; echo "Step 2. Now train the model..."
th train.lua -data data/demo-train.t7 -save_model demo-model

echo; echo; echo "Step 3. Translate."
th translate.lua -model demo-model_epochX_PPL.t7 -src data/src-test.txt -output pred.txt
