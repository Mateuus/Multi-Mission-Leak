private["_title","_texte","_colortitle","_colorinhalt","_zeit","_text"];
_title = [_this,0,"",[""]] call BIS_fnc_param;
_inhalt = [_this,1,"",[""]] call BIS_fnc_param;
_colortitle = [_this,2,"",[""]] call BIS_fnc_param;
_colorinhalt = [_this,3,"",[""]] call BIS_fnc_param;
_zeit = [_this,4,10,[1]] call BIS_fnc_param;
_text = "";

[parseText format 
 ["<t align='center' color = '%1' size='2'>%3 </t> 
  <t align='center' font='PuristaMedium' color = '%2' size='1.5'>%4</t>", 
  _colortitle,_colorinhalt,_title,_inhalt 
 ], 
 [0.0101562 * safezoneW + safezoneX,0.027 * safezoneH + safezoneY,0.979687 * safezoneW,0.044 * safezoneH],
 nil, 
 _zeit,
 0.7, 
 0 
] spawn BIS_fnc_textTiles;