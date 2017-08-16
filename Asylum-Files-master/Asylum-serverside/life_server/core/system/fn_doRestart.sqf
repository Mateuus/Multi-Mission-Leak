 
 
 
 
 
 
 
 
_endType = [_this,0,"end1",[""]] call BIS_fnc_param; 
 
if (ASY_UsingHeadless) then 
{ 
diag_log format["Attempting to kill headless by executing '%1'...", "ExecProcess AsylumHCRestart.bat"]; 
_shell = "Arma2Net.Unmanaged" callExtension "ExecProcess AsylumHCRestart.bat"; 
}; 
 
if (life_server_instance in [1,2,3]) then { "ArmaLeakTeam" serverCommand "#restart"; } 
else { [[_endType],"BIS_fnc_endMission", true, false] spawn BIS_fnc_MP; };