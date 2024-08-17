# Makefile for building bin for aarch64
#
# Code compiles with:
#
#	__riscos
#	__riscos64
#   __aarch64__
#
# Norcroft defines not set:
#	__acorn
#	__arm

TARGET ?= bbcbasic

USE_FUNC_SIGNATURE ?= 1

CROSS_ROOT = ${shell echo $$CROSS_ROOT}

ALL_TARGETS = bbcbasic


CLIBDIR = /Users/charles/binblob/clib


# Remove the flags that might make code think it's compiling for linux system.
CFLAGS = -U__linux -U__linux__ -U__unix__ -U__unix -Ulinux -Uunix -U__gnu_linux__

# Add the definitions to indicate that we're compiling for RISC OS
CFLAGS += -D__riscos -D__riscos64

# Allow us to build without assuming the standard library is present
CFLAGS += -nostdlib -ffreestanding -march=armv8-a
#CFLAGS += -nostdlib -ffreestanding -march=armv8-a+nofp

# Add the exports directory to those things we'll build with
CFLAGS += -I${CLIBDIR}/riscos_headers/C -I${CLIBDIR}/riscos_headers/Lib/ -I${CLIBDIR}/riscos_headers/Lib/CLib/

# Options to allow function signatures to appear RISC OS-like
ifeq (${USE_FUNC_SIGNATURE},1)
CFLAGS += -fpatchable-function-entry=20,20
endif

# Optimisation options
CFLAGS += -O1

# Options for this build
CFLAGS += -I/ro64

# Assembler flags
AFLAGS = -march=armv8-a

# Flags for the linker
LDFLAGS = -T link.lnk -e _aif64_entry

targetted:
	make ${TARGET},ff8 TARGET=${TARGET}

all:
	for i in ${ALL_TARGETS} ; do make $$i,ff8 TARGET=$$i || exit $$? ; done

shell: dockcross-linux-arm64
	./dockcross-linux-arm64 bash

dockcross-linux-arm64:
	docker run --rm dockcross/linux-arm64:latest > dockcross-linux-arm64
	chmod +x dockcross-linux-arm64

clean:
	-rm -f *.o *.a *.bin *,ff8 *.map

ifeq (${CROSS_ROOT},)
# If we're outside the docker container, re-run ourselves inside the container
ifneq ($(filter-out all shell dockcross-linux-arm64 clean,${MAKECMDGOALS}),)
# The command wasn't one of our invocation commands above
.PHONY: ${MAKECMDGOALS}
${MAKECMDGOALS}: dockcross-linux-arm64 ${CRT_OBJS}
	cd ../.. && console/riscos64/dockcross-linux-arm64 --args "-v ${CLIBDIR}:/ro64/clib" -- bash -c "cd console/riscos64 && make ${MAKECMDGOALS} TARGET=${TARGET}"
else
.PHONY: ${DEFAULT_GOAL}
${DEFAULT_GOAL}: dockcross-linux-arm64 ${CRT_OBJS}
	./dockcross-linux-arm64 make TARGET=${TARGET}
endif

CLIBDIR = ${HOME}/binblob/clib

${CLIBDIR}/libcrt.a:
	cd ${CLIBDIR}; make

else
# We are within the docker container
CLIBDIR = /ro64/clib

CRT_OBJS = 	${CLIBDIR}/libcrt.a

VPATH = ../../src ../../include ../../../BBCSDL/src ../../../BBCSDL/include

CXX = aarch64-unknown-linux-gnu-gcc
CC = aarch64-unknown-linux-gnu-gcc
AS = aarch64-unknown-linux-gnu-as
LD = aarch64-unknown-linux-gnu-ld
OBJCOPY = aarch64-unknown-linux-gnu-objcopy
CFLAGS += -Wall -I ../../include -I ../../../BBCSDL/include
OBJS = bbmain.o bbexec.o bbeval.o bbasmb.o bbdata.o bbccos.o bbccon.o
OBJS += riscos.o str.o

CXX += ${CFLAGS}

bbmain.o: bbmain.c BBC.h
	$(CXX) -c -O2 $< -o $@

bbexec.o: bbexec.c BBC.h
	$(CXX) -c -O2 $< -o $@

bbeval.o: bbeval.c BBC.h
	$(CXX) -Wno-array-bounds -c -O2 $< -o $@

bbasmb.o: bbasmb_arm_64.c BBC.h
	$(CXX) -c -Os $< -o $@

bbccos.o: bbccos.c bbccon.h
	$(CXX) -Wno-array-bounds -Wno-unused-result -c -Os $< -o $@

bbccon.o: bbccon.c bbccon.h
	$(CXX) -Wno-array-bounds -Wno-unused-result -c -Os $< -o $@

bbdata.o: ../../src/bbdata_arm_ro64.s
	${AS} ../../src/bbdata_arm_ro64.s -o bbdata.o

#bbcbasic: $(OBJ)
#	$(CXX) $(OBJ) -L . -L/usr/include -ldl -lm -lrt -pthread \
#	-o bbcbasic -Wl,-s -Wl,-R,'$$ORIGIN'
#	cp bbcbasic ../../

%.o: %.c
	${CC} ${CFLAGS} -c -o $@ $?
%.o: %.s
	${AS} ${AFLAGS} -o $@ $?

${TARGET}.bin: link.lnk ${OBJS} ${CRT_OBJS}
	${LD} ${OBJS} ${CRT_OBJS} ${LDFLAGS} -o $@

${TARGET}.map: link.lnk ${OBJS} ${CRT_OBJS}
	${LD} ${OBJS} ${CRT_OBJS} ${LDFLAGS} -Map $@ -o /dev/null

ifeq (${USE_FUNC_SIGNATURE},1)
${TARGET},ff8: ${TARGET}.bin ${TARGET}.map
	${OBJCOPY} -O binary -j .text ${TARGET}.bin $@
	python riscos_symbols.py ${TARGET}.map ${TARGET},ff8
else
${TARGET},ff8: ${TARGET}.bin
	${OBJCOPY} -O binary -j .text ${TARGET}.bin $@
endif

endif
