private["_target", "_message","_mediclevel","_rang"];

_target = cursorTarget;

if(playerSide != independent) exitWith
{
	hint "Du bist nicht bei der Feuerwehr!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_mediclevel = call ES_mediclevel;

switch ( _mediclevel ) do
{
	case 1: { _rang = "ADAC"; };
	case 2: { _rang = "Medic"; };
	case 3: { _rang = "Feuerwehr"; };
	case 4: { _rang = "Löschmeister"; };
	case 5: { _rang = "Küstenrettung"; };
	case 6: { _rang = "Co.-Leitung"; };
	case 7: { _rang = "Leitung"; };
	default { _rang =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='Images\Logos\Logo.jpg'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Rettungsdienst Altis</t>", name player, _rang];

[[player, _message],"ES_fnc_medLicenseShown",_target,false] spawn ES_fnc_MP;