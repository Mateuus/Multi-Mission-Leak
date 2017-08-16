/*
	File: ps-base.sqf 
	Author: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:160 | PS Basis
*/

_initCodes =[];

//Mauer
_vehicle_000 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3776.4915, 13308.472,0.8];
	_vehicle_000 = _this;
	_this setDir 43.246;
	_this setPos [3776.4915,13308.472,0.8];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1]; 
};

_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3781.3213, 13303.86,0.5];
	_vehicle_001 = _this;
	_this setDir 43.246;
	_this setPos [3781.3213, 13303.86, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3786.0691, 13299.357];
	_vehicle_002 = _this;
	_this setDir 43.246;
	_this setPos [3786.0691, 13299.357,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3790.87,13294.8,0];
	_vehicle_003 = _this;
	_this setDir 43.246;
	_this setPos [3790.87,13294.8,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3796.0103, 13294.474];
	_vehicle_004 = _this;
	_this setDir -43.053612;
	_this setPos [3796.0103, 13294.474,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3762.0776, 13322.002, 0.3];
	_vehicle_005 = _this;
	_this setDir 43.246;
	_this setPos [3762.0776, 13322.002, 0.3];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3766.8374, 13317.555, 0.35];
	_vehicle_006 = _this;
	_this setDir 43.246;
	_this setPos [3766.8374, 13317.555, 0.35];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3771.6431, 13313.013, 0.5];
	_vehicle_007 = _this;
	_this setDir 43.246;
	_this setPos [3771.6431, 13313.013, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3757.1772, 13326.616, 0.5];
	_vehicle_008 = _this;
	_this setDir 43.246;
	_this setPos [3757.1772, 13326.616, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3742.7283, 13340.237, 0.5];
	_vehicle_009 = _this;
	_this setDir 43.246;
	_this setPos [3742.7283, 13340.237, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3747.5217, 13335.724, 0.5];
	_vehicle_010 = _this;
	_this setDir 43.246;
	_this setPos [3747.5217, 13335.724, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3752.3337, 13331.189, 0.5];
	_vehicle_011 = _this;
	_this setDir 43.246;
	_this setPos [3752.3337, 13331.189, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3733.0112, 13349.384, 0.6];
	_vehicle_012 = _this;
	_this setDir 43.246;
	_this setPos [3733.0112, 13349.384, 0.6];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3737.8923, 13344.805, 0.55];
	_vehicle_013 = _this;
	_this setDir 43.246;
	_this setPos [3737.8923, 13344.805, 0.55];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_TTowerSmall_1_F" createVehicleLocal [3796.92,13320.9,18.0];
	_vehicle_014 = _this;
	_this setDir 43.246;
	_this setPos [3796.92,13320.9,18.0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3733.0801, 13354.9];
	_vehicle_015 = _this;
	_this setDir 841.469;
	_this setPos [3733.0801, 13354.9];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3743.72,13371.9,0];
	_vehicle_016 = _this;
	_this setDir 841.469;
	_this setPos [3743.72,13371.9,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_Gate_F" createVehicleLocal [3738.7373, 13364.53];
	_vehicle_017 = _this;
	_this setDir 841.6087;
	_this setPos [3738.7373, 13364.53];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3739.2979, 13357.917];
	_vehicle_018 = _this;
	_this setDir 930.95691;
	_this setPos [3739.2979, 13357.917];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_Gate_F" createVehicleLocal [3752.2612, 13356.483];
	_vehicle_019 = _this;
	_this setDir 841.33704;
	_this setPos [3752.2612, 13356.483];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3808.197, 13376.853, 0.5];
	_vehicle_020 = _this;
	_this setDir 58.904;
	_this setPos [3808.197, 13376.853, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3811.4026, 13371.751, 0.5];
	_vehicle_021 = _this;
	_this setDir 58.904;
	_this setPos [3811.4026, 13371.751, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3814.9182, 13366.073, 0.5];
	_vehicle_022 = _this;
	_this setDir 58.904;
	_this setPos [3814.9182, 13366.073, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3818.3538, 13360.497, 0.5];
	_vehicle_023 = _this;
	_this setDir 58.904;
	_this setPos [3818.3538, 13360.497, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3821.8423, 13354.785, 0.5];
	_vehicle_024 = _this;
	_this setDir 418.098;
	_this setPos [3821.8423, 13354.785, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3826.65,13351.1,0.5];
	_vehicle_025 = _this;
	_this setDir 15.7623;
	_this setPos [3826.65,13351.1,0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3832.7542, 13348.101, 0.5];
	_vehicle_026 = _this;
	_this setDir 37.719994;
	_this setPos [3832.7542, 13348.101, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createVehicleLocal [3741.9807, 13370.115];
	_vehicle_027 = _this;
	_this setDir 301.17691;
	_this setPos [3741.9807, 13370.115];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createVehicleLocal [3744.6392, 13374.436];
	_vehicle_028 = _this;
	_this setDir 303.21692;
	_this setPos [3744.6392, 13374.436];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createVehicleLocal [3743.3003, 13372.286];
	_vehicle_029 = _this;
	_this setDir -59.180767;
	_this setPos [3743.3003, 13372.286];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createVehicleLocal [3733.8792, 13357.283];
	_vehicle_030 = _this;
	_this setDir 301.716;
	_this setPos [3733.8792, 13357.283];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createVehicleLocal [3732.5493, 13355.114];
	_vehicle_031 = _this;
	_this setDir -58.6418;
	_this setPos [3732.5493, 13355.114];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createVehicleLocal [3731.22, 13352.939];
	_vehicle_032 = _this;
	_this setDir 301.716;
	_this setPos [3731.22, 13352.939];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3760.28, 13367.7];
	_vehicle_033 = _this;
	_this setDir 925.079;
	_this setPos [3760.28, 13367.7];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3767.26,13364.5,0];
	_vehicle_034 = _this;
	_this setDir 925.079;
	_this setPos [3767.26,13364.5,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3777.98,13363.2,0];
	_vehicle_035 = _this;
	_this setDir 872.205;
	_this setPos [3777.98,13363.2,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3784.79,13366.8,0];
	_vehicle_036 = _this;
	_this setDir 872.205;
	_this setPos [3784.79,13366.8,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3770.56,13363,0];
	_vehicle_037 = _this;
	_this setDir 925.079;
	_this setPos [3770.56,13363,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3790.59,13371,0.5];
	_vehicle_038 = _this;
	_this setDir -28.8862;
	_this setPos [3790.59,13371,0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3796.37,13374.2,0.5];
	_vehicle_039 = _this;
	_this setDir -28.8862;
	_this setPos [3796.37,13374.2,0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3802.15,13377.4,0.5];
	_vehicle_040 = _this;
	_this setDir -28.8862;
	_this setPos [3802.15,13377.4,0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_City_Pillar_F" createVehicleLocal [3805.47,13379.2,0];
	_vehicle_041 = _this;
	_this setDir 58.904;
	_this setPos [3805.47,13379.2,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_City_Pillar_F" createVehicleLocal [3806.2673, 13379.587];
	_vehicle_042 = _this;
	_this setDir 58.904;
	_this setPos [3806.2673, 13379.587];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_City_Pillar_F" createVehicleLocal [3805.9009, 13379.363];
	_vehicle_043 = _this;
	_this setDir 58.904;
	_this setPos [3805.9009, 13379.363];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3748.7571, 13373.369, 4.7683716e-006];
	_vehicle_044 = _this;
	_this setDir 925.079;
	_this setPos [3748.7571, 13373.369, 4.7683716e-006];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3754.8826, 13370.332, 1.0490417e-005];
	_vehicle_045 = _this;
	_this setDir 925.86584;
	_this setPos [3754.8826, 13370.332, 1.0490417e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_Pipe_fence_4m_F" createVehicleLocal [3743.1658, 13367.705, 5.7220459e-005];
	_vehicle_046 = _this;
	_this setDir 571.22974;
	_this setPos [3743.1658, 13367.705, 5.7220459e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_Pipe_fence_4m_F" createVehicleLocal [3746.6611, 13365.585, -2.8610229e-006];
	_vehicle_047 = _this;
	_this setDir 571.22974;
	_this setPos [3746.6611, 13365.585, -2.8610229e-006];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_Pipe_fence_4m_F" createVehicleLocal [3750.1597, 13363.465, 0.022287032];
	_vehicle_048 = _this;
	_this setDir 571.22974;
	_this setPos [3750.1597, 13363.465, 0.022287032];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3746.0142, 13353.874, -2.3841858e-005];
	_vehicle_049 = _this;
	_this setDir 930.95691;
	_this setPos [3746.0142, 13353.874, -2.3841858e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createVehicleLocal [3734.2681, 13356.695, 8.5830688e-006];
	_vehicle_050 = _this;
	_this setDir 841.469;
	_this setPos [3734.2681, 13356.695, 8.5830688e-006];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_CncBarrier_stripes_F" createVehicleLocal [3735.1985, 13359.402, 1.9073486e-006];
	_vehicle_051 = _this;
	_this setDir 301.716;
	_this setPos [3735.1985, 13359.402, 1.9073486e-006];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3801.1201, 13299.175, -5.3405762e-005];
	_vehicle_052 = _this;
	_this setDir -43.053612;
	_this setPos [3801.1201, 13299.175, -5.3405762e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_053 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3806.1897, 13303.917, 4.9591064e-005];
	_vehicle_053 = _this;
	_this setDir -43.053612;
	_this setPos [3806.1897, 13303.917, 4.9591064e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3811.3364, 13308.678, 4.7683716e-005];
	_vehicle_054 = _this;
	_this setDir -43.053612;
	_this setPos [3811.3364, 13308.678, 4.7683716e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_055 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3816.4048, 13313.365, 1.335144e-005];
	_vehicle_055 = _this;
	_this setDir -43.053612;
	_this setPos [3816.4048, 13313.365, 1.335144e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_056 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3821.4424, 13318.054, 8.8691711e-005];
	_vehicle_056 = _this;
	_this setDir -43.053612;
	_this setPos [3821.4424, 13318.054, 8.8691711e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_057 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3826.5793, 13322.822, -1.9073486e-006];
	_vehicle_057 = _this;
	_this setDir -43.053612;
	_this setPos [3826.5793, 13322.822, -1.9073486e-006];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_058 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3831.6907, 13327.561, 0.62900287];
	_vehicle_058 = _this;
	_this setDir -43.053612;
	_this setPos [3831.6907, 13327.561, 0.62900287];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_059 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3836.8396, 13332.305, 0.2251585];
	_vehicle_059 = _this;
	_this setDir -43.053612;
	_this setPos [3836.8396, 13332.305, 0.2251585];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_060 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3841.802, 13337.186, -2.0027161e-005];
	_vehicle_060 = _this;
	_this setDir -47.251369;
	_this setPos [3841.802, 13337.186, -2.0027161e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_061 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3838.3174, 13343.827, 0.5];
	_vehicle_061 = _this;
	_this setDir 37.719994;
	_this setPos [3838.3174, 13343.827, 0.5];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_062 = objNull;
if (true) then
{
	_this = "Land_City_4m_F" createVehicleLocal [3842.5701, 13340.691, 2.6702881e-005];
	_vehicle_062 = _this;
	_this setDir -145.21931;
	_this setPos [3842.5701, 13340.691, 2.6702881e-005];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_063 = objNull;
if (true) then
{
	_this = "Land_City_Pillar_F" createVehicleLocal [3844.0786, 13339.625, -0.27864331];
	_vehicle_063 = _this;
	_this setDir -46.397705;
	_this setPos [3844.0786, 13339.625, -0.27864331];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_064 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3748.667, 13358.418, -0.72294456];
	_vehicle_064 = _this;
	_this setDir 30.847799;
	_this setPos [3748.667, 13358.418, -0.72294456];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_065 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3741.9839, 13362.407, -0.69663239];
	_vehicle_065 = _this;
	_this setDir 30.847799;
	_this setPos [3741.9839, 13362.407, -0.69663239];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_066 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3755.7583, 13333.571, -0.76062471];
	_vehicle_066 = _this;
	_this setDir -45.608902;
	_this setPos [3755.7583, 13333.571, -0.76062471];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_067 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3752.8674, 13336.433, -0.71650237];
	_vehicle_067 = _this;
	_this setDir -45.608902;
	_this setPos [3752.8674, 13336.433, -0.71650237];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_068 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3749.8018, 13339.32, -0.71875238];
	_vehicle_068 = _this;
	_this setDir -45.608902;
	_this setPos [3749.8018, 13339.32, -0.71875238];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_069 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3746.7053, 13342.068, -0.71202815];
	_vehicle_069 = _this;
	_this setDir -45.608902;
	_this setPos [3746.7053, 13342.068, -0.71202815];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_070 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3743.7839, 13344.779, -0.70531762];
	_vehicle_070 = _this;
	_this setDir -45.608902;
	_this setPos [3743.7839, 13344.779, -0.70531762];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_071 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3788.7883, 13330.105, -0.72041214];
	_vehicle_071 = _this;
	_this setDir -107.47827;
	_this setPos [3788.7883, 13330.105, -0.72041214];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_072 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3791.4219, 13332.444, -0.69629598];
	_vehicle_072 = _this;
	_this setDir -107.47827;
	_this setPos [3791.4219, 13332.444, -0.69629598];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_073 = objNull;
if (true) then
{
	_this = "Land_Concrete_SmallWall_8m_F" createVehicleLocal [3794.4521, 13334.448, -0.71499926];
	_vehicle_073 = _this;
	_this setDir -107.47827;
	_this setPos [3794.4521, 13334.448, -0.71499926];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_074 = objNull;
if (true) then
{
	_this = "Land_City_8m_F" createVehicleLocal [3776.5898, 13308.364, 0.60632956];
	_vehicle_074 = _this;
	_this setDir 43.246;
	_this setPos [3776.5898, 13308.364, 0.60632956];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Lampen
_vehicle_075 = objNull;
if (true) then
{
	_this = "Land_LampAirport_F" createVehicleLocal [3774.9436, 13312.154, -0.25651571];
	_vehicle_075 = _this;
	_this setDir 3.99705;
	_this setPos [3774.9436, 13312.154, -0.25651571];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_076 = objNull;
if (true) then
{
	_this = "Land_LampAirport_F" createVehicleLocal [3800.2507, 13334.758, -0.2698724];
	_vehicle_076 = _this;
	_this setDir -0.0277444;
	_this setPos [3800.2507, 13334.758, -0.2698724];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_077 = objNull;
if (true) then
{
	_this = "Land_LampAirport_F" createVehicleLocal [3739.8337, 13344.528, -0.27141491];
	_vehicle_077 = _this;
	_this setDir 68.3828;
	_this setPos [3739.8337, 13344.528, -0.27141491];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_078 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createVehicleLocal [3823.71,13340.9,0];
	_vehicle_078 = _this;
	_this setDir -321.895;
	_this setPos [3823.71,13340.9,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_079 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createVehicleLocal [3814.79,13329.2,0];
	_vehicle_079 = _this;
	_this setDir -321.895;
	_this setPos [3814.79,13329.2,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_080 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createVehicleLocal [3816.37,13341.8,0];
	_vehicle_080 = _this;
	_this setDir -382.141;
	_this setPos [3816.37,13341.8,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_081 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createVehicleLocal [3822.08,13328.3,0];
	_vehicle_081 = _this;
	_this setDir -382.141;
	_this setPos [3822.08,13328.3,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_082 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createVehicleLocal [3811.89,13335.5,0];
	_vehicle_082 = _this;
	_this setDir -445.974;
	_this setPos [3811.89,13335.5,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_083 = objNull;
if (true) then
{
	_this = "Land_runway_edgelight" createVehicleLocal [3826.61,13334.7,0];
	_vehicle_083 = _this;
	_this setDir -445.974;
	_this setPos [3826.61,13334.7,0];
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Parkplatz Schilder
_vehicle_084 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createVehicleLocal [3742.6724, 13340.69];
	_vehicle_084 = _this;
	_this setDir 223.48943;
	_this setPos [3742.6724, 13340.69];
	_this setObjectTexture [0, "core\textures\map\pp.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_085 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createVehicleLocal [3745.6909, 13337.875];
	_vehicle_085 = _this;
	_this setDir 223.24927;
	_this setPos [3745.6909, 13337.875];
	_this setObjectTexture [0, "core\textures\map\pp.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_086 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createVehicleLocal [3748.5488, 13335.151];
	_vehicle_086 = _this;
	_this setDir 223.16466;
	_this setPos [3748.5488, 13335.151];
	_this setObjectTexture [0, "core\textures\map\pp.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_087 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createVehicleLocal [3751.6401, 13332.242];
	_vehicle_087 = _this;
	_this setDir 222.59845;
	_this setPos [3751.6401, 13332.242];
	_this setObjectTexture [0, "core\textures\map\pp.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_088 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createVehicleLocal [3791.18,13327.8,0];
	_vehicle_088 = _this;
	_this setDir 148.393;
	_this setPos [3791.18,13327.8,0];
	_this setObjectTexture [0, "core\textures\map\pp.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_089 = objNull;
if (true) then
{
	_this = "Land_Noticeboard_F" createVehicleLocal [3794.1238, 13329.994];
	_vehicle_089 = _this;
	_this setDir 148.393;
	_this setPos [3794.1238, 13329.994];
	_this setObjectTexture [0, "core\textures\map\pp.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Housing
_vehicle_091 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3795.2,13306.4,0.7];
	_vehicle_091 = _this;
	_this setVehicleVarName "ps_1";
	ps_1 = _this;
	_this setDir -129.035;
	_this setPos [3795.2,13306.4,0.7];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 1"", EMonkeys_fnc_houseMenu, ""ps_1"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_1""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 1"", EMonkeys_fnc_houseInventory, ""ps_1"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_1"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_092 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3794.66,13305.9,0.7];
	_vehicle_092 = _this;
	_this setDir -131.311;
	_this setPos [3794.66,13305.9,0.7];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_1"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_093 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3795.9,13306.9,0.7];
	_vehicle_093 = _this;
	_this setVehicleVarName "ps_2";
	ps_2 = _this;
	_this setDir 50.7818;
	_this setPos [3795.9,13306.9,0.7];
	_initCodes pushBack [_this," this addAction [""Schreibtisch 2"", EMonkeys_fnc_houseMenu, ""ps_2"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_2""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Inventar Zimmer 2"", EMonkeys_fnc_houseInventory, ""ps_2"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_2"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_094 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3796.4,13307.5,0.7];
	_vehicle_094 = _this;
	_this setDir 48.5061;
	_this setPos [3796.4,13307.5,0.7];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_2"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_095 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3798.85,13309.3,0.7];
	_vehicle_095 = _this;
	_this setVehicleVarName "ps_3";
	ps_3 = _this;
	_this setDir -129.035;
	_this setPos [3798.85,13309.3,0.7];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 3"", EMonkeys_fnc_houseMenu, ""ps_3"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_3""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Inventar Zimmer 3"", EMonkeys_fnc_houseInventory, ""ps_3"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_3"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_096 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3798.31,13308.8,0.7];
	_vehicle_096 = _this;
	_this setDir -131.311;
	_this setPos [3798.31,13308.8,0.7];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_3"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_097 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3799.55,13309.9,0.7];
	_vehicle_097 = _this;
	_this setVehicleVarName "ps_4";
	ps_4 = _this;
	_this setDir 50.7818;
	_this setPos [3799.55,13309.9,0.7];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 4"", EMonkeys_fnc_houseMenu, ""ps_4"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_4""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Inventar Zimmer 4"", EMonkeys_fnc_houseInventory, ""ps_4"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_4"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_098 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3800.05,13310.4,0.7];
	_vehicle_098 = _this;
	_this setDir 48.5061;
	_this setPos [3800.05,13310.4,0.7];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_4"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_099 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3802.72,13312.2,0.65];
	_vehicle_099 = _this;
	_this setVehicleVarName "ps_5";
	ps_5 = _this;
	_this setDir -129.035;
	_this setPos [3802.72,13312.2,0.65];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 5"", EMonkeys_fnc_houseMenu, ""ps_5"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_5""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 5"", EMonkeys_fnc_houseInventory, ""ps_5"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_5"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3802.22,13311.6,0.6];
	_vehicle_100 = _this;
	_this setDir -131.311;
	_this setPos [3802.22,13311.6,0.6];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_5"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3803.43,13312.8,0.6];
	_vehicle_101 = _this;
	_this setVehicleVarName "ps_6";
	ps_6 = _this;
	_this setDir 50.7818;
	_this setPos [3803.43,13312.8,0.6];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 6"", EMonkeys_fnc_houseMenu, ""ps_6"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_6""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 6"", EMonkeys_fnc_houseInventory, ""ps_6"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_6"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3803.97,13313.2,0.6];
	_vehicle_102 = _this;
	_this setDir 48.5061;
	_this setPos [3803.97,13313.2,0.6];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_6"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3806.37,13314.9,0.395];
	_vehicle_103 = _this;
	_this setVehicleVarName "ps_7";
	ps_7 = _this;
	_this setDir -129.035;
	_this setPos [3806.37,13314.9,0.395];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 7"", EMonkeys_fnc_houseMenu, ""ps_7"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_7""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Inventar Zimmer 7"", EMonkeys_fnc_houseInventory, ""ps_7"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_7"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3805.83,13314.4,0.35];
	_vehicle_104 = _this;
	_this setDir -131.311;
	_this setPos [3805.83,13314.4,0.35];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_7"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3807.07,13315.4,0.3];
	_vehicle_105 = _this;
	_this setVehicleVarName "ps_8";
	ps_8 = _this;
	_this setDir 50.7818;
	_this setPos [3807.07,13315.4,0.3];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 8"", EMonkeys_fnc_houseMenu, ""ps_8"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_8""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 8"", EMonkeys_fnc_houseInventory, ""ps_8"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_8"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3807.57,13316,0.3];
	_vehicle_106 = _this;
	_this setDir 48.5061;
	_this setPos [3807.57,13316,0.3];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_8"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3789,13313.2,5.25];
	_vehicle_107 = _this;
	_this setVehicleVarName "ps_10";
	ps_10 = _this;
	_this setDir -216.926;
	_this setPos [3789,13313.2,5.25];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 10"", EMonkeys_fnc_houseMenu, ""ps_10"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_10""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 10"", EMonkeys_fnc_houseInventory, ""ps_10"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_10"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3789.48,13312.6,5.2];
	_vehicle_108 = _this;
	_this setDir -219.202;
	_this setPos [3789.48,13312.6,5.2];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_10"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3788.51,13313.9,5.2];
	_vehicle_109 = _this;
	_this setVehicleVarName "ps_9";
	ps_9 = _this;
	_this setDir -37.1092;
	_this setPos [3788.51,13313.9,5.2];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 9"", EMonkeys_fnc_houseMenu, ""ps_9"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_9""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 9"", EMonkeys_fnc_houseInventory, ""ps_9"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_9"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3787.98,13314.4,5.2];
	_vehicle_110 = _this;
	_this setDir -39.3849;
	_this setPos [3787.98,13314.4,5.2];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_9"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = "Land_HelipadCivil_F" createVehicleLocal [3819.33,13335.1,0];
	_vehicle_111 = _this;
	_this setDir -668.301;
	_this setPos [3819.33,13335.1,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_126 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3794.16,13310.5,5.25];
	_vehicle_126 = _this;
	_this setVehicleVarName "ps_11";
	ps_11 = _this;
	_this setDir -489.973;
	_this setPos [3794.16,13310.5,5.25];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 11"", EMonkeys_fnc_houseMenu, ""ps_11"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_11""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 11"", EMonkeys_fnc_houseInventory, ""ps_11"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_11"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3793.63,13310,5.2];
	_vehicle_127 = _this;
	_this setDir -492.249;
	_this setPos [3793.63,13310,5.2];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_11"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3794.85,13311,5.35];
	_vehicle_128 = _this;
	_this setVehicleVarName "ps_12";
	ps_12 = _this;
	_this setDir -310.615;
	_this setPos [3794.85,13311,5.35];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 12"", EMonkeys_fnc_houseMenu, ""ps_12"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_12""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];this addAction [""Inventar Zimmer 12"", EMonkeys_fnc_houseInventory, ""ps_12"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_12"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3795.35,13311.5,5.35];
	_vehicle_129 = _this;
	_this setDir -312.432;
	_this setPos [3795.35,13311.5,5.35];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_12"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3787.14,13311.8,9.1];
	_vehicle_130 = _this;
	_this setVehicleVarName "ps_14";
	ps_14 = _this;
	_this setDir -216.926;
	_this setPos [3787.14,13311.8,9.1];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 14"", EMonkeys_fnc_houseMenu, ""ps_14"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_14""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 14"", EMonkeys_fnc_houseInventory, ""ps_14"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_14"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3787.7,13311.3,9.05];
	_vehicle_131 = _this;
	_this setDir -219.202;
	_this setPos [3787.7,13311.3,9.05];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_14"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3786.6,13312.5,9.19];
	_vehicle_132 = _this;
	_this setVehicleVarName "ps_13";
	ps_13 = _this;
	_this setDir -37.1092;
	_this setPos [3786.6,13312.5,9.19];
	_initCodes pushBack [_this,"this addAction [""Schreibtisch 13"", EMonkeys_fnc_houseMenu, ""ps_13"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager"",{[""ps_13""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Inventar Zimmer 13"", EMonkeys_fnc_houseInventory, ""ps_13"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_13"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3786.2,13313.1,9.2];
	_vehicle_133 = _this;
	_this setDir -39.3849;
	_this setPos [3786.2,13313.1,9.2];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_13"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3790.09,13308.2,12.6];
	_vehicle_134 = _this;
	_this setVehicleVarName "ps_15";
	ps_15 = _this;
	_this setDir -216.926;
	_this setPos [3790.09,13308.2,12.6];
	_initCodes pushBack [_this,"this addAction [""PS Hauptquartier"", EMonkeys_fnc_houseMenu, ""ps_15"",0,false,false,"""",' player distance _target < 3 ']; this addAction [""Lager ps"",{[""ps_15""] spawn open_house_inventory},"""",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Tresor ps"", EMonkeys_fnc_houseInventory, ""ps_15"",0,false,false,"""",' vehicle player == player && player distance _target < 3 ']; this addAction [""Durchsuchen"", EMonkeys_fnc_houseSearch, ""ps_15"",6,true,true,"""",'vehicle player == player && player distance _target < 3 && playerSide == west '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_135 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3790.57,13307.6,12.55];
	_vehicle_135 = _this;
	_this setDir -219.202;
	_this setPos [3790.57,13307.6,12.55];
	_initCodes pushBack [_this,"this addAction [""Ausruhen"", EMonkeys_fnc_houseSleep, ""ps_15"",0,false,false,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Gebäude
_vehicle_136 = objNull;
if (true) then
{
	_this = "Land_i_Garage_V1_F" createVehicleLocal [3787.72,13358.8,0.18];
	_vehicle_136 = _this;
	_this setDir -120.722;
	_this setPos [3787.72,13358.8,0.18];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = "Land_i_Garage_V1_F" createVehicleLocal [3792.88,13361.8,0.3];
	_vehicle_137 = _this;
	_this setDir -120.722;
	_this setPos [3792.88,13361.8,0.3];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = "Land_i_Garage_V1_F" createVehicleLocal [3798.08,13364.9,0.6];
	_vehicle_138 = _this;
	_this setDir -120.722;
	_this setPos [3798.08,13364.9,0.6];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = "Land_TouristShelter_01_F" createVehicleLocal [3818.92,13352.8,0];
	_vehicle_139 = _this;
	_this setDir 60.0062;
	_this setPos [3818.92,13352.8,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Verschönerung (Laptop)
_vehicle_140 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3794.51,13310.2,6.03];
	_vehicle_140 = _this;
	_this setDir -463.208;
	_this setPos [3794.51,13310.2,6.03];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3794.86,13310.8,6.14];
	_vehicle_141 = _this;
	_this setDir -710.422;
	_this setPos [3794.86,13310.8,6.14];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3752.1367, 13367.682, 1.13];
	_vehicle_142 = _this;
	_this setDir -395.183;
	_this setPos [3752.1367, 13367.682, 1.13];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3789.3,13313.5,6.07];
	_vehicle_143 = _this;
	_this setDir -190.161;
	_this setPos [3789.3,13313.5,6.07];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3806.72,13314.6,1.15];
	_vehicle_144 = _this;
	_this setDir -102.27;
	_this setPos [3806.72,13314.6,1.15];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3803.11,13311.8,1.42];
	_vehicle_145 = _this;
	_this setDir -102.27;
	_this setPos [3803.11,13311.8,1.42];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3799.2,13309,1.44];
	_vehicle_146 = _this;
	_this setDir -102.27;
	_this setPos [3799.2,13309,1.44];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3795.55,13306.1,1.44];
	_vehicle_147 = _this;
	_this setDir -102.27;
	_this setPos [3795.55,13306.1,1.44];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createVehicleLocal [3788.09,13302.5,1.27];
	_vehicle_148 = _this;
	_this setDir -188.708;
	_this setPos [3788.09,13302.5,1.27];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Verschönerungen (Möbel)
_vehicle_149 = objNull;
if (true) then
{
	_this = "Land_CampingChair_V2_F" createVehicleLocal [3784.771, 13310.382, 13.140385];
	_vehicle_149 = _this;
	_this setDir 25.785133;
	_this setPos [3784.771, 13310.382, 13.140385];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = "Land_CampingTable_small_F" createVehicleLocal [3784.4231, 13309.671, 13.14045];
	_vehicle_150 = _this;
	_this setDir 25.785133;
	_this setPos [3784.4231, 13309.671, 13.14045];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = "Land_CampingChair_V2_F" createVehicleLocal [3785.1707, 13309.338, 13.140347];
	_vehicle_151 = _this;
	_this setDir 114.3238;
	_this setPos [3785.1707, 13309.338, 13.140347];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = "Land_CampingChair_V2_F" createVehicleLocal [3783.6992, 13310.105, 13.140385];
	_vehicle_152 = _this;
	_this setDir -62.884571;
	_this setPos [3783.6992, 13310.105, 13.140385];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3810.5295, 13369.081, 1.2];
	_vehicle_153 = _this;
	_this setDir -30.2909;
	_this setPos [3810.5295, 13369.081, 1.2];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = "Land_CampingTable_small_F" createVehicleLocal [3811.0496, 13368.182, 1.05];
	_vehicle_154 = _this;
	_this setDir -215.968;
	_this setPos [3811.0496, 13368.182, 1.05];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3752.2969, 13368.182, 0.3];
	_vehicle_155 = _this;
	_this setDir -421.948;
	_this setPos [3752.2969, 13368.182, 0.3];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3751.5867, 13368.382, 0.3];
	_vehicle_156 = _this;
	_this setDir -424.224;
	_this setPos [3751.5867, 13368.382, 0.3];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = "Land_TablePlastic_01_F" createVehicleLocal [3789.24,13317.2,1.25];
	_vehicle_157 = _this;
	_this setDir 1761.82;
	_this setPos [3789.24,13317.2,1.25];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = "Land_CampingChair_V2_F" createVehicleLocal [3789.36,13316.2,1.3];
	_vehicle_158 = _this;
	_this setDir 1580.57;
	_this setPos [3789.36,13316.2,1.3];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = "Land_CampingChair_V2_F" createVehicleLocal [3790.29,13316.9,1.3];
	_vehicle_159 = _this;
	_this setDir 1580.08;
	_this setPos [3790.29,13316.9,1.3];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = "Land_CampingChair_V2_F" createVehicleLocal [3789.05,13318.3,1.25];
	_vehicle_160 = _this;
	_this setDir 1400.73;
	_this setPos [3789.05,13318.3,1.25];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = "Land_CampingChair_V2_F" createVehicleLocal [3788.12,13317.6,1.25];
	_vehicle_161 = _this;
	_this setDir 1400.24;
	_this setPos [3788.12,13317.6,1.25];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = "Land_WaterCooler_01_new_F" createVehicleLocal [3791.07,13320.3,01.15];
	_vehicle_162 = _this;
	_this setDir -309.868;
	_this setPos [3791.07,13320.3,01.15];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = "RoadCone_L_F" createVehicleLocal [3736.01,13360.7,0];
	_vehicle_163 = _this;
	_this setDir 118.8;
	_this setPos [3736.01,13360.7,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = "RoadCone_L_F" createVehicleLocal [3741.2012, 13369.042];
	_vehicle_164 = _this;
	_this setDir 118.8;
	_this setPos [3741.2012, 13369.042];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};
	
_vehicle_165 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3787.78,13302.2,0.4];
	_vehicle_165 = _this;
	_this setDir -215.473;
	_this setPos [3787.78,13302.2,0.4];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = "Land_ChairWood_F" createVehicleLocal [3788.25,13301.6,0.35];
	_vehicle_166 = _this;
	_this setDir -217.749;
	_this setPos [3788.25,13301.6,0.35];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = "MapBoard_altis_F" createVehicleLocal [3790.88,13303.1,0];
	_vehicle_167 = _this;
	_this setDir -256.67;
	_this setPos [3790.88,13303.1,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_168 = objNull;
if (true) then
{
	_this = "Land_TableDesk_F" createVehicleLocal [3781.96,13310.1,0];
	_vehicle_168 = _this;
	_this setDir -575.769;
	_this setPos [3781.96,13310.1,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = "Land_PowerGenerator_F" createVehicleLocal [3738.76,13346,0];
	_vehicle_169 = _this;
	_this setDir 765.078;
	_this setPos [3738.76,13346,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = "Land_spp_Transformer_F" createVehicleLocal [3735.58,13349.3,0];
	_vehicle_170 = _this;
	_this setDir 855.088;
	_this setPos [3735.58,13349.3,0];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = "Land_Loudspeakers_F" createVehicleLocal [3757.0542, 13363.552];
	_vehicle_171 = _this;
	_this setDir 926.07159;
	_this setPos [3757.0542, 13363.552];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

//Garage,Shops,ATM
_vehicle_172 = objNull;
if (true) then
{
	_this = "Land_InfoStand_V2_F" createVehicleLocal [3819.9612, 13353.3, -2.7656555e-005];
	_vehicle_172 = _this;
	_this setDir 63.220924;
	_this setPos [3819.9612, 13353.3, -2.7656555e-005];
	_initCodes pushBack [_this,"this addAction[""KFZ Händler PS"",EMonkeys_fnc_vehicleShopMenu,[""ps_car"",""ps_car_spawn"",[civilian,opfor]],0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""ps""] call EMonkeys_fnc_permLevel > 0)']; this addAction[""Garage"",EMonkeys_fnc_vehicleGarageMenu,[""car"",""ps_car_spawn"",[""atv"",""car"",""truck"",""armored""],[civilian,opfor]],0,false,false,"""",'vehicle player == player && player distance _target < 3 && ([""ps""] call EMonkeys_fnc_permLevel > 0)']; this addAction[""Helikopterhanger"",EMonkeys_fnc_vehicleGarageMenu,[""air"",""ps_car_spawn"",[""air""],[civilian,opfor]],0,false,false,"""",'vehicle player == player && player distance _target < 3 && ([""ps""] call EMonkeys_fnc_permLevel > 0)']; this addAction[""Fahrzeug einparken"",EMonkeys_fnc_storeVehicle,"""",0,false,false,"""",'vehicle player == player && player distance _target < 3 && playerside in [civilian,east] && ([""ps""] call EMonkeys_fnc_permLevel > 0) && !eM_garage_store'];"];
	_this setObjectTexture [0, "core\textures\map\garage.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = "SignAd_Sponsor_F" createvehiclelocal [3786.1216, 13308.351, 1.1514282];
	_vehicle_173 = _this;
	_this setDir 142.87698;
	_this setPos [3786.1216, 13308.351, 1.1514282];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = "Land_InfoStand_V2_F" createvehiclelocal [3785.8147, 13308.767, 1.2365623];
	_vehicle_174 = _this;
	_this setDir 143.86136;
	_this setPos [3785.8147, 13308.767, 1.2365623];
	_initCodes pushBack [_this,"this addAction[""Fraktionshändler - Lackierer"",EMonkeys_fnc_clothingMenu,""gruppe"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""ps""] call EMonkeys_fnc_permLevel > 0)'];this addAction[""Fraktionshändler - Waffenhändler"",EMonkeys_fnc_weaponShopMenu,""PSstore"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""ps""] call EMonkeys_fnc_permLevel > 0)'];this addAction[""Fraktionshändler - Waffenschmied"",EMonkeys_fnc_virt_menu,""gruppen_waffenschmied"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""PS""] call EMonkeys_fnc_permLevel > 0)'];"];
	_this setObjectTexture [0, "core\textures\map\haendler.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_175 = objNull;
if (true) then
{
	_this = "OfficeTable_01_new_F" createvehiclelocal [3782.5884, 13307.862, 1.4180933];
	_vehicle_175 = _this;
	_this setDir 53.846111;
	_this setPos [3782.5884, 13307.862, 1.4180933];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = "Land_Laptop_unfolded_F" createvehiclelocal [3782.7664, 13307.604, 2.1930094];
	_vehicle_177 = _this;
	_this setPos [3782.7664, 13307.604, 2.1930094];
	_initCodes pushBack [_this,"this addAction[""Warenhändler"",EMonkeys_fnc_virt_menu,""gruppen_market"",0,false,false,"""",' vehicle player == player && player distance _target < 3 && ([""ps""] call EMonkeys_fnc_permLevel > 0)'];"];
	_this setObjectTexture [0,"core\textures\map\laptop.paa"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};


_vehicle_178 = objNull;
if (true) then
{
	_this = "Land_Atm_01_F" createVehicleLocal [3789.21,13322.2,0];
	_vehicle_178 = _this;
	_this setDir 54.0162;
	_this setPos [3789.21,13322.2,0];
	_initCodes pushBack [_this,"this addAction[""<t color='#ADFF2F'>Bankautomat</t>"",EMonkeys_fnc_atmMenu,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 '];"];
	_this enableSimulation false;
	_this allowDamage false;
	_this setvectorup [0,0,1];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
