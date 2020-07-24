cd ..
./build.sh
cd bindings

cd ./java
/cygdrive/e/swigwin-4.0.2/swig.exe -java -outcurrentdir -package tech.pegasys.teku.bls.impl.blst.swig ../blst.swg
gcc -march=native -fPIC -c blst_wrap.c -I../../../../jdk-11.0.5/include/win32 -I../../../../jdk-11.0.5/include -I..
gcc -shared blst_wrap.o ../../libblst.a -o jblst.dll

cp *.java /cygdrive/e/ws/artemis/bls/src/main/java/tech/pegasys/teku/bls/impl/blst/swig/
cp jblst.dll /cygdrive/e/ws/artemis/bls/src/main/resources/
# cp jblst.dll /cygdrive/e/ws/artemis/bls