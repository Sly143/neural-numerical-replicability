#ifndef IAPPDIST_H_
#define IAPPDIST_H_

#include <vector>
#include <string>     	// std::string, std::to_string

void initUniformSpacedIappValues(std::vector<double> &iapp, double deli, double i0);
void initRandDistIappValues(std::vector<double> &iapp, double deli, double i0);
void initRandIappValues(std::vector<double> &iapp);

int writeIappToFile(std::string const fileNameStr, std::vector<double> &iapp, int n_p);

#endif /* IAPPDIST_H_ */
