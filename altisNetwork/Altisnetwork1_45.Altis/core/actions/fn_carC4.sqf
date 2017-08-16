/*
	Author: Saturin78
	Description:
	Mit dieser Datei werden Sprengladungen an Fahrzeuge gepackt und nach 4 Minuten gesprengt!	
	Edited by Iam_Nico and AmaZiinG
*/
private["_vault", "_handle", "_carc4"];
_vault = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith
{}; //Bad object
if(!(_vault isKindOf "AllVehicles")) exitWith
{
	hint "You can not attach the car bomb here!"
};
if(player distance _vault > 7) exitWith
{
	hint "You have to put it closer to the vehicle!"
};
if(!([false, "carC4", 1] call life_fnc_handleInv)) exitWith {}; //Error?
closeDialog 0;
life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
life_action_inUse = false;
if(player distance _vault > 7) exitWith
{
	titleText["You are not near a vehicle!", "PLAIN"];
};
titleText["You have mounted the C4 on the vehicle.", "PLAIN"];
sleep 10;
_vault setVariable["chargeplaced", true, true];
titleText["blowing up in 1 Minute, please Keep distance!", "PLAIN"];
sleep 30;
titleText["blowing up in 30 seconds, please Keep distance!", "PLAIN"];
sleep 20;
//[player, "carC4"] call life_fnc_globalSound;
titleText["blowing up in 10 seconds, please Keep distance!", "PLAIN"];
sleep 10;
_carc4 = "Bo_Mk82"
createVehicle[0, 0, 9999];
_carc4 setPos(getPos _vault);
_carc4 setVelocity[100, 0, 0];
titleText["Boom Vehicle has blown up!", "PLAIN"];
[0, format["%1 has blown up a vehicle .", name player]] remoteExec["life_fnc_broadcast", 0];