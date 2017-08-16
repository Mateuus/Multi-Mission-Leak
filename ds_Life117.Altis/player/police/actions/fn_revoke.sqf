/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Revokes ones license
*/
private["_display","_text","_units","_type"];

if(DS_copLevel < 3)exitwith {hint "This is for rank 3 and above police officers!";};

_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1",_unit];
if(player distance _unit > 20)exitwith{hint "You can only revoke the license of somebody you nearby"};
[[(_this select 0)],"DS_fnc_licenseRevoke",_unit,false] spawn DS_fnc_MP;
if((_this select 0) == 0)then
	{
	hint format ["You have revoked %1s car license",name _unit];
	systemchat format ["You have revoked %1s car license",name _unit];
	}
	else
	{
	if((_this select 0) == 2)then
		{
		hint format ["You have revoked %1s gun license",name _unit];
		systemchat format ["You have revoked %1s gun license",name _unit];
		}
		else
		{
		hint format ["You have revoked %1s pilots license",name _unit];
		systemchat format ["You have revoked %1s pilots license",name _unit];
		};
	};