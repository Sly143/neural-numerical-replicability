#ifndef CHECKACTUALPRECISION_H_
#define CHECKACTUALPRECISION_H_

#include <string>       // std::string, std::to_string

#ifdef useLongDoubleP                                   // Case -DuseLongDoubleP is defined as parameter to the compiler 
    typedef long double actualDoubleP;
    std::string const actualPrecisionType = "long_double";
#else 
    #ifdef useBoostDoubleP                              // Case -DuseBoostDoubleP is defined as parameter to the compiler 
        #include <boost/multiprecision/cpp_dec_float.hpp>
        using namespace boost::multiprecision;
        
        typedef cpp_dec_float_100 actualDoubleP;
        std::string const actualPrecisionType = "boost_double";
    #else
        typedef double actualDoubleP;                   // default: double precision
        std::string const actualPrecisionType = "double";
    #endif
#endif

#endif /* CHECKACTUALPRECISION_H_ */
