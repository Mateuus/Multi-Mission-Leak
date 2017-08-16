/*
	File: ksk-base.sqf 
	Author: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:162 | SOG Basis
*/

_initCodes = [];

//Mauer
_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_Razorwire_F" createvehiclelocal [9878.59,19453.4,0];
	_vehicle_001 = _this;
	_this setDir 510.691;
	_this setPos [9878.59,19453.4,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_CncWall4_F" createvehiclelocal [9940.68,19345.6,0];
	_vehicle_002 = _this;
	_this setDir 810.244;
	_this setPos [9940.68,19345.6,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_CncWall4_F" createvehiclelocal [9938.56,19347.7,0];
	_vehicle_003 = _this;
	_this setDir 720.803;
	_this setPos [9938.56,19347.7,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_HBarrier_3_F" createvehiclelocal [9958.63,19335.2,0];
	_vehicle_004 = _this;
	_this setDir 719.058;
	_this setPos [9958.63,19335.2,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_HBarrier_3_F" createvehiclelocal [9962.04,19335.6,0];
	_vehicle_005 = _this;
	_this setDir 709.986;
	_this setPos [9962.04,19335.6,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_HBarrier_3_F" createvehiclelocal [9964.99,19336.2,0];
	_vehicle_006 = _this;
	_this setDir 886.983;
	_this setPos [9964.99,19336.2,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_HBarrier_1_F" createvehiclelocal [9966.41,19336.7,0];
	_vehicle_007 = _this;
	_this setDir 779.203;
	_this setPos [9966.41,19336.7,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_BagFence_Long_F" createvehiclelocal [9942.18,19338.4,0];
	_vehicle_008 = _this;
	_this setDir 809.569;
	_this setPos [9942.18,19338.4,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_BagFence_Long_F" createvehiclelocal [9942.22,19336.5,0];
	_vehicle_009 = _this;
	_this setDir 629.828;
	_this setPos [9942.22,19336.5,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_CncWall4_F" createvehiclelocal [9940.68,19341.6,0];
	_vehicle_010 = _this;
	_this setDir 810.244;
	_this setPos [9940.68,19341.6,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_Gate_F" createvehiclelocal [9853.97,19417.4,0];
	_vehicle_011 = _this;
	_this setDir 809.569;
	_this setPos [9853.97,19417.4,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [9854.37,19408.5,0];
	_vehicle_012 = _this;
	_this setDir 809.569;
	_this setPos [9854.37,19408.5,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [9854.44,19400.7,0];
	_vehicle_013 = _this;
	_this setDir 809.569;
	_this setPos [9854.44,19400.7,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [9854.48,19393,0];
	_vehicle_014 = _this;
	_this setDir 809.569;
	_this setPos [9854.48,19393,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [9854.26,19426.3,0];
	_vehicle_015 = _this;
	_this setDir 809.569;
	_this setPos [9854.26,19426.3,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [9857.52,19429.9,0];
	_vehicle_016 = _this;
	_this setDir 899.802;
	_this setPos [9857.52,19429.9,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9858.85,19379.6,0];
	_vehicle_017 = _this;
	_this setDir 788.418;
	_this setPos [9858.85,19379.6,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9888.82,19367.7,0];
	_vehicle_018 = _this;
	_this setDir 547.888;
	_this setPos [9888.82,19367.7,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9937.14,19332.6,0];
	_vehicle_019 = _this;
	_this setDir 721.465;
	_this setPos [9937.14,19332.6,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9865.46,19429,0.7];
	_vehicle_020 = _this;
	_this setDir 874.419;
	_this setPos [9865.46,19429,0.7];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9869.64,19371.1,0];
	_vehicle_021 = _this;
	_this setDir 558.806;
	_this setPos [9869.64,19371.1,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.54,19370.8,-1.3];
	_vehicle_022 = _this;
	_this setDir 268.567;
	_this setPos [9935.54,19370.8,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9982.99,19353.8,-0.4];
	_vehicle_023 = _this;
	_this setDir 268.263;
	_this setPos [9982.99,19353.8,-0.4];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9894.77,19364.9,0];
	_vehicle_024 = _this;
	_this setDir 769.308;
	_this setPos [9894.77,19364.9,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9970.92,19374.4,-0.2];
	_vehicle_025 = _this;
	_this setDir 175;
	_this setPos [9970.92,19374.4,-0.2];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_HBarrier_3_F" createvehiclelocal [9952.31,19334.8,0];
	_vehicle_026 = _this;
	_this setDir 709.986;
	_this setPos [9952.31,19334.8,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9878.53,19435.3,1.3];
	_vehicle_027 = _this;
	_this setDir 874.419;
	_this setPos [9878.53,19435.3,1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9871.96,19432.2,1.78];
	_vehicle_028 = _this;
	_this setDir 874.419;
	_this setPos [9871.96,19432.2,1.78];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9885.13,19438.4,-0.6];
	_vehicle_029 = _this;
	_this setDir 874.419;
	_this setPos [9885.13,19438.4,-0.6];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9890.52,19440.6,-1.3];
	_vehicle_030 = _this;
	_this setDir 881.111;
	_this setPos [9890.52,19440.6,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9894.98,19443.3,0.8];
	_vehicle_031 = _this;
	_this setDir 830.967;
	_this setPos [9894.98,19443.3,0.8];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9900.6,19447,0.4];
	_vehicle_032 = _this;
	_this setDir 718.586;
	_this setPos [9900.6,19447,0.4];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9909.21,19447.4,0];
	_vehicle_033 = _this;
	_this setDir 718.586;
	_this setPos [9909.21,19447.4,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9917.32,19447.3,0.4];
	_vehicle_034 = _this;
	_this setDir 721.622;
	_this setPos [9917.32,19447.3,0.4];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9924.65,19444.2,0.6];
	_vehicle_035 = _this;
	_this setDir 759.373;
	_this setPos [9924.65,19444.2,0.6];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9931.02,19438.6,0.2];
	_vehicle_036 = _this;
	_this setDir 765.991;
	_this setPos [9931.02,19438.6,0.2];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9936.91,19432.7,0];
	_vehicle_037 = _this;
	_this setDir 765.991;
	_this setPos [9936.91,19432.7,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9941.33,19427.4,-0.4];
	_vehicle_038 = _this;
	_this setDir 794.264;
	_this setPos [9941.33,19427.4,-0.4];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9857.24,19402.6,-0.2];
	_vehicle_039 = _this;
	_this setDir 809.569;
	_this setPos [9857.24,19402.6,-0.2];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9857.32,19394.7,-0.2];
	_vehicle_040 = _this;
	_this setDir 809.569;
	_this setPos [9857.32,19394.7,-0.2];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9857.4,19386.7,-0.2];
	_vehicle_041 = _this;
	_this setDir 809.569;
	_this setPos [9857.4,19386.7,-0.2];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9863.41,19374.6,0];
	_vehicle_042 = _this;
	_this setDir 571.095;
	_this setPos [9863.41,19374.6,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9876.02,19369.4,0];
	_vehicle_043 = _this;
	_this setDir 547.888;
	_this setPos [9876.02,19369.4,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9882.8,19368.4,0];
	_vehicle_044 = _this;
	_this setDir 543.888;
	_this setPos [9882.8,19368.4,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9894.68,19364.9,-2.0];
	_vehicle_045 = _this;
	_this setDir 769.308;
	_this setPos [9894.68,19364.9,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9899.97,19359,-2.0];
	_vehicle_046 = _this;
	_this setDir 771.308;
	_this setPos [9899.97,19359,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9905.15,19352.4,-2.0];
	_vehicle_047 = _this;
	_this setDir 773.308;
	_this setPos [9905.15,19352.4,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9910.37,19346.3,0];
	_vehicle_048 = _this;
	_this setDir 770.308;
	_this setPos [9910.37,19346.3,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9916.04,19340.2,0];
	_vehicle_049 = _this;
	_this setDir 770.308;
	_this setPos [9916.04,19340.2,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9921.89,19334.7,0];
	_vehicle_050 = _this;
	_this setDir 757.506;
	_this setPos [9921.89,19334.7,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9928.88,19332.3,0];
	_vehicle_051 = _this;
	_this setDir 721.465;
	_this setPos [9928.88,19332.3,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.54,19370.8,0];
	_vehicle_052 = _this;
	_this setDir 268.567;
	_this setPos [9935.54,19370.8,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_053 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.69,19407.8,1.8];
	_vehicle_053 = _this;
	_this setDir 268.567;
	_this setPos [9934.69,19407.8,1.8];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.3633, 19370.633, 1.3];
	_vehicle_054 = _this;
	_this setDir 268.567;
	_this setPos [9935.3633, 19370.633, 1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_056 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.42,19376.3,0];
	_vehicle_056 = _this;
	_this setDir 268.567;
	_this setPos [9935.42,19376.3,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_057 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.39,19376.3,-1.3];
	_vehicle_057 = _this;
	_this setDir 268.567;
	_this setPos [9935.39,19376.3,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_058 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.2637, 19376.084, 1.3];
	_vehicle_058 = _this;
	_this setDir 268.567;
	_this setPos [9935.2637, 19376.084, 1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_059 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.26,19381.7,0];
	_vehicle_059 = _this;
	_this setDir 268.567;
	_this setPos [9935.26,19381.7,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_060 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.23,19381.7,-1.3];
	_vehicle_060 = _this;
	_this setDir 268.567;
	_this setPos [9935.23,19381.7,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_061 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.248, 19381.555, 1.3];
	_vehicle_061 = _this;
	_this setDir 268.567;
	_this setPos [9935.248, 19381.555, 1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_062 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.15,19387.1,0];
	_vehicle_062 = _this;
	_this setDir 268.567;
	_this setPos [9935.15,19387.1,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_063 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.12,19387.1,-1.3];
	_vehicle_063 = _this;
	_this setDir 268.567;
	_this setPos [9935.12,19387.1,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_064 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.9297, 19386.908, 1.3];
	_vehicle_064 = _this;
	_this setDir 268.567;
	_this setPos [9934.9297, 19386.908, 1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_065 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935.03,19392.4,0];
	_vehicle_065 = _this;
	_this setDir 268.567;
	_this setPos [9935.03,19392.4,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_066 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9935,19392.5,-1.3];
	_vehicle_066 = _this;
	_this setDir 268.567;
	_this setPos [9935,19392.5,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_067 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.7432, 19392.361, 1.3];
	_vehicle_067 = _this;
	_this setDir 268.567;
	_this setPos [9934.7432, 19392.361, 1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_068 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.92,19397.7,0];
	_vehicle_068 = _this;
	_this setDir 268.567;
	_this setPos [9934.92,19397.7,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_069 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.89,19397.7,-1.3];
	_vehicle_069 = _this;
	_this setDir 268.567;
	_this setPos [9934.89,19397.7,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_070 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.8037, 19397.691, 1.3];
	_vehicle_070 = _this;
	_this setDir 268.567;
	_this setPos [9934.8037, 19397.691, 1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_071 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.8,19403,0];
	_vehicle_071 = _this;
	_this setDir 268.567;
	_this setPos [9934.8,19403,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_072 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.77,19403,-1.3];
	_vehicle_072 = _this;
	_this setDir 268.567;
	_this setPos [9934.77,19403,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_073 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.77,19403,1.3];
	_vehicle_073 = _this;
	_this setDir 268.567;
	_this setPos [9934.77,19403,1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_074 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9936.88,19371.6,0];
	_vehicle_074 = _this;
	_this setDir 359.29;
	_this setPos [9936.88,19371.6,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_075 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9942.12,19371.7,0];
	_vehicle_075 = _this;
	_this setDir 359.29;
	_this setPos [9942.12,19371.7,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_076 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9947.35,19371.7,0];
	_vehicle_076 = _this;
	_this setDir 359.29;
	_this setPos [9947.35,19371.7,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_077 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9936.92,19371.6,-1.3];
	_vehicle_077 = _this;
	_this setDir 359.29;
	_this setPos [9936.92,19371.6,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_078 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9942.12,19371.7,-1.3];
	_vehicle_078 = _this;
	_this setDir 359.29;
	_this setPos [9942.12,19371.7,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_079 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9947.39,19371.7,-1.3];
	_vehicle_079 = _this;
	_this setDir 359.29;
	_this setPos [9947.39,19371.7,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_080 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9937.18,19332.6,-2.0];
	_vehicle_080 = _this;
	_this setDir 721.465;
	_this setPos [9937.18,19332.6,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_081 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9928.88,19332.3,-2.0];
	_vehicle_081 = _this;
	_this setDir 721.465;
	_this setPos [9928.88,19332.3,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_082 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9921.85,19334.7,-2.0];
	_vehicle_082 = _this;
	_this setDir 757.506;
	_this setPos [9921.85,19334.7,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_083 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9916.08,19340.2,-2.0];
	_vehicle_083 = _this;
	_this setDir 770.308;
	_this setPos [9916.08,19340.2,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_084 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9910.41,19346.3,-2.0];
	_vehicle_084 = _this;
	_this setDir 770.308;
	_this setPos [9910.41,19346.3,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_085 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9904.88,19352.3,0];
	_vehicle_085 = _this;
	_this setDir 773.308;
	_this setPos [9904.88,19352.3,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_086 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9899.54,19358.6,0];
	_vehicle_086 = _this;
	_this setDir 771.308;
	_this setPos [9899.54,19358.6,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_087 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9888.86,19367.8,-2.0];
	_vehicle_087 = _this;
	_this setDir 547.888;
	_this setPos [9888.86,19367.8,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_088 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9882.8,19368.4,-2.0];
	_vehicle_088 = _this;
	_this setDir 543.888;
	_this setPos [9882.8,19368.4,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_089 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9876.04,19369.4,-2.0];
	_vehicle_089 = _this;
	_this setDir 547.888;
	_this setPos [9876.04,19369.4,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_090 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9869.68,19371.2,-2.0];
	_vehicle_090 = _this;
	_this setDir 558.806;
	_this setPos [9869.68,19371.2,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_091 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9863.45,19374.5,-2.0];
	_vehicle_091 = _this;
	_this setDir 571.095;
	_this setPos [9863.45,19374.5,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_092 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9858.89,19379.7,-2.0];
	_vehicle_092 = _this;
	_this setDir 788.418;
	_this setPos [9858.89,19379.7,-2.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_093 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9889.2979, 19439.613, 1.0];
	_vehicle_093 = _this;
	_this setDir 881.11102;
	_this setPos [9889.2979, 19439.613, 1.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_094 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9878.57,19435.4,-0.8];
	_vehicle_094 = _this;
	_this setDir 874.419;
	_this setPos [9878.57,19435.4,-0.8];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_095 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9872,19432.2,-0.22];
	_vehicle_095 = _this;
	_this setDir 874.419;
	_this setPos [9872,19432.2,-0.22];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_096 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9865.46,19429,-1.3];
	_vehicle_096 = _this;
	_this setDir 874.419;
	_this setPos [9865.46,19429,-1.3];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_097 = objNull;
if (true) then
{
	_this = "Land_HBarrierBig_F" createvehiclelocal [9885.17,19438.5,-2.4];
	_vehicle_097 = _this;
	_this setDir 874.419;
	_this setPos [9885.17,19438.5,-2.4];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_098 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.69,19407.8,-0.2];
	_vehicle_098 = _this;
	_this setDir 268.567;
	_this setPos [9934.69,19407.8,-0.2];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_099 = objNull;
if (true) then
{
	_this = "Land_HBarrier_3_F" createvehiclelocal [9936.95,19410.6,1.6];
	_vehicle_099 = _this;
	_this setDir 196.431;
	_this setPos [9936.95,19410.6,1.6];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9938.22,19410.2,1.6];
	_vehicle_100 = _this;
	_this setDir 295.837;
	_this setPos [9938.22,19410.2,1.6];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9940.39,19414.9,1.9];
	_vehicle_101 = _this;
	_this setDir 287.999;
	_this setPos [9940.39,19414.9,1.9];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9942.15,19419.6,1.8];
	_vehicle_102 = _this;
	_this setDir 273.333;
	_this setPos [9942.15,19419.6,1.8];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9934.8,19407.8,1];
	_vehicle_103 = _this;
	_this setDir 268.567;
	_this setPos [9934.8,19407.8,1];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = "Land_HBarrier_3_F" createvehiclelocal [9936.95,19410.6,1];
	_vehicle_104 = _this;
	_this setDir 196.431;
	_this setPos [9936.95,19410.6,1];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9938.22,19410.2,1];
	_vehicle_105 = _this;
	_this setDir 295.837;
	_this setPos [9938.22,19410.2,1];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9940.39,19414.9,1.2];
	_vehicle_106 = _this;
	_this setDir 287.999;
	_this setPos [9940.39,19414.9,1.2];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = "Land_HBarrier_5_F" createvehiclelocal [9942.15,19419.6,1.0];
	_vehicle_107 = _this;
	_this setDir 273.333;
	_this setPos [9942.15,19419.6,1.0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

//Housing
//Zimmer 1
_vehicle_108 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9944.69,19345.4,0.485336];
	_vehicle_108 = _this;
	_this setVehicleVarName "ksk_01";
	ksc_01 = _this;
	_this setDir 89.3945;
	_this setPos [9944.69,19345.4,0.485336];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 1"", EMonkeys_fnc_houseMenu, ""ksk_01"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 1"",EMonkeys_fnc_houseInventory, ""ksk_01"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 1"",{[""ksk_01""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_01"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_109 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9944.86,19347.1,0.565506];
	_vehicle_109 = _this;
	_this setDir 269.701;
	_this setPos [9944.86,19347.1,0.565506];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_01"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 2
_vehicle_110 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9956.42,19345.3,0.579086];
	_vehicle_110 = _this;
	_this setVehicleVarName "ksk_02";
	ksk_02 = _this;
	_this setDir 268.31;
	_this setPos [9956.42,19345.3,0.579086];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 2"", EMonkeys_fnc_houseMenu, ""ksk_02"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 2"",EMonkeys_fnc_houseInventory, ""ksk_02"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 2"",{[""ksk_02""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_02"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_111 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9956.27,19347.3,0.604141];
	_vehicle_111 = _this;
	_this setDir 89.0428;
	_this setPos [9956.27,19347.3,0.604141];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_02"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 3
_vehicle_112 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9965.04,19345.4,0.579071];
	_vehicle_112 = _this;
	_this setVehicleVarName "ksk_03";
	ksk_03 = _this;
	_this setDir 270.266;
	_this setPos [9965.04,19345.4,0.579071];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 3"", EMonkeys_fnc_houseMenu, ""ksk_03"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 3"",EMonkeys_fnc_houseInventory, ""ksk_03"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 3"",{[""ksk_03""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_03"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_113 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9964.65,19347.3,0.604141];
	_vehicle_113 = _this;
	_this setDir 89.0428;
	_this setPos [9964.65,19347.3,0.604141];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_03"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 4
_vehicle_114 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9972.03,19345.5,0.585175];
	_vehicle_114 = _this;
	_this setVehicleVarName "ksk_04";
	ksk_04 = _this;
	_this setDir 270.906;
	_this setPos [9972.03,19345.5,0.585175];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 4"", EMonkeys_fnc_houseMenu, ""ksk_04"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 4"",EMonkeys_fnc_houseInventory, ""ksk_04"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 4"",{[""ksk_04""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_04"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_115 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9971.78,19347.4,0.607758];
	_vehicle_115 = _this;
	_this setDir 89.0428;
	_this setPos [9971.78,19347.4,0.607758];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_04"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 5
_vehicle_116 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9966.25,19352.7,0];
	_vehicle_116 = _this;
	_this setVehicleVarName "ksk_05";
	ksk_05 = _this;
	_this setDir 90.44;
	_this setPos [9966.25,19352.7,0.582703];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 5"", EMonkeys_fnc_houseMenu, ""ksk_05"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 5"",EMonkeys_fnc_houseInventory, ""ksk_05"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 5"",{[""ksk_05""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_05"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_117 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9966.59,19350.9,0.605408];
	_vehicle_117 = _this;
	_this setDir 268.595;
	_this setPos [9966.59,19350.9,0.605408];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_05"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 6
_vehicle_118 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9950.98,19352.6,0.588013];
	_vehicle_118 = _this;
	_this setVehicleVarName "ksk_06";
	ksk_06 = _this;
	_this setDir 89.79;
	_this setPos [9950.98,19352.6,0.588013];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 6"", EMonkeys_fnc_houseMenu, ""ksk_06"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 6"",EMonkeys_fnc_houseInventory, ""ksk_06"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 6"",{[""ksk_06""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_06"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_119 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9951.31,19350.7,0.606354];
	_vehicle_119 = _this;
	_this setDir 268.955;
	_this setPos [9951.31,19350.7,0.606354];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_06"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 7
_vehicle_120 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9949.67,19352.5,0.589523];
	_vehicle_120 = _this;
	_this setVehicleVarName "ksk_07";
	ksk_07 = _this;
	_this setDir 270.895;
	_this setPos [9949.67,19352.5,0.589523];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 7"", EMonkeys_fnc_houseMenu, ""ksk_07"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 7"",EMonkeys_fnc_houseInventory, ""ksk_07"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 7"",{[""ksk_07""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_07"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_121 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9949.4,19350.8,0.611694];
	_vehicle_121 = _this;
	_this setDir 89.0427;
	_this setPos [9949.4,19350.8,0.611694];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_07"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 8
_vehicle_122 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9945,19345.4,3.8056];
	_vehicle_122 = _this;
	_this setVehicleVarName "ksk_08";
	ksk_08 = _this;
	_this setDir 88.6992;
	_this setPos [9945,19345.4,3.8056];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 8"", EMonkeys_fnc_houseMenu, ""ksk_08"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 8"",EMonkeys_fnc_houseInventory, ""ksk_08"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 8"",{[""ksk_08""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_08"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_123 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9945.04,19347.1,3.9035];
	_vehicle_123 = _this;
	_this setDir 268.847;
	_this setPos [9945.04,19347.1,3.9035];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_08"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  "];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 9
_vehicle_124 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9956.47,19345.3,3.91306];
	_vehicle_124 = _this;
	_this setVehicleVarName "ksk_09";
	ksk_09 = _this;
	_this setDir 268.478;
	_this setPos [9956.47,19345.3,3.91306];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 9"", EMonkeys_fnc_houseMenu, ""ksk_09"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 9"",EMonkeys_fnc_houseInventory, ""ksk_09"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 9"",{[""ksk_09""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_09"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_125 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9956.2,19347.3,3.93813];
	_vehicle_125 = _this;
	_this setDir 90.0001;
	_this setPos [9956.2,19347.3,0];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_09"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  "];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 10
_vehicle_126 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9964.87,19346.9,3.91306];
	_vehicle_126 = _this;
	_this setVehicleVarName "ksk_10";
	ksk_10 = _this;
	_this setDir 267.328;
	_this setPos [9964.87,19346.9,3.91306];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 10"", EMonkeys_fnc_houseMenu, ""ksk_10"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 10"",EMonkeys_fnc_houseInventory, ""ksk_10"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 10"",{[""ksk_10""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_10"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_127 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9957.9,19344.9,3.96431];
	_vehicle_127 = _this;
	_this setDir 269.384;
	_this setPos [9957.9,19344.9,3.96431];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_10"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  "];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 11
_vehicle_128 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9971.83,19345.5,3.9189];
	_vehicle_128 = _this;
	_this setVehicleVarName "ksk_11";
	ksk_11 = _this;
	_this setDir 269.806;
	_this setPos [9971.83,19345.5,3.9189];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 11"", EMonkeys_fnc_houseMenu, ""ksk_11"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 11"",EMonkeys_fnc_houseInventory, ""ksk_11"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 11"",{[""ksk_11""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_11"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_129 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9971.94,19347.3,3.94182];
	_vehicle_129 = _this;
	_this setDir 88.3154;
	_this setPos [9971.94,19347.3,3.94182];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_11"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  "];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 12
_vehicle_130 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9966.21,19352.7,3.91673];
	_vehicle_130 = _this;
	_this setVehicleVarName "ksk_12";
	ksk_12 = _this;
	_this setDir 87.768;
	_this setPos [9966.21,19352.7,3.91673];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 12"", EMonkeys_fnc_houseMenu, ""ksk_12"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 12"",EMonkeys_fnc_houseInventory, ""ksk_12"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 12"",{[""ksk_12""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_12"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_131 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9966.43,19350.8,3.93916];
	_vehicle_131 = _this;
	_this setDir 270.491;
	_this setPos [9966.43,19350.8,3.93916];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_12"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  "];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 13
_vehicle_132 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9951.12,19352.5,3.92171];
	_vehicle_132 = _this;
	_this setVehicleVarName "ksk_13";
	ksk_13 = _this;
	_this setDir 89.9361;
	_this setPos [9951.12,19352.5,3.92171];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 13"", EMonkeys_fnc_houseMenu, ""ksk_13"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 13"",EMonkeys_fnc_houseInventory, ""ksk_13"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 13"",{[""ksk_13""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_13"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_133 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9951.18,19350.6,3.94006];
	_vehicle_133 = _this;
	_this setDir 270;
	_this setPos [9951.18,19350.6,3.94006];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_13"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  "];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 14
_vehicle_134 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createvehiclelocal [9949.75,19352.6,3.92368];
	_vehicle_134 = _this;
	_this setVehicleVarName "ksk_14";
	ksk_14 = _this;
	_this setDir 269.021;
	_this setPos [9949.75,19352.6,3.92368];
	_initCodes pushBack [_this,"this addAction [""SOG Zimmer 14"", EMonkeys_fnc_houseMenu, ""ksk_14"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Inventar Zimmer 14"",EMonkeys_fnc_houseInventory, ""ksk_14"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  this addAction [""Lager Zimmer 14"",{[""ksk_14""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_14"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_135 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_F" createvehiclelocal [9949.44,19350.8,3.94566];
	_vehicle_135 = _this;
	_this setDir 89.0308;
	_this setPos [9949.44,19350.8,3.94566];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ksk_14"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3'];  "];
	_this allowDamage false;
	_this enableSimulation false;
};

//Zimmer 15
_vehicle_136 = objNull;
if (true) then
{
	_this = "Land_Cargo20_blue_F" createvehiclelocal [9956.84,19368.3,0];
	_vehicle_136 = _this;
	_this setVehicleVarName "ksk_15";
	ksk_15 = _this;
	_this setDir 88.0752;
	_this setPos [9956.84,19368.3,0];
	_initCodes pushBack [_this,"this addAction [""SOG Base"", EMonkeys_fnc_houseMenu, ""ksk_15"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3']; this addAction [""Lager der Basis"",{[""ksk_15""] spawn open_house_inventory},"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 7'];"];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_137 = objNull;
if (true) then
{
	_this = "Land_Cargo20_light_blue_F" createvehiclelocal [9954.19,19368.1,0];
	_vehicle_137 = _this;
	_this setDir 86.8891;
	_this setPos [9954.19,19368.1,0];
	_initCodes pushBack [_this," this addAction [""Inventar der Basis"",EMonkeys_fnc_houseInventory, ""ksk_15"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 7'];this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ksk_15"",6,true,true,"""",' playerSide == west && vehicle player == player && player distance _target < 3  '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

//Lampen
_vehicle_153 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9905.58,19359.4,0];
	_vehicle_153 = _this;
	_this setDir 60;
	_this setPos [9905.58,19359.4,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9858.85,19405.5,0];
	_vehicle_154 = _this;
	_this setPos [9858.85,19405.5,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9858.69,19428.6,0];
	_vehicle_155 = _this;
	_this setPos [9858.69,19428.6,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9926.2,19408.3,0];
	_vehicle_156 = _this;
	_this setDir 270;
	_this setPos [9926.2,19408.3,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9932.39,19434.6,0];
	_vehicle_157 = _this;
	_this setDir 135;
	_this setPos [9932.39,19434.6,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9961.84,19371.6,0];
	_vehicle_158 = _this;
	_this setDir 90;
	_this setPos [9961.84,19371.6,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9980.79,19355.3,0];
	_vehicle_159 = _this;
	_this setDir 180;
	_this setPos [9980.79,19355.3,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9954.29,19335.4,0];
	_vehicle_160 = _this;
	_this setDir 270;
	_this setPos [9954.29,19335.4,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [9904.21,19356.6,0];
	_vehicle_161 = _this;
	_this setDir 320;
	_this setPos [9904.21,19356.6,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createvehiclelocal [9907.98,19430.8,0];
	_vehicle_162 = _this;
	_this setDir -346.076;
	_this setPos [9907.98,19430.8,0];
	_this allowDamage false;
};

_vehicle_163 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createvehiclelocal [9907.25,19418.5,0];
	_vehicle_163 = _this;
	_this setDir -346.076;
	_this setPos [9907.25,19418.5,0];
	_this allowDamage false;
};

_vehicle_164 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createvehiclelocal [9901.08,19428.4,0];
	_vehicle_164 = _this;
	_this setDir -406.322;
	_this setPos [9901.08,19428.4,0];
	_this allowDamage false;
};

_vehicle_165 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createvehiclelocal [9912.72,19420.2,0];
	_vehicle_165 = _this;
	_this setDir -406.322;
	_this setPos [9912.72,19420.2,0];
	_this allowDamage false;
};

_vehicle_166 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createvehiclelocal [9901.2,19420.4,0];
	_vehicle_166 = _this;
	_this setDir -470.155;
	_this setPos [9901.2,19420.4,0];
	_this allowDamage false;
};

_vehicle_167 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createvehiclelocal [9912.79,19429,0];
	_vehicle_167 = _this;
	_this setDir -470.155;
	_this setPos [9912.79,19429,0];
	_this allowDamage false;
};

//Gebäude,Verschönerungen
_vehicle_168 = objNull;
if (true) then
{
	_this = "Land_Radar_Small_F" createvehiclelocal [9935.74,19342.5,0];
	_vehicle_168 = _this;
	_this setDir -89.737;
	_this setPos [9935.74,19342.5,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = "Land_Communication_F" createvehiclelocal [9934.65,19347.9,0];
	_vehicle_169 = _this;
	_this setDir -89.737;
	_this setPos [9934.65,19347.9,0];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = "CamoNet_BLUFOR_big_F" createvehiclelocal [9921.5,19436,0];
	_vehicle_170 = _this;
	_this setDir 400.719;
	_this setPos [9921.5,19436,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_171 = objNull;
if (true) then
{
	_this = "Land_PaperBox_open_full_F" createvehiclelocal [9921.5,19439.9,0];
	_vehicle_171 = _this;
	_this setDir 491.048;
	_this setPos [9921.5,19439.9,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_172 = objNull;
if (true) then
{
	_this = "Land_PaperBox_open_full_F" createvehiclelocal [9921.94,19437.4,0];
	_vehicle_172 = _this;
	_this setDir 491.048;
	_this setPos [9921.94,19437.4,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_173 = objNull;
if (true) then
{
	_this = "Land_PaperBox_open_full_F" createvehiclelocal [9919.25,19436.7,0];
	_vehicle_173 = _this;
	_this setDir 491.048;
	_this setPos [9919.25,19436.7,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_174 = objNull;
if (true) then
{
	_this = "Land_Pallet_MilBoxes_F" createvehiclelocal [9924.81,19436.8,0];
	_vehicle_174 = _this;
	_this setDir 491.048;
	_this setPos [9924.81,19436.8,0];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_175 = objNull;
if (true) then
{
	_this = "Land_Pallet_MilBoxes_F" createvehiclelocal [9923.82,19434.7,0];
	_vehicle_175 = _this;
	_this setDir 491.048;
	_this setPos [9923.82,19434.7,0];
	_this allowDamage false;
	_this enableSimulation false;
};

//Garagen,Shops
_vehicle_176 = objNull;
if (true) then
{
	_this = "Land_InfoStand_V2_F" createvehiclelocal [9926.49,19423.7,0];
	_vehicle_176 = _this;
	_this setDir 90;
	_this setPos [9926.49,19423.7,0];
	_initCodes pushBack [_this,"this addAction[""KFZ Händler SOG"",EMonkeys_fnc_vehicleShopMenu,[""sog_car"",""ksk_vehicle_spawn"",[civilian,opfor]],0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""KSK""] call EMonkeys_fnc_permLevel > 0)']; this addAction[""Helikopterhanger"",EMonkeys_fnc_vehicleGarageMenu,[""air"",""ksk_vehicle_spawn"",[""air""],[civilian,opfor]],0,false,false,"""",'vehicle player == player && player distance _target < 3 && ([""KSK""] call EMonkeys_fnc_permLevel > 0)']; this addAction[""Garage"",EMonkeys_fnc_vehicleGarageMenu,[""car"",""ksk_vehicle_spawn"",[""atv"",""car"",""truck"",""armored""],[civilian,opfor]],0,false,false,"""",'vehicle player == player && player distance _target < 3 && ([""KSK""] call EMonkeys_fnc_permLevel > 0)']; this addAction[""Fahrzeug einparken"",EMonkeys_fnc_storeVehicle,"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 && playerside in [civilian,east] && !eM_garage_store && ([""KSK""] call EMonkeys_fnc_permLevel > 0)'];"];
	_this setObjectTexture [0,"core\textures\map\garage.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = "SignAd_Sponsor_F" createvehiclelocal [9969.1416, 19371.998, -1.5258789e-005];
	_vehicle_177 = _this;
	_this setDir -44.5495;
	_this setPos [9969.1416, 19371.998, -1.5258789e-005];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = "Land_InfoStand_V2_F" createvehiclelocal [9969.4824, 19371.68, 0.00010681152];
	_vehicle_178 = _this;
	_this setDir -44.658768;
	_this setPos [9969.4824, 19371.68, 0.00010681152];
	_initCodes pushBack [_this,"this addAction[""Fraktionshändler - Lackierer"",EMonkeys_fnc_clothingMenu,""gruppe"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""KSK""] call EMonkeys_fnc_permLevel > 0)'];this addAction[""Fraktionshändler - Waffenhändler"",EMonkeys_fnc_weaponShopMenu,""KSKstore"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""KSK""] call EMonkeys_fnc_permLevel > 0)']; this addAction[""Fraktionshändler - Waffenschmied"",EMonkeys_fnc_virt_menu,""gruppen_waffenschmied"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""KSK""] call EMonkeys_fnc_permLevel > 0)'];"];
	_this setObjectTexture [0, "core\textures\map\haendler.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = "OfficeTable_01_old_F" createvehiclelocal [9975.6328, 19368.404, -0.010226791];
	_vehicle_179 = _this;
	_this setDir -94.97715;
	_this setPos [9975.6328, 19368.404, -0.010226791];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_180 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createvehiclelocal [9975.5674, 19368.355, 0.81519508];
	_vehicle_180 = _this;
	_this setDir -101.53362;
	_this setPos [9975.5674, 19368.355, 0.81519508];
	_initCodes pushBack [_this,"this addAction[""Warenhändler"",EMonkeys_fnc_virt_menu,""gruppen_market"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""KSK""] call EMonkeys_fnc_permLevel > 0)'];"];
	_this setObjectTexture [0,"core\textures\map\laptop.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setvectorup [0,0,1];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = "Land_Atm_02_F" createvehiclelocal [9964.78,19366.5,0];
	_vehicle_178 = _this;
	_this setDir 352.084;
	_this setPos [9964.78,19366.5,0];
	_initCodes pushBack [_this,"this addAction[""<t color='#ADFF2F'>Bankautomat</t>"",EMonkeys_fnc_atmMenu,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this allowDamage false;
	_this enableSimulation false;
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;