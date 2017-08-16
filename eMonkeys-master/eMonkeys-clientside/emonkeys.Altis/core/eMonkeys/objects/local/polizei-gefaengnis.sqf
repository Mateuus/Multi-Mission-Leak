/*
	File: polizei-gefaengnis.sqf
	Author: Niklas "Rappelkiste" Quenter 
	Server: e-Monkeys.com
	
	Information: Objekte:113 | Polizei Gefängnis
*/

_initCodes = [];

//Mauer außen
_vehicle_001 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11746.91, 11900.58];
	_vehicle_001 = _this;
	_this setDir -137.54944;
	_this setPos [11746.91, 11900.58];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_002 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11746.269, 11863.688];
	_vehicle_002 = _this;
	_this setDir -47.549438;
	_this setPos [11746.269, 11863.688];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_003 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11753.488, 11894.561];
	_vehicle_003 = _this;
	_this setDir -137.54944;
	_this setPos [11753.488, 11894.561];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_004 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11756.363, 11891.938];
	_vehicle_004 = _this;
	_this setDir -137.54944;
	_this setPos [11756.363, 11891.938];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_005 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11750.531, 11897.268];
	_vehicle_005 = _this;
	_this setDir -137.54944;
	_this setPos [11750.531, 11897.268];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_006 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11747.576, 11899.967];
	_vehicle_006 = _this;
	_this setDir -137.54944;
	_this setPos [11747.576, 11899.967];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_007 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11748.979, 11866.643];
	_vehicle_007 = _this;
	_this setDir -47.549438;
	_this setPos [11748.979, 11866.643];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_008 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11759.315, 11889.231];
	_vehicle_008 = _this;
	_this setDir -137.54944;
	_this setPos [11759.315, 11889.231];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_009 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11751.669, 11869.589];
	_vehicle_009 = _this;
	_this setDir -47.549438;
	_this setPos [11751.669, 11869.589];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_010 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11757.078, 11875.498];
	_vehicle_010 = _this;
	_this setDir -47.549438;
	_this setPos [11757.078, 11875.498];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_011 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11759.774, 11878.442];
	_vehicle_011 = _this;
	_this setDir -47.549438;
	_this setPos [11759.774, 11878.442];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_012 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11754.379, 11872.54];
	_vehicle_012 = _this;
	_this setDir -47.549438;
	_this setPos [11754.379, 11872.54];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_013 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11713.038, 11862.111];
	_vehicle_013 = _this;
	_this setDir 42.450562;
	_this setPos [11713.038, 11862.111];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_014 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11743.582, 11860.752];
	_vehicle_014 = _this;
	_this setDir -47.549438;
	_this setPos [11743.582, 11860.752];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_015 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11715.879, 11859.492];
	_vehicle_015 = _this;
	_this setDir 42.450562;
	_this setPos [11715.879, 11859.492];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_016 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11718.811, 11856.808];
	_vehicle_016 = _this;
	_this setDir 42.450562;
	_this setPos [11718.811, 11856.808];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_017 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11735.576, 11851.877];
	_vehicle_017 = _this;
	_this setDir -47.549438;
	_this setPos [11735.576, 11851.877];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_018 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11738.255, 11854.833];
	_vehicle_018 = _this;
	_this setDir -47.549438;
	_this setPos [11738.255, 11854.833];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_019 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11740.891, 11857.808];
	_vehicle_019 = _this;
	_this setDir -47.549438;
	_this setPos [11740.891, 11857.808];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_020 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11710.088, 11864.811];
	_vehicle_020 = _this;
	_this setDir 42.450562;
	_this setPos [11710.088, 11864.811];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_021 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11721.766, 11854.112];
	_vehicle_021 = _this;
	_this setDir 42.450562;
	_this setPos [11721.766, 11854.112];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_022 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11724.713, 11851.41];
	_vehicle_022 = _this;
	_this setDir 42.450562;
	_this setPos [11724.713, 11851.41];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_023 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11735.54, 11910.83];
	_vehicle_023 = _this;
	_this setDir -137.54944;
	_this setPos [11735.54, 11910.83];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_024 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11723.735, 11921.626];
	_vehicle_024 = _this;
	_this setDir -137.54944;
	_this setPos [11723.735, 11921.626];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_025 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11736.281, 11910.152];
	_vehicle_025 = _this;
	_this setDir -137.54944;
	_this setPos [11736.281, 11910.152];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_026 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11729.632, 11916.229];
	_vehicle_026 = _this;
	_this setDir -137.54944;
	_this setPos [11729.632, 11916.229];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_027 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11732.588, 11913.53];
	_vehicle_027 = _this;
	_this setDir -137.54944;
	_this setPos [11732.588, 11913.53];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_028 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11726.69, 11918.933];
	_vehicle_028 = _this;
	_this setDir -137.54944;
	_this setPos [11726.69, 11918.933];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_029 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11695.32, 11878.317];
	_vehicle_029 = _this;
	_this setDir 42.450562;
	_this setPos [11695.32, 11878.317];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_030 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11692.369, 11881.027];
	_vehicle_030 = _this;
	_this setDir 42.450562;
	_this setPos [11692.369, 11881.027];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_031 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11698.291, 11875.611];
	_vehicle_031 = _this;
	_this setDir 42.450562;
	_this setPos [11698.291, 11875.611];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_032 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11701.23, 11872.905];
	_vehicle_032 = _this;
	_this setDir 42.450562;
	_this setPos [11701.23, 11872.905];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_033 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11704.183, 11870.208];
	_vehicle_033 = _this;
	_this setDir 42.450562;
	_this setPos [11704.183, 11870.208];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_034 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11707.132, 11867.512];
	_vehicle_034 = _this;
	_this setDir 42.450562;
	_this setPos [11707.132, 11867.512];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_035 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11689.433, 11883.703];
	_vehicle_035 = _this;
	_this setDir 42.450562;
	_this setPos [11689.433, 11883.703];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_036 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11702.301, 11909.323];
	_vehicle_036 = _this;
	_this setDir 132.11244;
	_this setPos [11702.301, 11909.323];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_037 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11704.953, 11912.273];
	_vehicle_037 = _this;
	_this setDir 132.11244;
	_this setPos [11704.953, 11912.273];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_038 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11707.621, 11915.214];
	_vehicle_038 = _this;
	_this setDir 132.11244;
	_this setPos [11707.621, 11915.214];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_039 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11710.29, 11918.175];
	_vehicle_039 = _this;
	_this setDir 132.11244;
	_this setPos [11710.29, 11918.175];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_040 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11712.973, 11921.16];
	_vehicle_040 = _this;
	_this setDir 132.11244;
	_this setPos [11712.973, 11921.16];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_041 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11699.619, 11906.361];
	_vehicle_041 = _this;
	_this setDir 132.11244;
	_this setPos [11699.619, 11906.361];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_042 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11696.945, 11903.405];
	_vehicle_042 = _this;
	_this setDir 132.11244;
	_this setPos [11696.945, 11903.405];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_043 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11688.919, 11894.507];
	_vehicle_043 = _this;
	_this setDir 132.11244;
	_this setPos [11688.919, 11894.507];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_044 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11691.598, 11897.486];
	_vehicle_044 = _this;
	_this setDir 132.11244;
	_this setPos [11691.598, 11897.486];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_045 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_4m_F" createvehiclelocal [11694.269, 11900.448];
	_vehicle_045 = _this;
	_this setDir 132.11244;
	_this setPos [11694.269, 11900.448];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_046 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_Corner_F" createvehiclelocal [11743.865, 11901.811];
	_vehicle_046 = _this;
	_this setDir 87.743828;
	_this setPos [11743.865, 11901.811];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_047 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_Corner_F" createvehiclelocal [11743.405, 11901.28];
	_vehicle_047 = _this;
	_this setDir 87.398376;
	_this setPos [11743.405, 11901.28];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_048 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_Corner_F" createvehiclelocal [11737.348, 11906.742];
	_vehicle_048 = _this;
	_this setDir -92.617958;
	_this setPos [11737.348, 11906.742];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_049 = objNull;
if (true) then
{
	_this = "Land_Mil_WallBig_Corner_F" createvehiclelocal [11737.785, 11907.229];
	_vehicle_049 = _this;
	_this setDir -92.549454;
	_this setPos [11737.785, 11907.229];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

//Zaun innen
_vehicle_050 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11750.613, 11872.27];
	_vehicle_050 = _this;
	_this setDir 132.45055;
	_this setPos [11750.613, 11872.27];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_051 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11752.36, 11892.098];
	_vehicle_051 = _this;
	_this setDir 42.450562;
	_this setPos [11752.36, 11892.098];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_052 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11755.16, 11889.53];
	_vehicle_052 = _this;
	_this setDir 42.450562;
	_this setPos [11755.16, 11889.53];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_053 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11746.521, 11897.431];
	_vehicle_053 = _this;
	_this setDir 42.450562;
	_this setPos [11746.521, 11897.431];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_054 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11755.882, 11878.027];
	_vehicle_054 = _this;
	_this setDir 132.45055;
	_this setPos [11755.882, 11878.027];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_055 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11745.281, 11866.438];
	_vehicle_055 = _this;
	_this setDir 132.45055;
	_this setPos [11745.281, 11866.438];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_056 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11723.565, 11856.047];
	_vehicle_056 = _this;
	_this setDir -137.54944;
	_this setPos [11723.565, 11856.047];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_057 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11717.802, 11861.302];
	_vehicle_057 = _this;
	_this setDir -137.54944;
	_this setPos [11717.802, 11861.302];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_058 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11734.755, 11854.931];
	_vehicle_058 = _this;
	_this setDir 132.45055;
	_this setPos [11734.755, 11854.931];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_059 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11740.016, 11860.688];
	_vehicle_059 = _this;
	_this setDir 132.45055;
	_this setPos [11740.016, 11860.688];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_060 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11712.052, 11866.573];
	_vehicle_060 = _this;
	_this setDir -137.54944;
	_this setPos [11712.052, 11866.573];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_061 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_Gate_F" createvehiclelocal [11739.69, 11903.137];
	_vehicle_061 = _this;
	_this setDir -137.54944;
	_this setPos [11739.69, 11903.137];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_062 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11733.391, 11909.589];
	_vehicle_062 = _this;
	_this setDir 42.450562;
	_this setPos [11733.391, 11909.589];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_063 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11724.755, 11917.479];
	_vehicle_063 = _this;
	_this setDir 42.450562;
	_this setPos [11724.755, 11917.479];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_064 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11727.565, 11914.762];
	_vehicle_064 = _this;
	_this setDir 42.450562;
	_this setPos [11727.565, 11914.762];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_065 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11694.723, 11882.438];
	_vehicle_065 = _this;
	_this setDir -137.54944;
	_this setPos [11694.723, 11882.438];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_066 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11700.468, 11877.165];
	_vehicle_066 = _this;
	_this setDir -137.54944;
	_this setPos [11700.468, 11877.165];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_067 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11706.226, 11871.905];
	_vehicle_067 = _this;
	_this setDir -137.54944;
	_this setPos [11706.226, 11871.905];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_068 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11713.186, 11917.205];
	_vehicle_068 = _this;
	_this setDir -47.549438;
	_this setPos [11713.186, 11917.205];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_069 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11702.598, 11905.627];
	_vehicle_069 = _this;
	_this setDir -47.549438;
	_this setPos [11702.598, 11905.627];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_070 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11707.854, 11911.377];
	_vehicle_070 = _this;
	_this setDir -47.549438;
	_this setPos [11707.854, 11911.377];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_071 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11697.355, 11899.887];
	_vehicle_071 = _this;
	_this setDir -47.48423;
	_this setPos [11697.355, 11899.887];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_072 = objNull;
if (true) then
{
	_this = "Land_Mil_WiredFence_F" createvehiclelocal [11692.052, 11894.111];
	_vehicle_072 = _this;
	_this setDir -47.549438;
	_this setPos [11692.052, 11894.111];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

//Sicherheit
_vehicle_073 = objNull;
if (true) then
{
	_this = "Land_SportGround_fence_noLC_F" createvehiclelocal [11727.13, 11871.198];
	_vehicle_073 = _this;
	_this setDir -137.54944;
	_this setPos [11727.13, 11871.198];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_074 = objNull;
if (true) then
{
	_this = "Land_SportGround_fence_noLC_F" createvehiclelocal [11726.669, 11895.626];
	_vehicle_074 = _this;
	_this setDir -137.54944;
	_this setPos [11726.669, 11895.626];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_075 = objNull;
if (true) then
{
	_this = "Land_SportGround_fence_noLC_F" createvehiclelocal [11720.12, 11889.447, -3.8146973e-006];
	_vehicle_075 = _this;
	_this setDir -47.640469;
	_this setPos [11720.12, 11889.447, -3.8146973e-006];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_076 = objNull;
if (true) then
{
	_this = "Land_Shoot_House_Wall_F" createvehiclelocal [11727.13, 11895.132, 7.6293945e-006];
	_vehicle_076 = _this;
	_this setDir 42.394531;
	_this setPos [11727.13, 11895.132, 7.6293945e-006];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_077 = objNull;
if (true) then
{
	_this = "Land_Shoot_House_Wall_F" createvehiclelocal [11727.218, 11871.158, -3.8146973e-006];
	_vehicle_077 = _this;
	_this setDir 42.394531;
	_this setPos [11727.218, 11871.158, -3.8146973e-006];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_078 = objNull;
if (true) then
{
	_this = "Land_Shoot_House_Panels_F" createvehiclelocal [11720.228, 11889.515, 4.4345856e-005];
	_vehicle_078 = _this;
	_this setDir -47.530151;
	_this setPos [11720.228, 11889.515, 4.4345856e-005];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

//Werbetafel
_vehicle_079 = objNull;
if (true) then
{
	_this = "Land_Billboard_F" createvehiclelocal [11734.053, 11876.713, -0.66161507];
	_vehicle_079 = _this;
	_this setDir 132.45055;
	_this setPos [11734.053, 11876.713, -0.66161507];
	_this setObjectTexture [0, "core\textures\map\billboards\em_web.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

//Gefängnis Einrichtung
_vehicle_080 = objNull;
if (true) then
{
	_this = "Land_Sleeping_bag_brown_F" createvehiclelocal [11734.13, 11887.06, 0.76901924];
	_vehicle_080 = _this;
	_this setDir 43.760559;
	_this setPos [11734.13, 11887.06, 0.76901924];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_081 = objNull;
if (true) then
{
	_this = "Land_Ground_sheet_blue_F" createvehiclelocal [11732.226, 11883.931, 0.76901924];
	_vehicle_081 = _this;
	_this setDir 134.18855;
	_this setPos [11732.226, 11883.931, 0.76901924];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_082 = objNull;
if (true) then
{
	_this = "Land_HumanSkeleton_F" createvehiclelocal [11721.301, 11878.208, 0.82772923];
	_vehicle_082 = _this;
	_this setDir 6.0195465;
	_this setPos [11721.301, 11878.208, 0.82772923];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_083 = objNull;
if (true) then
{
	_this = "Land_Ground_sheet_khaki_F" createvehiclelocal [11725.882, 11878.476, 0.82772923];
	_vehicle_083 = _this;
	_this setDir -136.71628;
	_this setPos [11725.882, 11878.476, 0.82772923];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_084 = objNull;
if (true) then
{
	_this = "Land_StallWater_F" createvehiclelocal [11727.879, 11891.252, 0.79254848];
	_vehicle_084 = _this;
	_this setDir 219.17352;
	_this setPos [11727.879, 11891.252, 0.79254848];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_085 = objNull;
if (true) then
{
	_this = "Land_Sink_F" createvehiclelocal [11726.576, 11889.797, 0.70649713];
	_vehicle_085 = _this;
	_this setDir 131.95055;
	_this setPos [11726.576, 11889.797, 0.70649713];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_086 = objNull;
if (true) then
{
	_this = "Land_Cargo40_military_green_F" createvehiclelocal [11737.426, 11887.982, -0.046509869];
	_vehicle_086 = _this;
	_this setPos [11737.426, 11887.982, -0.046509869];
	_this setDir -137.54944;
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_087 = objNull;
if (true) then
{
	_this = "Land_Cargo20_light_green_F" createvehiclelocal [11739.183, 11889.762];
	_vehicle_087 = _this;
	_this setDir 42.450562;
	_this setPos [11739.183, 11889.762];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_088 = objNull;
if (true) then
{
	_this = "Land_Scaffolding_F" createvehiclelocal [11710.14, 11898.645];
	_vehicle_088 = _this;
	_this setDir 42.450562;
	_this setPos [11710.14, 11898.645];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_089 = objNull;
if (true) then
{
	_this = "Land_Coil_F" createvehiclelocal [11726.098, 11899.16];
	_vehicle_089 = _this;
	_this setDir -137.54944;
	_this setPos [11726.098, 11899.16];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_090 = objNull;
if (true) then
{
	_this = "Land_WoodenBox_F" createvehiclelocal [11723.695, 11900.535];
	_vehicle_090 = _this;
	_this setDir -14.50742;
	_this setPos [11723.695, 11900.535];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

//Gefängnis Verschönerungen
_vehicle_091 = objNull;
if (true) then
{
	_this = "Land_TTowerSmall_1_F" createvehiclelocal [11743.63, 11880.652];
	_vehicle_091 = _this;
	_this setDir -88.84185;
	_this setPos [11743.63, 11880.652];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_092 = objNull;
if (true) then
{
	_this = "Land_TTowerSmall_1_F" createvehiclelocal [11717.39, 11904.589];
	_vehicle_092 = _this;
	_this setDir 164.57449;
	_this setPos [11717.39, 11904.589];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_093 = objNull;
if (true) then
{
	_this = "Land_TTowerSmall_1_F" createvehiclelocal [11705.024, 11890.992];
	_vehicle_093 = _this;
	_this setDir 84.983543;
	_this setPos [11705.024, 11890.992];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_094 = objNull;
if (true) then
{
	_this = "Land_TTowerSmall_1_F" createvehiclelocal [11731.201, 11867.035];
	_vehicle_094 = _this;
	_this setDir -3.3024697;
	_this setPos [11731.201, 11867.035];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_095 = objNull;
if (true) then
{
	_this = "Land_Sign_WarningMilitaryArea_F" createvehiclelocal [11746.427, 11901.132];
	_vehicle_095 = _this;
	_this setDir -137.54944;
	_this setPos [11746.427, 11901.132];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_096 = objNull;
if (true) then
{
	_this = "Land_Sign_WarningMilitaryArea_F" createvehiclelocal [11736.882, 11909.762];
	_vehicle_096 = _this;
	_this setDir -137.54944;
	_this setPos [11736.882, 11909.762];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

//Lampen
_vehicle_097 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [11763.588, 11884.041];
	_vehicle_097 = _this;
	_this setDir 537.29279;
	_this setPos [11763.588, 11884.041];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_098 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [11744.755, 11899.77];
	_vehicle_098 = _this;
	_this setDir 126.11455;
	_this setPos [11744.755, 11899.77];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_099 = objNull;
if (true) then
{
	_this = "Land_LampHarbour_F" createvehiclelocal [11737.476, 11873.973];
	_vehicle_099 = _this;
	_this setDir 132.45055;
	_this setPos [11737.476, 11873.973];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = "Land_LampHarbour_F" createvehiclelocal [11742.104, 11882.063];
	_vehicle_100 = _this;
	_this setDir 42.450562;
	_this setPos [11742.104, 11882.063];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = "Land_LampHarbour_F" createvehiclelocal [11737.41, 11881.242, -1.8311524];
	_vehicle_101 = _this;
	_this setDir -92.549454;
	_this setPos [11737.41, 11881.242, -1.8311524];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [11730.251, 11847.621];
	_vehicle_102 = _this;
	_this setDir -92.549454;
	_this setPos [11730.251, 11847.621];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = "Land_LampHarbour_F" createvehiclelocal [11727.426, 11870.41];
	_vehicle_103 = _this;
	_this setDir -137.54944;
	_this setPos [11727.426, 11870.41];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [11735.723, 11908.127];
	_vehicle_104 = _this;
	_this setDir 140.66454;
	_this setPos [11735.723, 11908.127];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = "Land_LampHarbour_F" createvehiclelocal [11721.24, 11901.705];
	_vehicle_105 = _this;
	_this setDir 42.450562;
	_this setPos [11721.24, 11901.705];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = "Land_LampShabby_F" createvehiclelocal [11705.676, 11891.856];
	_vehicle_106 = _this;
	_this setDir -47.549438;
	_this setPos [11705.676, 11891.856];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = "Land_LampHarbour_F" createvehiclelocal [11708.41, 11887.828];
	_vehicle_107 = _this;
	_this setDir -137.54944;
	_this setPos [11708.41, 11887.828];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [11718.201, 11925.381];
	_vehicle_108 = _this;
	_this setDir 87.450546;
	_this setPos [11718.201, 11925.381];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = "Land_LampHalogen_F" createvehiclelocal [11685.229, 11888.973];
	_vehicle_109 = _this;
	_this setDir -2.5494566;
	_this setPos [11685.229, 11888.973];
	_this allowDamage false;
	_this setVectorUp [0,0,1];
};

//Shops
_vehicle_110 = objNull;
if (true) then
{
	_this = "Land_InfoStand_V2_F" createvehiclelocal [11731.05, 11890.447, 0.70392656];
	_vehicle_110 = _this;
	_this setDir 30.133295;
	_this setPos [11731.05, 11890.447, 0.70392656];
	_initCodes pushBack [_this,"this addAction[""Kaution bezahlen"",life_fnc_postBail,"""",0,false,false,"""",' isNil ""life_canpay_bail"" && life_is_arrested && vehicle player == player && player distance _target < 3 '];"];
	_this setObjectTexture [0,"core\textures\map\waffe.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = "Land_InfoStand_V2_F" createvehiclelocal [11732.06, 11889.742, 0.70949143];
	_vehicle_111 = _this;
	_this setDir 37.837463;
	_this setPos [11732.06, 11889.742, 0.70949143];
	_initCodes pushBack [_this,"this addAction[""JVA Kantine"",EMonkeys_fnc_virt_menu,""jva"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 '];"];
	_this setObjectTexture [0,"core\textures\map\haendler.paa"];
	_this allowDamage false;
	_this enableSimulation false;
	_this setVectorUp [0,0,1];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;