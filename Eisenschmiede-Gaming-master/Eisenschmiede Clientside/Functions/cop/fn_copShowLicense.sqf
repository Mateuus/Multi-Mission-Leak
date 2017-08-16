private["_target", "_message","_coplevel","_rang"];

_target = cursorTarget;

if(playerSide != west) exitWith
{
	hint "Du bist kein Cop!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_coplevel = call ES_coplevel;

switch ( _coplevel ) do
{
	case 1: { _rang = "Cadet"; };
	case 2: { _rang = "Deputy"; };
	case 3: { _rang = "Officer"; };
	case 4: { _rang = "Detective"; };
	case 5: { _rang = "Inspector"; };
	case 6: { _rang = "Commissioner"; };
	case 7: { _rang = "Major"; };
	case 8: { _rang = "FBI"; };
	case 9: { if(license_cop_ncis) then { _rang = "NCIS"; }else{ _rang = "SWAT"; }; };
	case 10: { _rang = "Marshal"; };
	case 11: { _rang = "Secretary"; };
	case 12: { _rang = "Police Chief"; };
	default { _rang =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='Images\Logos\Marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Police Altis</t>", name player, _rang];

[[player, _message],"ES_fnc_copLicenseShown",_target,false] spawn ES_fnc_MP;