#ifndef IAPPDIST_H_
#define IAPPDIST_H_

#include <vector>
#include <string>     	// std::string, std::to_string

using namespace boost::multiprecision;

void initUniformSpacedIappValues(std::vector<double> &iapp, double deli, double i0);
void initRandDistIappValues(std::vector<double> &iapp, double deli, double i0);
void initRandIappValues(std::vector<cpp_dec_float_100> &iapp);

int writeIappToFile(std::string const fileNameStr, std::vector<cpp_dec_float_100> &iapp, int n_p);

#endif /* IAPPDIST_H_ */
