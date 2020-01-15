# neural-numerical-replicability
This project aims to provide tools to analyse the influence of numerical imprecision under different platforms in the context of neural computational replicability, taking as a case study a small neural network composed of Hodgkin-Huxley-type neurons. The simulated models and their parameters are described in JCN_2019_Eqs_Parameters.pdf file. The project was implemented using C/C++ program language. The Ordinary Differential Equations (ODEs) were solved using Runge–Kutta fourth-order method (RK4), implemented by Boost C++ library, specifically Boost.Numeric.Odeint module.

# Software requirements:
- C/C++ compiler (ex: gcc)
- Make builder
- Boost C++ libraries (http://www.boost.org)
    ODEint module, to solving ordinary differential equations, is include in the distribution 

The source code includes the following files:<br>
Project Tree
  - Source Code
    - checkActualPrecision.h
    - HH_BBT2017_allP.cpp
    - iappDist_allP.cpp
    - iappDist_allP.h
    - Makefile.win
    - SpikeTrain_allP.cpp
    - SpikeTrain_allP.h
    - ./results
    
  - Figures
    - Fig1_as.m
    - Fig2_as.m
    - Fig3_as.m
    - Fig2_rp.m
    - Fig3_rp.m
    - Figure1.png
    - Figure1_dt005.png
    - Figure2.png
    - Figure2_dt005.png
    - Figure3.png
    - Figure3_dt005.png
    
***After set the environment with the _C++ compile_ and the _Boost library_***
**For more informations about the code equations, check the _JCN_2019_Eqs_Parameters_**
**How to compile**
> **If your platform is Windows**
- Double
1. Open the **_double_** directory and edit the make file *MakefileWin*, with the correct path for the compiler and Boost library. Then, execute the make command.
2. After this, make sure that your have an HH_BBT2017_doubleP.exe file
3. For simulations with 100% neurons Excitatorys with vInh = 70 mV and dt = 0.01 type the following line code:
```HH_BBT2017_doubleP.exe -pExcN 1.0 -vInh 70```

- Then, It will create four files inside the results directory:
	- HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES,Epis.txt
	- HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES,Iapp.txt
	- HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES.txt
	- HH_BBT_rk4_dt0100_100_0_vI_70_t8s_double_IappDES_Spikes.m

4. For simulations with 80/20% Excitatory/Inhibitory with vInh = 70 mV and dt = 0.01 type the following line code:
```HH_BBT2017_doubleP.exe -pExcN 0.8 -vInh 70```
- Then, It will create four files inside the results directory:
	- HH_BBT_rk4_dt0100_100,20,vI70,t=8s_double_IappDES,Epis.txt
	- HH_BBT_rk4_dt0100_100,20,vI70,t=8s_double_IappDES,Iapp.txt
	- HH_BBT_rk4_dt0100_100,20,vI70,t=8s_double_IappDES.txt
	- HH_BBT_rk4_dt0100_100_20_vI_70_t8s_double_IappDES_Spikes.m

5. ***For dt = 0.05, change the line 33 in HH_BBT2017_doubleP.cpp by 'const double dt = 0.05;'. The generated files will be renamed with dt050, for example: _HH_BBT_rk4_dt050_100,0,vI70,t=8s_double_IappDES,Epis.txt_***

- LongDouble
1. Open the **_longDouble_** directory and edit the make file *MakefileWin*, with the correct path for the compiler and Boost library. Then, execute the make command.
2. After this, make sure that your have an HH_BBT2017_LongDouble.exe file
3. For simulations with 100% neurons Excitatorys with vInh = 70 mV and dt = 0.01 type the following line code:
```HH_BBT2017_LongDouble.exe -pExcN 1.0 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_LongDouble_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_LongDouble_IappDES,Iapp.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_LongDouble_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_0_vI_70_t8s_LongDouble_IappDES_Spikes.m

4. For simulations with 80/20% Excitatory/Inhibitory with vInh = 70 mV and dt = 0.01 type the following line code:
```HH_BBT2017_LongDouble.exe -pExcN 0.8 -vInh 70```
- Then, It will create four files inside the results directory:
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_LongDouble_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_LongDouble_IappDES,Iapp.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_LongDouble_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_20_vI_70_t8s_LongDouble_IappDES_Spikes.m

5. ***For dt = 0.05, change the line 38 in HH_BBT2017_LongDouble.cpp by 'const double dt = 0.05;'. The generated files will be renamed with dt050, for example: _HH_BBT_rk4_dt050_100,0,vI70,t=8s_LongDouble_IappDES,Epis_.txt_***

- Boost
1. Open the **_boost_** directory and edit the make file *MakefileWin*, with the correct path for the compiler and Boost library. Then, execute the make command.	
2. After this, make sure that your have an HH_BBT2017_Boost.exe file
3. For simulations with 100% neurons Excitatorys with vInh = 70 mV and dt = 0.01 type the following line code:
```HH_BBT2017_Boost.exe -pExcN 1.0 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_doubleBoost_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_0_vI_70_t8s_doubleBoost_IappDES_Spikes.m

4. For simulations with 80/20% Excitatory/Inhibitory with vInh = 70 mV and dt = 0.01 type the following line code:
```HH_BBT2017_Boost.exe -pExcN 0.8 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_doubleBoost_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_20_vI_70_t8s_doubleBoost_IappDES_Spikes.m

5. ***For dt = 0.05, change the line 41 in HH_BBT2017_Boost.cpp by 'const double dt = 0.05;'. The generated files will be renamed with dt050, for example: _HH_BBT_rk4_dt050_100,0,vI70,t=8s_doubleBoost_IappDES_.txt_***

> **If your platform is MacOS Linux**

- Double
1. Open the **_double_** directory and edit the make file *MakefileMacLinux*, with the correct path for the compiler and Boost library. Then, execute the make command.	
2. After this, make sure that your have an HH_BBT2017_doubleP file
3. For simulations with 100% neurons Excitatorys with vInh = 70 mV and dt = 0.01 type the following line code:
```./HH_BBT2017_doubleP -pExcN 1.0 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES,Iapp.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_0_vI_70_t8s_double_IappDES_Spikes.m

4. For simulations with 80/20% Excitatory/Inhibitory with vInh = 70 mV and dt = 0.01 type the following line code:
```./HH_BBT2017_doubleP -pExcN 0.8 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_double_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_double_IappDES,Iapp.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_double_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_20_vI_70_t8s_double_IappDES_Spikes.m

5. ***For dt = 0.05, change the line 33 in HH_BBT2017_doubleP.cpp by 'const double dt = 0.05;'. The generated files will be renamed with dt050, for example: _HH_BBT_rk4_dt050_100,0,vI70,t=8s_double_IappDES,Epis.txt_***

- LongDouble
1. Open the **_longDouble_** directory and edit the make file *MakefileMacLinux*, with the correct path for the compiler and Boost library. Then, execute the make command.
2. After this, make sure that your have an HH_BBT2017_LongDouble file
3. For simulations with 100% neurons Excitatorys with vInh = 70 mV and dt = 0.01 type the following line code:
```./HH_BBT2017_LongDouble -pExcN 1.0 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_LongDouble_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_LongDouble_IappDES,Iapp.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_LongDouble_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_0_vI_70_t8s_LongDouble_IappDES_Spikes.m

4. For simulations with 80/20% Excitatory/Inhibitory with vInh = 70 mV and dt = 0.01 type the following line code:
```./HH_BBT2017_LongDouble -pExcN 0.8 -vInh 70```
- Then, It will create four files inside the results directory:
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_LongDouble_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_LongDouble_IappDES,Iapp.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_LongDouble_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_20_vI_70_t8s_LongDouble_IappDES_Spikes.m

5. ***For dt = 0.05, change the line 38 in HH_BBT2017_LongDouble.cpp by 'const double dt = 0.05;'. The generated files will be renamed with dt050, for example: _HH_BBT_rk4_dt050_100,0,vI70,t=8s_LongDouble_IappDES,Epis_.txt_***

- Boost
1. Open the **_boost_** directory and edit the make file *MakefileMacLinux*, with the correct path for the compiler and Boost library. Then, execute the make command.	
2. After this, make sure that your have an HH_BBT2017_Boost file
3. For simulations with 100% neurons Excitatorys with vInh = 70 mV and dt = 0.01 type the following line code:
```./HH_BBT2017_Boost -pExcN 1.0 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_doubleBoost_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,0,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_0_vI_70_t8s_doubleBoost_IappDES_Spikes.m

4. For simulations with 80/20% Excitatory/Inhibitory with vInh = 70 mV and dt = 0.01 type the following line code:
```./HH_BBT2017_Boost -pExcN 0.8 -vInh 70```
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_doubleBoost_IappDES,Epis.txt
	 - HH_BBT_rk4_dt0100_100,20,vI70,t=8s_doubleBoost_IappDES.txt
	 - HH_BBT_rk4_dt0100_100_20_vI_70_t8s_doubleBoost_IappDES_Spikes.m

5. ***For dt = 0.05, change the line 41 in HH_BBT2017_Boost.cpp by 'const double dt = 0.05;'. The generated files will be renamed with dt050, for example: _HH_BBT_rk4_dt050_100,0,vI70,t=8s_doubleBoost_IappDES_.txt_***

> **How compile the Figures**

***After generated the archives for each platform and each precision***
- Figure 1
1. Open the **Fig1_as.m** file from _figures_ directory on Matlab software.
2. Set the variables 'path_to_directory' on the lines 5 (for Windows file), 18 (for MacOs file) and 31(for Linux file) for  each platform.
3. Verify that the names of the files read are the same within the directories. Line 6 for Windows, line 19 for MacOs and line 32 for Linux file.
4. Compile the file **Fig1_as.m** to generated the Figure 1.

- Figure 2 
1. Open the **Fig2_as.m** file from _figures_ directory on Matlab software.
2. Set the variables 'path_to_directory' on the lines 5 (for Windows file with neurons 100% Excitatory) and line 18 (for Windows file with neurons 80/20% Excitatory/Inhibitory).
3. Verify that the names of the files read are the same within the directories. Line 6 for neurons 100% Excitatory on Windows platform and line 19 for neurons 80/20% Excitatory/Inhibitory on Windows platform.
4. Compile the file **Fig2_as.m** to generated the Figure 2 (Without the flowchart and the Raster Plot).
5. Change the file name (line 6 and line 19) to files with name dt = 0.05; and the variable dt (line 31) for 0.05 to generate the figure with dt = 0.05.

- Figure 3 
1. Open the **Fig3_as.m** file from _figures_ directory on Matlab software.
2. Set the variables 'path_to_directory' on the lines 5 (for Windows file with neurons 100% Excitatory with _Long Double_ precision), line 18 (for Windows file with neurons 80/20% Excitatory/Inhibitory with _Long Double_ precision), line 31 (for Windows file with neurons 100% Excitatory with _Boost_ precision) and line 44 (for Windows file with neurons 80/20% Excitatory/Inhibitory with _Boost_ precision).
3. Verify that the names of the files read are the same within the directories. Line 6 for neurons 100% Excitatory on Windows platform with _Long double_ precision, line 19 for neurons 80/20% Excitatory/Inhibitory on Windows platform with _Long double_ precision, line 32 for neurons 100% Excitatory on Windows platform with _Boost_ precision, line 45 for neurons 80/20% Excitatory/Inhibitory on Windows platform with _Boost_ precision.
4. Compile the file **Fig3_as.m** to generated the Figure 3 (Without the Raster Plot).
5. Change the file name (line 6, line 19, 32 and 45) to files with name dt = 0.05; and the variable dt (line 57) for 0.05 to generate the figure with dt = 0.05.

- Figure 2 - Raster Plot
1. Open the **Fig2_rp.m** file from _figures_ directory on Matlab software.
2. Set the variables 'path_to_directory' on the lines 4 (for Windows file with neurons 100% Excitatory) and line 10 (for Windows file with neurons 80/20% Excitatory/Inhibitory).
3. Verify that the names of the files read are the same within the directories. Line 5 for neurons 100% Excitatory on Windows platform and line 11 for neurons 80/20% Excitatory/Inhibitory on Windows platform.
4. Compile the file **Fig2_rp.m** to generated the Figure 2 (Without the A,S plot and the flowchart).

- Figure 3 - Raster Plot 
1. Open the **Fig3_rp.m** file from _figures_ directory on Matlab software.
2. Set the variables 'path_to_directory' on the lines 3 (for Windows file with neurons 100% Excitatory with _Long Double_ precision), line 9 (for Windows file with neurons 80/20% Excitatory/Inhibitory with _Long Double_ precision), line 15 (for Windows file with neurons 100% Excitatory with _Boost_ precision) and line 21 (for Windows file with neurons 80/20% Excitatory/Inhibitory with _Boost_ precision).
3. Verify that the names of the files read are the same within the directories. Line 4 for neurons 100% Excitatory on Windows platform with _Long double_ precision, line 10 for neurons 80/20% Excitatory/Inhibitory on Windows platform with _Long double_ precision, line 16 for neurons 100% Excitatory on Windows platform with _Boost_ precision, line 22 for neurons 80/20% Excitatory/Inhibitory on Windows platform with _Boost_ precision.
4. Compile the file **Fig3_rp.m** to generated the Figure 3 (Without the A,S plot).
