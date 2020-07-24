cd ..
./build.sh
cd bindings

JDK=/usr/lib/jvm/java-11-openjdk-amd64

cd ./java
swig -java -outcurrentdir -package tech.pegasys.teku.bls.impl.blst.swig ../blst.swg
gcc -march=native -fPIC -c blst_wrap.c -I$JDK/include/linux -I$JDK/include -I..
gcc -shared blst_wrap.o ../../libblst.a -o libjblst.so

#cp *.java /cygdrive/e/ws/artemis/bls/src/main/java/tech/pegasys/teku/bls/impl/blst/swig/
#cp jblst.dll /cygdrive/e/ws/artemis/bls/src/main/resources/
# cp jblst.dll /cygdrive/e/ws/artemis/bls