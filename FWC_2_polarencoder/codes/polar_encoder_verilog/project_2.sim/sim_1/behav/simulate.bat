@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim polar_tb1_behav -key {Behavioral:sim_1:Functional:polar_tb1} -tclbatch polar_tb1.tcl -view C:/Users/VENKATASAI MANNAVA/project_2/polar_tb1_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
