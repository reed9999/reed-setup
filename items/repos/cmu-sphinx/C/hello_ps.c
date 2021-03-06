#include <pocketsphinx.h>
#define MODELDIR "/usr/local/share/pocketsphinx/model"
#define DATADIR "/home/philip/u/cmu-sphinx"
#define GREEK 1

#ifdef NEWJUNK
char**
get_params(int setup)
{
    char* s1, s2, s3;
    if (setup == GREEK) {
        s1 = MODELDIR "/el-gr/el-gr.cd_cont_5000";
        s2 = (char*) MODELDIR "/el-gr/el-gr.lm";
        s3 = (char*) MODELDIR "/el-gr/el-gr.lm";
    } else {
        s1 = MODELDIR "/en-us/en-us";
        s2 = MODELDIR "/el-gr/el-gr.lm";
        s3 = MODELDIR "/el-gr/el-gr.lm";
N
    }
    char*[] rv = [s1, s2, s3];
    return rv;
}
#endif

int
main(int argc, char *argv[])
{
    ps_decoder_t *ps;
    cmd_ln_t *config;
    FILE *fh;
    char const *hyp, *uttid;
    int16 buf[512];
    int rv;
    int32 score;

#ifdef NEWJUNK
    char** x = get_params(GREEK);
#endif

    config = cmd_ln_init(NULL, ps_args(), TRUE,
#ifdef GREEK
                         "-hmm", MODELDIR "/el-gr/el-gr.cd_cont_5000",
                         "-lm", MODELDIR "/el-gr/el-gr.lm",
                         "-dict", MODELDIR "/el-gr/el-gr.dic",
#else
    "-hmm", MODELDIR "/en-us/en-us",
             "-lm", MODELDIR "/en-us/en-us.lm.bin",
           "-dict", MODELDIR "/en-us/cmudict-en-us.dict",
#endif
             NULL);
    if (config == NULL) {
  fprintf(stderr, "Failed to create config object, see log for details\n");
  return -1;
    }

    ps = ps_init(config);
    if (ps == NULL) {
  fprintf(stderr, "Failed to create recognizer, see log for details\n");
  return -1;
    }
#ifdef GREEK
    fh = fopen(DATADIR "/el-gr/aero_iap-20150703-ftm/wav/resample-el-0034.wav", "rb");
#else
    fh = fopen(DATADIR "/goforward.raw", "rb");
#endif
    if (fh == NULL) {
  fprintf(stderr, "Unable to open input file\n");
  fprintf(stderr, "DATADIR: " DATADIR "\n");
  return -1;
    }

    rv = ps_start_utt(ps);

    while (!feof(fh)) {
  size_t nsamp;
  nsamp = fread(buf, 2, 512, fh);
  rv = ps_process_raw(ps, buf, nsamp, FALSE, FALSE);
    }

    rv = ps_end_utt(ps);
    hyp = ps_get_hyp(ps, &score);
    printf("Recognized: %s\n", hyp);

    fclose(fh);
    ps_free(ps);
    cmd_ln_free_r(config);

    return 0;    
}
