for f in */*; do mv "$f" .; done
find . -type d -print -exec rmdir {}  \;

