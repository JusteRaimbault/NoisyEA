

## Compile latest coco

Procedure in do.py:build-java
 - amalgamate source files (python package amalgamate in code-experiments/tools) into coco.c in java folder
 - expand header coco.h in java folder (cocoutils also in code-experiments/tools)
 - compile CocoJNI.java and generate header (javac and javah)
 - at this step, CocoJNI.c (the interface file) must be modified to have same function names than the header file (TODO automatize)
 - compile the c interface and the shared library (gcc)
 - recompile the java classes 



## Use old coco

- latest "old" coco code : http://coco.lri.fr/downloads/download15.03/bboball15.03.tar.gz
- build the dynamic library for java :
   * add include in cflags
   * change DLFLAGS to -m32 (if under x86_64)
- => FAILS as library is 32 bits and can only be run with a 32 bit jvm
--> use latest coco version with "hand-made" noise
