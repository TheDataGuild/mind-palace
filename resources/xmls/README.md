These XMLs are generated from parsing the original PDFs with Grobid. Follow the official installation instructions [to build](https://grobid.readthedocs.io/en/latest/Install-Grobid/) and [run Grobid in command line batch mode](https://grobid.readthedocs.io/en/latest/Grobid-batch/) using this command:

```sh
$ java -Xmx4G -Djava.library.path=grobid-home/lib/lin-64:grobid-home/lib/lin-64/jep -jar grobid-core/build/libs/grobid-core-0.7.3-onejar.jar -gH grobid-home -dIn ~/Downloads/neural_decoding_papers -dOut ../mind-palace/resources/xmls/ -exe processFullText -ignoreAssets
```
