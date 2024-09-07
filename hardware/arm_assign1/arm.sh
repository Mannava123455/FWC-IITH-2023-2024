dir=$1
cd incdec
cd GCC_Project
make
scp output/bin/incdec.bin mannava@192.168.33.66:\home\mannava\Desktop
cd ..
cd ..
cd docs
cd documents
texfot pdflatex arm.tex
cd ../../
cp docs/documents/arm.pdf /sdcard/Download/$1.pdf
termux-open /sdcard/Download/$1.pdf

