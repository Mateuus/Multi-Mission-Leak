if((damage player) < 0.25) exitWith {};
if(!("FirstAidKit" in (items player))) exitWith {};
player removeItem "FirstAidKit";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 3;
player setDamage 0.25;