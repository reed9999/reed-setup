########################################
# 3 try to build in CLion
########################################

#What's between the backticks in the gcc line that we know works?
pkg-config --variable=modeldir pocketsphinx
#pocketsphinx/usr/local/share/pocketsphinx/model

pkg-config --cflags --libs pocketsphinx sphinxbase
# -I/usr/local/include -I/usr/local/include/sphinxbase -I/usr/local/include/pocketsphinx -I/usr/local/include -I/usr/local/include/sphinxbase -L/usr/local/lib -lpocketsphinx -lsphinxbase -lsphinxad -lasound -lpthread -lm




echo "This is just taking the original example from a tutorial and expanding out the backticks."

gcc -o hello_ps hello_ps.c \
    -DMODELDIR=\"/usr/local/share/pocketsphinx/model\" \
    -I/usr/local/include -I/usr/local/include/sphinxbase -I/usr/local/include/pocketsphinx -I/usr/local/include -I/usr/local/include/sphinxbase -L/usr/local/lib -lpocketsphinx -lsphinxbase -lsphinxad -lasound -lpthread -lm

