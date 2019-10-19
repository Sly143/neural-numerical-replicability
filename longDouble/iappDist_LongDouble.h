#ifndef IAPPDIST_H_
#define IAPPDIST_H_

#include <vector>
#include <string>     	// std::string, std::to_string

void initUniformSpacedIappValues(std::vector<long double> &iapp, long double deli, long double i0);
void initRandDistIappValues(std::vector<long double> &iapp, long double deli, long double i0);
void initRandIappValues(std::vector<long double> &iapp);

int writeIappToFile(std::string const fileNameStr, std::vector<long double> &iapp, int n_p);

#endif /* IAPPDIST_H_ */
