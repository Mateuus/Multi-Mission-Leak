/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : Noldy and CYNX
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/

Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
HALLO PHIL UND LARGO. WIE IHR SEHEN KÖNNT IST DAS HIER PUBLIC UND NICHT VON SYNCED41!
*/

private["_target", "_message","_coplevel","_rang"];

_target = cursorTarget;

if(playerSide != west) exitWith
{
	hint "Du bist kein Cop!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_coplevel = call life_coplevel;

switch ( _coplevel ) do
{
	case 1: { _rang = "M.R.S.F"; };
	case 2: { _rang = "Cadet"; };
	case 3: { _rang = "2nd Officer"; };
	case 4: { _rang = "1st Officer"; };
	case 5: { _rang = "Warrant Officer"; };
	case 6: { _rang = "2nd Sergeant"; };
	case 7: { _rang = "1st Sergeant"; };
	case 8: { _rang = "Detective"; };
	case 9: { _rang = "2nd Lieutenant"; };
	case 10: { _rang = "1st Lieutenant"; };
	case 11: { _rang = "Captain"; };
	case 12: { _rang = "Chief"; };
	default {_rang =  "NLPD";};
};
if(license_cop_mrsf) then {_message = format["<img size='10' color='#FFFFFF' image='icons\ranks\mrsf.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>neighbourhood-life</t>", name player, _rang];}
else {
_message = format["<img size='10' color='#FFFFFF' image='Texturen\marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>neighbourhood-life</t>", name player, _rang];};

[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
