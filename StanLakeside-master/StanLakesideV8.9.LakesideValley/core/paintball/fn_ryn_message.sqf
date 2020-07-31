params [["_titel", "", [""]], ["_message", "", [""]]];

_hint = parseText format ["<t color='#ffff00'>%1</t><br/><br/><t color='#FFFFFF'>%2</t>", _titel,_message];

hint _hint; 