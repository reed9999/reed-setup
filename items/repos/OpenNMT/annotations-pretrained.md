# The interesting call stack

-> Translator:buildData 311


-> Translator:translate 622 now 631
  -> Translator:translateBatch 

    -> Encoder: forwardOne
      -> Encoder: forward
    loop on b=1 to batchSize
    returns a table of tables that corresponds to actual words.  
    
-> Translator:translate 647    
  -> Translator:buildTargetWords
  
      
      
when translate returns, it's still the numeric results
at translate:247 It looks unpopulated in the debugger but don't worry, it is. 

    
#My hacking, version 1.0
23 Jan 2018
return value around Translator:550 is interesting
allHyp has length 5, each element is a 1-D tensor I think.
It seems to be the hypotheses where the numbers match the output, as below with pred.




when translate returns, it's still the numeric results
Although at translate:247 I don't even see results populated. 



#My hacking, version 0.*
Let's call all these runs version 0.*. That doesn't mean product version, just my screwing around.

## The real fun

What I want to know: 
1. Where is the actual translation (assuming already a trained model) done?
The first is before 
2. Where is that translation looked up to transfer it into target-language words.


### buildTargetWords

self:buildTargetWords

That is called once per sentence in the batch. It might be doing the actual translation, but it's certainly assembling the target language words. Translator:638

 local tokens = self.dicts.tgt.words:convertToLabels(pred, onmt.Constants.EOS)
 self.dicts.tgt.words
dicts is a table but inspecting self.dicts.tgt.words gives Dict has no length operator.
 
  if self.args.replace_unk or self.args.replace_unk_tagged or self.args.placeholder_constraints then -- all false
So the real action was before. local tokens = self.dicts.tgt.words:convertToLabels(pred, onmt.Constants.EOS)


### pred, predFeats, predScore, attn, goldScore, beamHistories = self:translateBatch(batch)
But pred must have already been there.


Pred in this case: {4430, 28, 7051, 2, 464, 316, 49784, 16138, 3460, 177, 18, 1881, 52, 13046, 3417, 45, 7, 1001, 28812, 17333, 345, 8, 3425, 9, 20, 14641, 1500, 5, 411, 20, 2029, 2, 20, 14641, 1500, 8249, 2, 5, 43, 7, 583, 20, 2029, 2, 8866, 16, 14, 10559, 12, 5048, 6} --[[table: 0x41cce398]]

{"Laut", "dem", "Times", "<unk>", "nationalen", "politischen", "Korrespondenten", "Jonathan", "Martin", "bietet", "das", "Buch", "einen", "gründlichen", "Überblick", "über", "die", "Bemühungen", "hochrangiger", "Beamter", "innerhalb", "der", "Kampagne", "und", "des", "Weißen", "Hauses", ",", "nämlich", "des", "ehemaligen", "<unk>", "des", "Weißen", "Hauses", "Bill", "<unk>", ",", "um", "die", "Auswirkungen", "des", "ehemaligen", "<unk>", "Clinton", "für", "den", "Vizepräsidenten", "zu", "messen", "."} --[[table: 0x406da130]]

### convertToLabels method of Dict

See onmt/utils/Dict.lua:function Dict:convertToLabels(idx, stop)

And  Dict:lookup(key) is where it takes place. But where did these come from?

labelToIdx - seems to be defined in torch.class("Dict") although Google finds more OpenNMT than anything.

### Older
 call to Translator:translate. 232 (at present) of translate.lua -- local results = translator:translate(srcBatch, goldBatch)

src={{placeholders = {}, words = {"I'm", "starting", "the", "example", "on", "what", "was", "originally", "line", "101."}}, {placeholders = {}, words = {"According", "to", "the", "Times", "&apos;", "national", "political", "correspondent", "Jonathan", "Martin", ",", "the", "book", "provides", "a", "thorough", "account", "of", "the", "effort", "by", "senior", "officials", "inside", "the", "campaign", "and", "the", "White", "House", ",", "namely", "former", "White", "House", "Chief", "of", "Staff", "Bill", "Daley", ",", "to", "measure", "what", "effect", "swapping", "former", "Secretary", "of", "State", "Clinton", "for", "the", "Vice", "President", "would", "have", "in", "the", "polls", "."}}, {placeholders = {}, words = {"The", "potential", "switch", "was", "a", "closely", "guarded", "secret", "within", "the", "Chicago", "campaign", "infrastructure", "and", "inside", "the", "Oval", "Office", "."}}, {placeholders = {}, words = {"Only", "half", "a", "dozen", "of", "the", "President", "&apos;s", "closest", "advisers", "--", "including", "Daley", ",", "former", "Obama", "campaign", "chief", "Jim", "Messina", ",", "and", "former", "White", "House", "senior", "advisers", "David", "Axelrod", "and", "David", "Plouffe", "--", "knew", "the", "change", "was", "under", "consideration", "."}}, {placeholders = {}, words = {"&quot;", "Double", "Down", "&quot;", "claims", "Daley", "spearheaded", "the", "effort", "to", "replace", "Biden", ",", "despite", "their", "&quot;", "close", "personal", "rapport", ",", "&quot;", "before", "ultimately", "deciding", "against", "the", "move", "when", "their", "data", "showed", "adding", "Clinton", "to", "the", "ticket", "wouldn", "&apos;t", "&quot;", "materially", "improve", "Obama", "&apos;s", "odds", ".", "&quot;"}}} --[[table: 0x40243608]]



self.args.dump_input_encoding looks intriguing, but it's false. self.beamHistories same, nil.

self:buildTargetWords(pred[b][n], src[indexMap[b]].words, attn[b][n], src[indexMap[b]].placeholders) is pretty key. 
pred[b][n] =  {2, 235, 28, 337, 5, 89, 2887, 2, 2} --[[table: 0x41ebbad0]]
2 means unknown, 235 ab, 5 comma, etc.





## Leading up to the real fun

Interesting line numbers in translate.lua. Both before.
194
222

And after, 274 (dump_input_encoding and detokenize_output are both false)
results[2].preds[1].words is a good example to watch.
In output/annotations-*-results-pred.txt I've pasted the huge tensor. Perhaps the part at the end is most interesting?

...features = {} --[[table: 0x42480618]], score = -15.407052040100098,
words = {"<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", ",", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>",
"<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "<unk>", "."} --[[table: 0x42469d38]]} --[[table: 0x41f292a8]]} --[[table: 0x41e01708]]} --[[table: 0x41f06cf8]]} --[[table: 0x40f0f5b8]]

That is a bunch of 2s as we see below.



### another run - with more information
translate.lua 235
type(srcBatch)
"table"
type(goldBatch)
"nil"


srcBatch becomes src in Translator:translate
src[2]
{placeholders = {} --[[table: 0x41910160]], words = {"According", "to", "the", "Times", "&apos;", "national", "political", "correspondent", "Jonathan", "Martin", ",", "the", "book", "provides", "a", "thorough", "account", "of", "the", "effort", "by", "senior",
"officials", "inside", "the", "campaign", "and", "the", "White", "House", ",", "namely", "former", "White", "House", "Chief", "of", "Staff", "Bill", "Daley", ",", "to", "measure", "what", "effect", "swapping", "former", "Secretary", "of", "State", "Clinton",
"for", "the", "Vice", "President", "would", "have", "in", "the", "polls", "."} --[[table: 0x41d1b638]]} --[[table: 0x41d28580]]


Encoder:210 starts to deal with tensors

states = onmt.utils.Tensor.reuseTensorTable(self.statesProto, { batch.size, outputSize })

...n\nColumns 469 to 494\n 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0\n 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0\n 0
0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0\n 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0\n 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0\n\nColumns 495 to 500\n
0  0  0  0  0  0\n 0  0  0  0  0  0\n 0  0  0  0  0  0\n 0  0  0  0  0  0\n 0  0  0  0  0  0\n[torch.FloatTensor of size 5x500]\n"} --[[table: 0x414ed788]]


then after Encoder:214, still tensor of dims:    5\n  61\n 500\n[torch.LongStorage of size 3]\n"

states = self:net(t):forward(inputs) -- this is the first thing that looks like it contains real data!


I don't understand what -- Zero states of timesteps with padding. does. 
I think it's zeroing out only certain parts of the big tensor, e.g. 
states[1][2] still has values but states[1][3] is zeroed.

Anyway, when it gets to Encoder:260 return states, context
states is a 4 element list (#states = 4). Each element is a 5x500 tensor
context is a 5x61x500 tensor

ran back out to Translator:622. 
Not surprising that after that line, pred is populated. But predFeats isn't.
#pred=5
That's because of 5 translations in my miniature batch.
pred[1]
{{2, 235, 28, 337, 5, 89, 2887, 2, 2} --[[table: 0x431bc408]]} --[[table: 0x418657a8]]

pred[5]
{{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6}

and then at Translator:638 it builds the actual words. So I really want to figure out the pred that's getting returned on 622.
It's returned at Translater:540


### A third run

So we get to Translator 497. results and histories look fun, just populated. 

#results=5
results is basically 5x the next long thing. In other words, it's the top 5 hypotheses.

Then to Translator 509. 
self.args.n_best = 1
Then to Translator 511. 


{score = -9.4474668502807617, states = {[4] = {" 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.3512\n 0.2081\n 0.0836\n 0.1073\n 0.0380\n 0.0872\n 0.0168\n 0.0321\n 0.0326\n 0.0429\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.1193\n 0.2424\n 0.2203\n 0.1604\n 0.0449\n 0.0528\n 0.0224\n 0.0350\n 0.0500\n 0.0525\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0608\n 0.0768\n 0.1804\n 0.2788\n 0.0275\n 0.1179\n 0.0409\n 0.0752\n 0.0632\n 0.0783\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0255\n 0.0718\n 0.0237\n 0.3022\n 0.0704\n 0.1430\n 0.0515\n 0.1823\n 0.0771\n 0.0524\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0645\n 0.0466\n 0.0423\n 0.0450\n 0.0803\n 0.1889\n 0.0415\n 0.0773\n 0.0895\n 0.3239\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0615\n 0.1192\n 0.0145\n 0.0413\n 0.0667\n 0.1415\n 0.1173\n 0.1209\n 0.1762\n 0.1409\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0174\n 0.0165\n 0.0100\n 0.0249\n 0.0115\n 0.0262\n 0.0798\n 0.3481\n 0.2270\n 0.2387\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0189\n 0.0171\n 0.0120\n 0.0228\n 0.0125\n 0.0271\n 0.0334\n 0.0991\n 0.3771\n 0.3801\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0169\n 0.0301\n 0.0139\n 0.0315\n 0.0106\n 0.0216\n 0.0761\n 0.0525\n 0.3711\n 0.3758\n[torch.FloatTensor of size 61]\n", " 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0000\n 0.0353\n 0.0651\n 0.0210\n 0.0908\n 0.0150\n 0.0289\n 0.1026\n 0.0541\n 0.3451\n 0.2420\n[torch.FloatTensor of size 61]\n"}, [5] = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}}}, tokens = {2, 235, 28, 337, 5, 89, 2887, 2, 2, 4}} --[[table: 0x41703408]]

Where do the tokens come from?


tokens in the results: 

 tokens = {2, 235, 28, 337, 5, 89, 2887, 2, 2, 4}}}, {{score = -29.703439712524414, states = {[4] = {" 0.0882\n 0.1139\n 0.1328\n 0.0804\n 0.0363\n 0.0765\n 0.0232\n 0.0721\n 0.1051\n 0.0144\n 0.0115\n 0.0242\n 0.0580\n 0.0388\n 0.0059\n 0.0074\n 0.0061\n 0.0042\n 0.0029\n 0.0047\n 0.0012\n 0.0022\n 0.0024\n 0.0017\
 
 
 tokens = {4430, 28, 7051, 2, 464, 316, 49784, 16138, 3460, 177, 18, 1881, 52, 13046, 3417, 45, 7, 1001, 28812, 17333, 345, 8, 3425, 9, 20, 14641, 1500, 5, 411, 20, 2029, 2, 20, 14641, 1500, 8249, 2, 5, 43, 7, 583, 20, 2029, 2, 8866, 16, 14, 10559, 12, 5048, 6, 4}}}, 
  tokens = {68, 2, 98, 27, 2, 2, 345, 8, 9418, 11, 3425, 9, 345, 20, 2, 4224, 6, 4}}}  
  
  
  
   tokens = {893, 423, 27, 13468, 11200, 20, 944, 2, 20895, 5268, 2, 5, 832, 2, 5, 3721, 3947, 11, 3425, 6412, 16792, 30022, 5, 9, 8506, 2, 3386, 12665, 5268, 3985, 2, 9, 3985, 2, 2, 98, 7, 1007, 108, 2034, 6, 4}}}, 
   
      
   
    tokens = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 4}}}} --[[table: 0x408bbef8]]