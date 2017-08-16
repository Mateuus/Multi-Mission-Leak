/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_specialText.sqf
	Server: e-Monkeys.com
    
    Description: Spawn a special Massage
*/
private["_headline","_texte","_color1","_color2","_time","_text"];
_headline = [_this,0,"",[""]] call BIS_fnc_param;
_texte = [_this,1,[],[[]]] call BIS_fnc_param;
_color1 = [_this,2,"",[""]] call BIS_fnc_param;
_color2 = [_this,3,"",[""]] call BIS_fnc_param;
_time = [_this,4,10,[1]] call BIS_fnc_param;
_text = "";

{
	_addtext = format["%1<br/>",_x];
	_text = _text + _addtext;
}foreach _texte;

[parseText format
	["	<t align='right'><t color = '%1' font='PuristaBold' size='2'>%3<br/></t>
		<t font='PuristaMedium' color = '%2' size='1.5'>%4</t></t>",
		_color1,_color2,_headline,_text
	],
	[0.618594 * safezoneW + safezoneX, 0.456 * safezoneH + safezoneY, 0.350625 * safezoneW, 0.286 * safezoneH],
	nil,
	_time,
	0.7,
	0
] spawn BIS_fnc_textTiles;
playsound "ReadoutClick";