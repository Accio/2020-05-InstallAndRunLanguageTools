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

On a regular laptop (HP 9470m, i5-3427U, 8G memory), it took about 6.5s to examine the ext, or about 1.2 second to examine one sentence. The speed may not be the fastest, but it is much faster than I can write:)

The whole directory is about 21G, including ngram and word2vec models for English and German. It will probably fit on a 32GB SD card.

## Set up the local web server

See the [tutorial](http://wiki.languagetool.org/http-server) to run a HTTP server of LanguageTools.

```bash
java -cp /opt/LanguageTool/LanguageTool-4.9.1-stable/languagetool-server.jar org.languagetool.server.HTTPServer --port 8081 --allow-origin "*" --public --config /opt/LanguageTool/config/server-config 
```

The files used by LanguageTool is specified in the [config/server-config](config/server-config) file. The port is set by the `--port` option as 8081. The `--alow-origin` parameter allows user to use explorer plugins (which I am not using though). The parameter `--public` makes sure that we can visit the server from other machines.

# Failed attemp to install the system on a Raspberry pi.

I wanted to migrate the system onto a Raspberry Pi and run a server that checks texts for me. However, it failed because the default linux build compaints about architecture incompability of boost libraries. When I tried to compile from the source code, `maven` failed to find the dependency `com.google.protobuf:protoc:exe:linux-arm_32:3.11.0`. Notice that RaspberriPi runs on ARM chips. Given that I could not find the dependency, I decide to stop there. 

In case anyone has successfully compiled LanguageTools on RaspberriPi systems, please kindly let me know.

## To do

* Configure the tool to check markdown files
