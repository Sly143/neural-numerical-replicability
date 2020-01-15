#ifndef IAPPDIST_H_
#define IAPPDIST_H_

#include <vector>
#include <string>       // std::string, std::to_string

#include "checkActualPrecision.h"

void initRandIappValues(std::vector<actualDoubleP> &iapp);

int writeIappToFile(std::string const fileNameStr, std::vector<actualDoubleP> &iapp, int n_p);

#endif /* IAPPDIST_H_ */
