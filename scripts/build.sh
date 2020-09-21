set -e

# SETUP
SRC_DIR='./source'
OUT_DIR='./output'
OUT_DIR_WEB='./output/web'

mkdir -p $OUT_DIR
mkdir -p $OUT_DIR_WEB

bundle exec asciidoctor \
    -D $OUT_DIR \
    $SRC_DIR/*.adoc

bundle exec asciidoctor-pdf \
    -a pdf-themesdir=config -a pdf-theme=basic -a showtitle \
    -r asciidoctor-mathematical -a mathematical-format=svg \
    -D $OUT_DIR \
    $SRC_DIR/*.adoc

rm -f $SRC_DIR/stem-*.png
