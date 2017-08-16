private["_target", "_message","_medlevel","_rang"];

_target = cursorTarget;

if(playerSide != independent) exitWith{hint "Du bist kein Sanitäter!"};
if(isNull _target || !(alive _target)) exitWith {};

_mode = [
	format["Welchen Ausweis möchtest du zeigen?"],
	"Ausweis",
	"Facharzt",
	"Mechaniker"
] call BIS_fnc_guiMessage;


if(_mode) then {

	_rang = [call life_ahwLevel,playerside,0] call life_fnc_getrang;
	_message = format["<img size='10' color='#FFFFFF' image='images\ahw_ausweis_arzt.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>AHW-Ärztekammer</t>", name player, _rang];
	[player, _message] remoteExecCall ["life_fnc_LicenseShown",_target];

} else {

	_rang = [call life_ahwLevel,playerside,1] call life_fnc_getrang;
	_message = format["<img size='10' color='#FFFFFF' image='images\ahw_ausweis_mechaniker.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>AHW-Handwerkskammer</t>", name player, _rang];
	[player, _message] remoteExecCall ["life_fnc_LicenseShown",_target];
};