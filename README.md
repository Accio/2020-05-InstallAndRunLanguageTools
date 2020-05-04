Install LanguageTool on a local server
===


## Download ngram

```bash
wget https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip
wget https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip
unzip *.zip
rm *.zip
```

## Install fasttext

see [https://fasttext.cc](https://fasttext.cc) for more information about fasttext.

```bash
git clone https://github.com/facebookresearch/fasttext.git
cd fasttext
make
```

## Download fasttext

```bash
wget https://languagetool.org/download/fasttext.tar.gz
tar xvfz fasttext.tar.gz
```

## Download word2vec models

```bash
wget https://languagetool.org/download/word2vec/de.zip
wget https://languagetool.org/download/word2vec/en.zip
unzip *.zip
rm *.zip
```
## Test it!

```bash
java -jar LanguageTool-4.9.1-stable/languagetool-commandline.jar --word2vecmodel word2vec --fasttextmodel fasttext --fasttextbinary fasttext/fasttext -l en-GB test.txt
```
