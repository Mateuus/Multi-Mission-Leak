private["_object","_index","_texture"];
_object = param [0,ObjNull,[ObjNull]];
_index = param [1,0,[0]];
_texture = param [2,"",[""]];

if(isNull _object OR _texture == "") exitWith {};
_object setObjectTexture[_index,_texture];