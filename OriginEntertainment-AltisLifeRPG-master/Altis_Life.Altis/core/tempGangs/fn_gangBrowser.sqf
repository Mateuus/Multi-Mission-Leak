/*	
	File: fn_gangBrowser.sqf	
*/

private["_gangs","_dialog","_gang","_locked"];
disableSerialization;

waitUntil {!isNull (findDisplay 2520)};
_dialog = findDisplay 2520;
_gangs = _dialog displayCtrl 2521;

{	
	_gang = _x;	
	if(!isNull (_gang select 1)) then	
	{		
		if((_gang select 2)) then		
		{			
			_locked = "Locked";		
		}			
			else		
		{			
			_locked = "Unlocked";		
		};				
		
		_gangs lbAdd format["%1 [Members: %2] - %3",_gang select 0,count (units(_gang select 1)),_locked];		
		_gangs lbSetData [(lbSize _gangs)-1,_gang select 0];	
	};
} foreach (life_group_list);

if(((lbSize _gangs)-1) == -1) then
{	
	_gangs lbAdd "No groups currently created.";	
	ctrlShow[2522,false];
};