/*

	Show cop license to target player

*/

private["_target", "_message","_rank","_coplevel"];

_target = cursorTarget;

if(playerSide != west) exitWith
{
	hint "Du bist kein Cop!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_rank = "Kein Cop !?";
_coplevel = call EMonkeys_coplevel;

//Set rank
switch ( _coplevel ) do
{
	case 0: { _rank = "Kadett"; };
	case 1: { _rank = "Polizei Anwärter"; };
	case 2: { _rank = "Beamter im mittleren Dienst"; };
	case 3: { _rank = "Beamter im mittleren Dienst"; };
	case 4: { _rank = "Beamter im mittleren Dienst"; };
	case 5: { _rank = "Beamter im gehobenen Dienst"; };
	case 6: { _rank = "Beamter im gehobenen Dienst"; };
	default { _rank = "Beamter im höheren Dienst";};
};


_message = format["<img size='10' color='#FFFFFF' image='core\textures\icons\police_gold.paa'/><br/><br/><t size='1'>Bundespolizei Altis<br/></t><t size='2'>%1</t><br/><t size='1.5'>%2</t><br/>", name player, _rank];


[[player, _message],"EMonkeys_fnc_copLicenseShown",_target,false] call EMonkeys_fnc_mp;
