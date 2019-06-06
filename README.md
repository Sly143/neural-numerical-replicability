# neural-numerical-replicability
This project was implemented using C/C++ program language. The ODEs were solved using Runge–Kutta fourth-order method (RK4), implemented by Boost C++ library, specifically Boost.Numeric.Odeint module.

# Software requirements:
- C/C++ compiler (ex: gcc)
- Boost C++ libraries (http://www.boost.org)
    ODEint module, to solving ordinary differential equations, is include in the distribution 

The source code includes the following files:<br>
ProjetTree
  - Double precision
    - HH_BBT2017_doubleP.cpp
    - iappDist_doubleP.cpp
    - iappDist_doubleP.h
    - SpikeTrain_doubleP.cpp
    - SpikeTrain_doubleP.h
  
  - Long Double precision
    - HH_BBT2017_longDoubleP.cpp
    - iappDist_longDoubleP.cpp
    - iappDist_longDoubleP.h
    - SpikeTrain_longDoubleP.cpp
    - SpikeTrain_longDoubleP.h
    
  - Boost Double precision
    - HH_BBT2017_doubleBoostP.cpp
    - iappDist_doubleBoostP.cpp
    - iappDist_doubleBoostP.h
    - SpikeTrain_doubleBoostP.cpp
    - SpikeTrain_doubleBoostP.h

# To execute the six scenarios: 
  Double precision:<br>
    // A neural network composed of 100 excitatory neurons <br>
    $	HH_BBT2017_doubleP -pExcN 1.0  <br>
    // A neural network composed of 80/20 of excitatory/inhibitory neurons respectively. <br>
    $	HH_BBT2017_doubleP -pExcN 0.8 -vInh 10 <br>

  Long Double precision<br>
    // A neural network composed of 100 excitatory neurons with C/C++ long double precision <br>
    $	HH_BBT2017_longDoubleP -pExcN 1.0  <br>
    // A neural network composed of 80/20 of excitatory/inhibitory neurons respectively with C/C++ long double precision <br>
    $	HH_BBT2017_longDoubleP -pExcN 0.8 -vInh 10 <br>
  
  Boost Double precision<br>
    // A neural network composed of 100 excitatory neurons with floating-point with 100 decimals digits precision implemented by Boost <br>
    $	HH_BBT2017_doubleBoostP -pExcN 1.0 <br>
    // A neural network composed of 80/20 of excitatory/inhibitory neurons respectively with 100 decimals digits precision implemented by Boost<br>
    $ HH_BBT2017_doubleBoostP -pExcN 0.8 -vInh 10 <br>
