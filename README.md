# neural-numerical-replicability
This project was implemented using C/C++ program language. The ODEs were solved using Runge–Kutta fourth-order method (RK4), implemented by Boost C++ library, specifically Boost.Numeric.Odeint module.

# Software requirements:
- C/C++ compiler (ex: gcc)<br>
- Boost C++ libraries (http://www.boost.org)
    ODEint module, to solving ordinary differential equations, is include in the distribution 

The source code includes the following files:
ProjetTree
  Double precision
    HH_BBT2017_doubleP.cpp
    iappDist_doubleP.cpp
    iappDist_doubleP.h
    SpikeTrain_doubleP.cpp
    SpikeTrain_doubleP.h
  
  Long Double precision
    HH_BBT2017_longDoubleP.cpp
    iappDist_longDoubleP.cpp
    iappDist_longDoubleP.h
    SpikeTrain_longDoubleP.cpp
    SpikeTrain_longDoubleP.h
    
  Boost Double precision
    HH_BBT2017_doubleBoostP.cpp
    iappDist_doubleBoostP.cpp
    iappDist_doubleBoostP.h
    SpikeTrain_doubleBoostP.cpp
    SpikeTrain_doubleBoostP.h

# To execute the six scenarios: 
  Double precision:
    // A neural network composed of 100 excitatory neurons 
    $	HH_BBT2017_doubleP -pExcN 1.0  
    // A neural network composed of 80/20 of excitatory/inhibitory neurons respectively. 
    $	HH_BBT2017_doubleP -pExcN 0.8 -vInh 10 

  Long Double precision
    // A neural network composed of 100 excitatory neurons with C/C++ long double precision 
    $	HH_BBT2017_longDoubleP -pExcN 1.0  
    // A neural network composed of 80/20 of excitatory/inhibitory neurons respectively with C/C++ long double precision 
    $	HH_BBT2017_longDoubleP -pExcN 0.8 -vInh 10 
  
  Boost Double precision
    // A neural network composed of 100 excitatory neurons with floating-point with 100 decimals digits precision implemented by Boost 
    $	HH_BBT2017_doubleBoostP -pExcN 1.0 
    // A neural network composed of 80/20 of excitatory/inhibitory neurons respectively with 100 decimals digits precision implemented by Boost
    $ HH_BBT2017_doubleBoostP -pExcN 0.8 -vInh 10 
