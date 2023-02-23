#!/bin/bash

pkg install python -y

pkg install python2 -y 

pkg install python3 -y

cp pyserver $PREFIX/bin/

cd

sleep 3

chmod 777 $PREFIX/bin/pyserver 



