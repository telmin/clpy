CXX=clang++
LD=clang++
CXXFLAGS=-std=c++11 -Wall -Wextra -O3 -pedantic-errors -fno-rtti
CXX11_ABI_CHECK=$(shell ./check_c++11abi.sh)

build: headercvt

headercvt: headercvt.o
	$(LD)  $< -lclangTooling -lclangFrontendTool -lclangFrontend -lclangDriver -lclangSerialization -lclangCodeGen -lclangParse -lclangSema -lclangStaticAnalyzerFrontend -lclangStaticAnalyzerCheckers -lclangStaticAnalyzerCore -lclangAnalysis -lclangEdit -lclangAST -lclangLex -lclangBasic -lclang `llvm-config --libs --system-libs` -o $@

headercvt.o:headercvt.cpp
	$(CXX) $(CXXFLAGS) -c -D_GLIBCXX_USE_CXX11_ABI=$(CXX11_ABI_CHECK) $<


func_decl.pxi: headercvt
	./headercvt stub.c -- $(CLPY_HEADERCVT_INCLUDE_DIRS)

preprocessor_defines.pxi:
types.pxi:



DEPLOY_PATH=../clpy/backend/opencl

$(DEPLOY_PATH)/%.pxi: %.pxi
	cp -f $< $@

deploy: \
	$(DEPLOY_PATH)/func_decl.pxi \
	$(DEPLOY_PATH)/preprocessor_defines.pxi \
	$(DEPLOY_PATH)/types.pxi


clean:
	rm headercvt 2>/dev/null || true
	rm *.pxi  2>/dev/null || true
