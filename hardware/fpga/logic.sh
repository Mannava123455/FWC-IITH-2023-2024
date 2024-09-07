ql_symbiflow -compile -src /data/data/com.termux/files/home/fpga-examples/assign -d ql-eos-s3 -P PU64 -v logic.v -t logicc -p pygmy.pcf -dump binary
#scp logicc.bin mannava@192.168.39.66:/home/mannava/Desktop 
