//============================================================================
// Name        : iappDist.cpp
// Created on  : Oct, 2016
// Author      : 
// Description :
//   Module to initialize and write to a file the Iapp values. 
// Used by     : HH_Blanco2016_doubleP.cpp
//   Original version:
//   network of 100 HH (reduced) cells with heterogeneous input current (Ii)
//   all to all coupling with synaptic depression
//   From Tabak, Mascagni, Bertram. J Neurophysiol, 103:2208-2221, 2010.
//
//   New version:
//   - some % are inhibitory neurons
//
//   From Blanco, Tabak, Bertram. J Frontiers in Comp. Neuroscience, 2017.
//============================================================================
#include <boost/multiprecision/cpp_dec_float.hpp>
#include <boost/math/special_functions/gamma.hpp>

#include <iostream>     // std::cout
#include <fstream>      // std::ofstream
#include <cstdlib>      // RAND_MAX

#include "iappDist_Boost.h"

using namespace std;
using namespace boost::multiprecision;

void initUniformSpacedIappValues( std::vector<double> &iapp, double deli, double i0) {
	// Uniformly spaced applied currents Ii in the interval [i0, i0+deli] :
	for (unsigned int n = 0; n < iapp.size(); n++)
		iapp[n] = i0+(n*deli)/(iapp.size()-1);
}

void initRandDistIappValues( std::vector<double> &iapp, double deli, double i0) {
	// Random distribution values in the interval [i0, i0+deli]
	for (unsigned int n = 0; n < iapp.size(); n++)
		iapp[n] = i0+((double)rand()/RAND_MAX)*deli;
}

// Iapp values for 100 neurons
void initRandIappValues(std::vector<cpp_dec_float_100> &iapp) {

	int numele = iapp.size();
	if (iapp.size()!=100)
		return;

	iapp[0] = -2.18619;
	iapp[1] = -2.57576;
	iapp[2] = -3.41212;
	iapp[3] = -3.71471;
	iapp[4] = -5.39247;
	iapp[5] = 2.96518;
	iapp[6] = 3.7141;
	iapp[7] = 4.12336;
	iapp[8] = 2.06839;
	iapp[9] = -3.20933;
	iapp[10] = -8.78277;
	iapp[11] = -8.15378;
	iapp[12] = 1.66234;
	iapp[13] = -5.6827;
	iapp[14] = -4.08322;
	iapp[15] = -2.69158;
	iapp[16] = -2.59407;
	iapp[17] = -1.73528;
	iapp[18] = 2.83197;
	iapp[19] = 3.40739;
	iapp[20] = -5.76464;
	iapp[21] = -9.56374;
	iapp[22] = -5.77334;
	iapp[23] = 2.82739;
	iapp[24] = -6.84317;
	iapp[25] = -6.86834;
	iapp[26] = -0.258034;
	iapp[27] = -0.471816;
	iapp[28] = -3.84289;
	iapp[29] = -3.70281;
	iapp[30] = -5.67721;
	iapp[31] = 1.8244;
	iapp[32] = -8.66329;
	iapp[33] = 3.99792;
	iapp[34] = -6.82577;
	iapp[35] = -5.59847;
	iapp[36] = 1.23707;
	iapp[37] = -3.68862;
	iapp[38] = -4.54604;
	iapp[39] = 4.11283;
	iapp[40] = -0.170141;
	iapp[41] = 0.237281;
	iapp[42] = -9.07758;
	iapp[43] = -8.10526;
	iapp[44] = -8.86425;
	iapp[45] = -9.28953;
	iapp[46] = -3.72341;
	iapp[47] = 0.655232;
	iapp[48] = -5.05325;
	iapp[49] = -4.68108;
	iapp[50] = -9.62691;
	iapp[51] = -8.53282;
	iapp[52] = -7.38884;
	iapp[53] = 3.81252;
	iapp[54] = 0.0715659;
	iapp[55] = -7.08075;
	iapp[56] = -1.63961;
	iapp[57] = -3.99533;
	iapp[58] = -4.09009;
	iapp[59] = -4.03607;
	iapp[60] = -5.86123;
	iapp[61] = 4.15403;
	iapp[62] = -0.667745;
	iapp[63] = -5.89236;
	iapp[64] = -1.58879;
	iapp[65] = -1.57781;
	iapp[66] = 0.690023;
	iapp[67] = -8.71548;
	iapp[68] = -8.09061;
	iapp[69] = -8.4962;
	iapp[70] = -0.269478;
	iapp[71] = 2.26341;
	iapp[72] = 0.794397;
	iapp[73] = 1.01733;
	iapp[74] = -7.20252;
	iapp[75] = 2.92398;
	iapp[76] = 0.197913;
	iapp[77] = -4.24802;
	iapp[78] = -6.54378;
	iapp[79] = -9.74914;
	iapp[80] = -1.38554;
	iapp[81] = 4.37422;
	iapp[82] = 0.769219;
	iapp[83] = 4.39207;
	iapp[84] = -3.88913;
	iapp[85] = 2.66762;
	iapp[86] = 1.93197;
	iapp[87] = 2.61223;
	iapp[88] = -3.17728;
	iapp[89] = -2.08136;
	iapp[90] = -1.50227;
	iapp[91] = -7.49413;
	iapp[92] = -6.292;
	iapp[93] = 1.53645;
	iapp[94] = -7.09815;
	iapp[95] = -0.705741;
	iapp[96] = 1.02374;
	iapp[97] = -6.51036;
	iapp[98] = -0.490585;
	iapp[99] = 4.55962;

	return;
}

// Function to write a .txt
int writeIappToFile (std::string const fileNameStr, std::vector<cpp_dec_float_100> &iapp, int n_p){

	ofstream myfile(fileNameStr);
	unsigned int nNeurons = iapp.size();

	cout << "Writing in file: "<< fileNameStr << endl;

	myfile.precision(n_p);								// Adjust precision
	myfile.setf( std::ios::fixed, std::ios::floatfield );
	if (myfile.is_open()){
		for (unsigned int n=0; n<nNeurons;n++) {
			myfile << "iapp[" << n << "]=" << iapp[n] <<";"<<'\n';
		}
		myfile.close();
	} else cout << "Unable to open file: "<< fileNameStr << endl;

	return 0;
}
