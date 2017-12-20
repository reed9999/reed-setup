/* What goes in hello_ps.c? */

#include <pocketsphinx.h>

void
philip_stuff()
{
	printf("Here are some useful directories: \n\n");
	printf("MODELDIR /en-us/en-us\n");
	printf(MODELDIR "/en-us/en-us\n");
	 printf("MODELDIR /en-us/en-us.lm.bin\n");
	 printf(MODELDIR "/en-us/en-us.lm.bin\n");
	 printf("MODELDIR  /en-us/cmudict-en-us.dict\n");
	 printf(MODELDIR "/en-us/cmudict-en-us.dict\n");
}
int
main(int argc, char *argv[])
{
    ps_decoder_t *ps = NULL;
    cmd_ln_t *config = NULL;

    config = cmd_ln_init(NULL, ps_args(), TRUE,
		         "-hmm", MODELDIR "/en-us/en-us",
	                 "-lm", MODELDIR "/en-us/en-us.lm.bin",
	                 "-dict", MODELDIR "/en-us/cmudict-en-us.dict",
	                 NULL);

	philip_stuff();
    return 0;
}
