/*

	if send has been clicked

*/

private["_index", "_message","_asadmin","_msgtype","_dstdata","_dst"];

_asadmin = _this select 0;

_index = lbCurSel 1501;
_message = ctrlText 1400;

if(_index == -1) exitWith {};
if(_message == "") exitWith {};
if(_asadmin && ((call EMonkeys_adminlevel) < 1)) exitWith {};

ctrlSetText [1400, ""];


//Load data
_msgtype = lbValue[1501,_index];
_dstdata = lbData[1501,_index];

if(_msgtype == -1) exitWith {};

//Send message
switch(_msgtype) do 
{
	case 1: //To all police
	{
		[[_message,name player,1],"clientMessage",true,false] call EMonkeys_fnc_mp;
	};
	case 5: //Police => All
	{
		[[_message,name player,5],"clientMessage",true,false] call EMonkeys_fnc_mp;
	};
	case 2: //To all admins
	{
		[[_message,name player,2],"clientMessage",true,false] call EMonkeys_fnc_mp;
	};
	case 4: //Admins => All
	{
		[[_message,name player,4],"clientMessage",true,false] call EMonkeys_fnc_mp;
	};
	case 7: //To all medic
	{
		[[_message,name player,7],"clientMessage",true,false] call EMonkeys_fnc_mp;
	};
	case 8: //To all Lotsen
	{
		[[_message,name player,8],"clientMessage",true,false] call EMonkeys_fnc_mp;
	};
	case 0: //To a person
	{
		_dst = call compile format["%1",_dstdata];
		if(isNull _dst) exitWith {};
		if(isNil "_dst") exitWith {};
	
		if(!_asadmin) then //Msgtype 0
		{
			[[_message,name player,0],"clientMessage",_dst,false] call EMonkeys_fnc_mp;
		}
		else //Msgtype 3
		{
			[[_message,name player,3],"clientMessage",_dst,false] call EMonkeys_fnc_mp;
		};
	};
};

hint "Antwort gesendet.";

