private["_target", "_message","_coplevel","_rang","_nameText","_playerData"];

_target = cursorTarget;

if(playerSide != civilian) exitWith
{
	hint "Du bist kein Zivilist!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};


_nameText = format["<br/><t size='1.3'>%1<br/><t size='1'>(Level %2)",name player,ES_xp_lvl];

if(license_civ_rebel) then
{
	_message = format["<img size='10' color='#FFFFFF' image='Images\Logos\Logo.jpg'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>%3</t><br/>",name player,"Rebell",_nameText];
};
if(!license_civ_rebel) then 
{
	_message = format["<img size='10' color='#FFFFFF' image='Images\Logos\Logo.jpg'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>%3</t><br/>",name player,"Zivilist",_nameText];
};

[[player, _message],"ES_fnc_civShow",_target,false] spawn ES_fnc_MP;