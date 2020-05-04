Install and run LanguageTool on a local machine
===


## Download ngram

```bash
wget https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip
wget https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip
unzip *.zip
rm *.zip
```

## Download word2vec models

```bash
wget https://languagetool.org/download/word2vec/de.zip
wget https://languagetool.org/download/word2vec/en.zip
unzip *.zip
rm *.zip
```

In case you are interested in how neural networks were trained using the word2vec models, the source code can be found here on Github: [gulp21/languagetool-neural-network](https://fscs.hhu.de/languagetool/word2vec.tar.gz).

## Use fasttext for language detection (optional)

### Install fasttext

see [https://fasttext.cc](https://fasttext.cc) for more information about fasttext.

```bash
git clone https://github.com/facebookresearch/fasttext.git
cd fasttext
make
```

### Download fasttext data

```bash
mkdir fastTextData; cd !$
## wget https://dl.fbaipublicfiles.com/fasttext/vectors-english/wiki-news-300d-1M-subword.vec.zip
wget https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin
```

## Test it!

```bash
java -jar LanguageTool-4.9.1-stable/languagetool-commandline.jar --languagemodel ngram-data --word2vecmodel word2vec -l en-GB test.txt
```

A total of 14 potential issues was reported. I manually checked the results with the example provided on the website of the tool, and the results are consistent.

I experimented a bit, and observed the following:

* Using nothing than `-l en` (without the country code GB) reported 8 issues
* Using `-l en-GB` reported 10 issues.
* Using `--languagemodel` alone did not increase the number of issues reported. Is it automatically activated? 
* Using `--word2vecmodel` increased the number of issues to 14. However, the additional reported issues are mostly redundant.

On a regular laptop (HP 9470m, i5-3427U, 8G memory), it took about 6.5s to examine the ext, or about 1.2 second to examine one sentence.

## To do

Migrate the system onto a Raspberry Pi and run a server that checks texts.
