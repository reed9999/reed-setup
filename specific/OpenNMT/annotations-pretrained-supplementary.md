# Annotations
This file was formerly known as annotations-pretrained-main.md, but it's really not the main one.

What hacks have i made to debug the pretrained translation process (see 04-pretrained.sh)?

These are the most relevant hacks to understand translation:

```

/home/philip/code/OpenNMT/onmt/translate/Translator.lua:-- unclear why this breaks here but not elsewhere -- PJR  
/home/philip/code/OpenNMT/onmt/translate/Translator.lua:--    _G.logger:debug('PJR  %s %s.', PJR__FILE__(), PJR__LINE__())
/home/philip/code/OpenNMT/onmt/translate/Translator.lua:--    _G.logger:debug('PJR about to call beamSearcher:search') 
/home/philip/code/OpenNMT/onmt/translate/Translator.lua:--    _G.logger:debug('PJR %s', self.args)
/home/philip/code/OpenNMT/onmt/translate/DecoderAdvancer.lua: _G.logger:debug('PJR %s %s %s.', decoder, batch, context)
/home/philip/code/OpenNMT/onmt/translate/DecoderAdvancer.lua:    _G.logger:info('PJRPJRPJR')
/home/philip/code/OpenNMT/onmt/translate/DecoderAdvancer.lua:_G.logger:debug('PJR %s %s %s.', beam, inputs, decStates)
/home/philip/code/OpenNMT/onmt/translate/DecoderAdvancer.lua:--G.logger:debug('PJR %s . About to call forwardOne', sourceSizes)
/home/philip/code/OpenNMT/onmt/modules/Decoder.lua:_G.logger:debug('PJR Decoder 363 forwardOne called ') --with input: %s', input)
/home/philip/code/OpenNMT/onmt/modules/Decoder.lua:_G.logger:debug('PJR Decoder.lua forwardOne called with input of type: %s', type(input))
/home/philip/code/OpenNMT/onmt/modules/Decoder.lua:_G.logger:debug('PJR Decoder.lua forwardOne called with input of size: %s', input:size())
/home/philip/code/OpenNMT/onmt/modules/Decoder.lua:_G.logger:debug('PJR Decoder.lua forwardOne called with input of dimensions: %s', input:dim())
/home/philip/code/OpenNMT/onmt/modules/Decoder.lua: _G.logger:debug('PJR Decoder 363 forwardOne called with sourceSizes: %s', sourceSizes)
/home/philip/code/OpenNMT/onmt/modules/Decoder.lua: _G.logger:debug('PJR Decoder 363 forwardOne called with sourceLength: %s', sourceLength)
/home/philip/code/OpenNMT/onmt/modules/Decoder.lua:    _G.logger:debug('PJR Decoder 475 forwardAndApply called with decInput: %s', decInput)
/home/philip/code/OpenNMT/train.lua:  _G.logger:debug('PJR local trainer = onmt.train.Trainer.new(opt, model, data.dicts, trainDataset:getBatch(1))')
/home/philip/code/OpenNMT/translate.lua:--PJR
/home/philip/code/OpenNMT/translate.lua:function PJR__FILE__() return debug.getinfo(2,'S').source end
/home/philip/code/OpenNMT/translate.lua:function PJR__LINE__() return debug.getinfo(2, 'l').currentline end
/home/philip/code/OpenNMT/translate.lua:--end PJR
/home/philip/code/OpenNMT/translate.lua: _G.logger:debug('PJR translate k,v loop %s %s. k %s v %s', PJR__FILE__(), PJR__LINE__(), k, v)
/home/philip/code/OpenNMT/translate.lua:--_G.logger:debug('PJR translate k,v loop %s. k %s v %s', PJR__LINE__(), k, v)
/home/philip/code/OpenNMT/translate.lua:_G.logger:debug('PJR on the fly %s. k %s v %s', PJR__LINE__(), k, v)
```


And these are from my ill fated attempts to understand training. 

```

/home/philip/code/OpenNMT/onmt/Seq2Seq.lua:_G.logger:debug('Seq2Seq:forwardComputeLoss PJR')
/home/philip/code/OpenNMT/onmt/Seq2Seq.lua:-- begin PJR
/home/philip/code/OpenNMT/onmt/Seq2Seq.lua:function PJRsleep(n)  -- seconds
/home/philip/code/OpenNMT/onmt/Seq2Seq.lua:-- end PJR
/home/philip/code/OpenNMT/onmt/Seq2Seq.lua:  _G.logger:debug('PJR Seq2Seq 211 trainNetwork with batch: %s', batch)
/home/philip/code/OpenNMT/onmt/Seq2Seq.lua:  _G.logger:debug('PJR Seq2Seq 211 trainNetwork with decInitStates: %s', decInitStates)
/home/philip/code/OpenNMT/onmt/Seq2Seq.lua:  PJRsleep(30)		--hoping to avoid overheating!
```
