/*
file name: fn_typeText2.sqf

Author: Barny
Description : Shows message local on each client with lhm_fnc_mp
*/
private ["_text1","_text2","_text3","_farbe1","_farbe2","_farbe3"];
_text1 = param [0,"",[""]];
_text2 = param [1,"",[""]];
_text3 = param [2,"",[""]];
_text4 = param [3,"",[""]];
_text5 = param [4,"",[""]];
_text6 = param [5,"",[""]];

_farbe1 = param [6,"",[""]];
_farbe2 = param [7,"",[""]];
_farbe3 = param [8,"",[""]];



[    
	[    
		[format["%1,",_text1],"align = 'center' shadow = '0' size = '1.2' font='PuristaBold'",_farbe1],    
		[_text2,"align = 'center' shadow = '1' size = '1'",_farbe2],   
		["","<br/>"],   
		[_text3,"align = 'center' shadow = '1' size = '1.0'",_farbe3],
		["","<br/>"],
		[_text4,"align = 'center' shadow = '1' size = '1.0'",_farbe3],
		["","<br/>"], 
		[_text5,"align = 'center' shadow = '1' size = '1.0'",_farbe3],
		["","<br/>"], 
		[_text6,"align = 'center' shadow = '1' size = '1.0'",_farbe3]
	]     
 ] spawn BIS_fnc_typeText2;
