#include "..\..\script_macros.hpp"
disableSerialization; 
_ctrl = _this select 0; 
_index = _this select 1; 

//ammo
if (ctrlIDC _ctrl == 2100 && _index == 0) then {CAS_TYPE = ["type", 0]};
if (ctrlIDC _ctrl == 2100 && _index == 1) then {CAS_TYPE = ["type", 1]};
if (ctrlIDC _ctrl == 2100 && _index == 2) then {CAS_TYPE = ["type", 2]};

//aircraft
if (ctrlIDC _ctrl == 2101 && _index == 0) then {CAS_PLANE = ["vehicle","B_Plane_CAS_01_F"]};
if (ctrlIDC _ctrl == 2101 && _index == 1) then {CAS_PLANE = ["vehicle","O_Plane_CAS_02_F"]};
if (ctrlIDC _ctrl == 2101 && _index == 2) then {CAS_PLANE = ["vehicle","I_Plane_Fighter_03_CAS_F"]};