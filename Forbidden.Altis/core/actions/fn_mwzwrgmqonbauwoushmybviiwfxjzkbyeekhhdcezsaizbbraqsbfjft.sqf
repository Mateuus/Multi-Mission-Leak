 private["_tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk","_qkuoddkonkrbpcbzkjfbhverljpisiijsctdlalmicccjxzuzkvregjqtfpykth","_iexqvrkwsxolrohpbhwgsertxlugrcanxsqfyckmofsjkrfpbcyyzxerjqnns","_zdpxptsfsmefolrkymmteresknbmnblqivilfagedazgyppersezmtqgayun"]; _tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk = cursorTarget; _qkuoddkonkrbpcbzkjfbhverljpisiijsctdlalmicccjxzuzkvregjqtfpykth = player; _iexqvrkwsxolrohpbhwgsertxlugrcanxsqfyckmofsjkrfpbcyyzxerjqnns = getPos _qkuoddkonkrbpcbzkjfbhverljpisiijsctdlalmicccjxzuzkvregjqtfpykth; _zdpxptsfsmefolrkymmteresknbmnblqivilfagedazgyppersezmtqgayun = getDir _qkuoddkonkrbpcbzkjfbhverljpisiijsctdlalmicccjxzuzkvregjqtfpykth;  if(isNull _tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk) exitWith {}; if(_qkuoddkonkrbpcbzkjfbhverljpisiijsctdlalmicccjxzuzkvregjqtfpykth distance _tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk > 5) exitWith {};  if(local _tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk) then { 	[_qkuoddkonkrbpcbzkjfbhverljpisiijsctdlalmicccjxzuzkvregjqtfpykth,_tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk,_iexqvrkwsxolrohpbhwgsertxlugrcanxsqfyckmofsjkrfpbcyyzxerjqnns,_zdpxptsfsmefolrkymmteresknbmnblqivilfagedazgyppersezmtqgayun] spawn life_fnc_pushFunction; } 	else { 	[[_qkuoddkonkrbpcbzkjfbhverljpisiijsctdlalmicccjxzuzkvregjqtfpykth,_tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk,_iexqvrkwsxolrohpbhwgsertxlugrcanxsqfyckmofsjkrfpbcyyzxerjqnns,_zdpxptsfsmefolrkymmteresknbmnblqivilfagedazgyppersezmtqgayun],"life_fnc_pushFunction",_tuxqvxyzdspxaqgkpavfmiljorqamgrdskttqzwkuqdwjpxagndsjucrzdsxdmwatk,false] call life_fnc_MP; }; 