# Project: HH_BBT2017_allP

CPP      = g++-9.2.0.exe
CC       = gcc-9.2.0.exe
WINDRES  = windres.exe
OBJ      = HH_BBT2017_allP.o iappDist_allP.o SpikeTrain_allP.o
LINKOBJ  = HH_BBT2017_allP.o iappDist_allP.o SpikeTrain_allP.o
LIBS     = -L"C:/cygwin64/gcc-9.2.0/lib" -static-libgcc -L"C:/Users/wblan/boost_1_71_0/libs" 
INCS     = -I"C:/Users/wblan/boost_1_71_0"
CXXINCS  = -I"C:/cygwin64/gcc-9.2.0/include" -I"C:/Users/wblan/boost_1_71_0"
BIN      = HH_BBT2017_allP.exe
CXXFLAGS = $(CXXINCS) -std=c++17
CFLAGS   = $(INCS)

# To use long double precision
# CXXFLAGS = $(CXXINCS) -DuseLongDoubleP

# To use Boost double precision
# CXXFLAGS = $(CXXINCS) -DuseBoostDoubleP
 
RM       = rm.exe -f

.PHONY: all all-before all-after clean clean-custom

all: all-before $(BIN) all-after

clean: clean-custom
	${RM} $(OBJ) $(BIN)

$(BIN): $(OBJ)
	$(CPP) $(LINKOBJ) -o $(BIN) $(LIBS)

HH_BBT2017_allP.o: HH_BBT2017_allP.cpp
	$(CPP) -c HH_BBT2017_allP.cpp -o HH_BBT2017_allP.o $(CXXFLAGS)

iappDist_allP.o: iappDist_allP.cpp
	$(CPP) -c iappDist_allP.cpp -o iappDist_allP.o $(CXXFLAGS)

SpikeTrain_allP.o: SpikeTrain_allP.cpp
	$(CPP) -c SpikeTrain_allP.cpp -o SpikeTrain_allP.o $(CXXFLAGS)
