
CC=g++

CFLAGS=-std=c++17 -m64 -I./include -I$(ROOTSYS)/include

ODIR=build/obj

LDIR=$(ROOTSYS)/lib
LIBS=-lCore -lImt -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lROOTVecOps \
	-lTree -lTreePlayer -lRint -lPostscript -lMatrix -lPhysics -lMathCore \
	-lThread -lMultiProc -lROOTDataFrame -pthread -lm -ldl

DEPS=$(wildcard include/*.h)

SRCS=$(wildcard src/*.cpp)
_SRCS=$(patsubst src/%.cpp,%.cpp,$(SRCS))

OBJS=$(patsubst %.cpp,$(ODIR)/%.o,$(_SRCS))

$(info > Sources=$(SRCS))
$(info > Objects=$(OBJS))
$(info > Dependences=$(DEPS))

TARGET=build/ExStats2020

.PHONY: all clean 

${TARGET}: $(OBJS) $(ODIR)/AtlasOpenData.o
	$(CC) -o $@ exec/main.cpp $(CFLAGS) -L$(LDIR) $(LIBS) $^

$(ODIR)/AtlasOpenData.o: src/AtlasOpenData/HZZAna.cpp include/AtlasOpenData/HZZAna.h include/AtlasOpenData/HZZAnaBase.h
	mkdir -p $(@D)
	${CC} -c $< -o $@ $(CFLAGS) $(CFLAGS) -L$(LDIR) $(LIBS) 

$(ODIR)/%.o: src/%.cpp $(DEPS)
	mkdir -p $(@D)
	$(CC) -c $< -o $@ $(CFLAGS) $(CFLAGS) -L$(LDIR) $(LIBS) 

clean:
	rm -rf build/*
	