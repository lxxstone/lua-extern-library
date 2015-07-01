rapidxml.so:rapidxml.cpp rapidxml.h rapidxml.hpp rapidxml_iterators.hpp rapidxml_print.hpp rapidxml_utils.hpp
	g++ *.cpp -I. -llua -shared -fPIC -o $@
.PHONY:clean

clean:
	rm -r rapidxml.so
