 private["_jekabmhhztzbpmwtnkhxutfijmorfnxvlnzziaxnavxccapmzuymuzsohtrfxmolojaelm","_nrczdbenfqotraambpxxixyfhrcxtopbkrvsumehcvaajlowlxdyrolgywtkrk","_vfhnrtwdktxrlvnbxtwvofvehwueiajuphotfqkainfjwqsbyeprjqcoeqwsoygmcbqyrm","_udokpvnjkxzrjcxuzjejrpcwbmxrodpdnqigrgjdibwqzklhevkgfvipncgnufpjs","_lcdpvxjejzrksppwveoopbjkmsowpffitpefubhtjubddvdujwtlayuuotnv","_wkqlfjxbuhrwuiafcokarrwlxnwaejjgalphuwojvnvxjzcgbnhwuwjkmpvywahvvn","_gpzlondwttfaooxkovtxgnxcdybkrjafyrctekgpdhlecgqjkohrehozmbnjds","_potsjwyyhpqgooqstpbtckzpwergvvycaxdozjowgevkuusgmeifpxoglsjadug","_npjlzlwopidmscdpolvxvrqzvzjdbbflicseshrxtzwiqrddxwqpvbadtnwualv","_aenypmbvtkvwdwniyqruxmkkcynciiiezentjxccdyshtjrcvoiybukwumcnxa"]; disableSerialization;  _data = lbData[5001,(lbCurSel 5001)]; _data = call compile format["%1", _data]; if((_data select 1) == "0165") exitWith {}; _npjlzlwopidmscdpolvxvrqzvzjdbbflicseshrxtzwiqrddxwqpvbadtnwualv = false;  ctrlShow[5201,true]; ctrlShow[5202,false]; ctrlShow[5203,false];  ctrlShow[5301,true]; ctrlShow[5302,true]; ctrlShow[5303,true]; ctrlShow[5305,true]; ctrlShow[5306,true]; ctrlShow[5308,true]; ctrlShow[5309,true];  _jekabmhhztzbpmwtnkhxutfijmorfnxvlnzziaxnavxccapmzuymuzsohtrfxmolojaelm = findDisplay 5000; _nrczdbenfqotraambpxxixyfhrcxtopbkrvsumehcvaajlowlxdyrolgywtkrk = _jekabmhhztzbpmwtnkhxutfijmorfnxvlnzziaxnavxccapmzuymuzsohtrfxmolojaelm displayCtrl 5302; _vfhnrtwdktxrlvnbxtwvofvehwueiajuphotfqkainfjwqsbyeprjqcoeqwsoygmcbqyrm = _jekabmhhztzbpmwtnkhxutfijmorfnxvlnzziaxnavxccapmzuymuzsohtrfxmolojaelm displayCtrl 5303;  if(isNil "_data") exitWith {_nrczdbenfqotraambpxxixyfhrcxtopbkrvsumehcvaajlowlxdyrolgywtkrk lbAdd "Failed to fetch list (1)";}; if(typeName _data != "ARRAY") exitWith {_nrczdbenfqotraambpxxixyfhrcxtopbkrvsumehcvaajlowlxdyrolgywtkrk lbAdd "Failed to fetch list (2)";}; if(count _data == 0) exitWith {_nrczdbenfqotraambpxxixyfhrcxtopbkrvsumehcvaajlowlxdyrolgywtkrk lbAdd "Failed to fetch list (3)";};  _gpzlondwttfaooxkovtxgnxcdybkrjafyrctekgpdhlecgqjkohrehozmbnjds = _data select 0; _potsjwyyhpqgooqstpbtckzpwergvvycaxdozjowgevkuusgmeifpxoglsjadug = _data select 1; _lcdpvxjejzrksppwveoopbjkmsowpffitpefubhtjubddvdujwtlayuuotnv = _data select 2; _wkqlfjxbuhrwuiafcokarrwlxnwaejjgalphuwojvnvxjzcgbnhwuwjkmpvywahvvn = _data select 3; _aenypmbvtkvwdwniyqruxmkkcynciiiezentjxccdyshtjrcvoiybukwumcnxa = _data select 4;  if(_aenypmbvtkvwdwniyqruxmkkcynciiiezentjxccdyshtjrcvoiybukwumcnxa != "") then { 	ctrlShow[5204,true]; 	ctrlShow[5205,true]; } else { 	ctrlShow[5204,false]; 	ctrlShow[5205,false]; };  lbClear _nrczdbenfqotraambpxxixyfhrcxtopbkrvsumehcvaajlowlxdyrolgywtkrk; lbClear _vfhnrtwdktxrlvnbxtwvofvehwueiajuphotfqkainfjwqsbyeprjqcoeqwsoygmcbqyrm;  ctrlSetText[5201,format["Namn: %1",_potsjwyyhpqgooqstpbtckzpwergvvycaxdozjowgevkuusgmeifpxoglsjadug]]; ctrlSetText[5301,format["Vard: %1",name _gpzlondwttfaooxkovtxgnxcdybkrjafyrctekgpdhlecgqjkohrehozmbnjds]];   if(count _lcdpvxjejzrksppwveoopbjkmsowpffitpefubhtjubddvdujwtlayuuotnv > 0) then { 	{ 		_nrczdbenfqotraambpxxixyfhrcxtopbkrvsumehcvaajlowlxdyrolgywtkrk lbAdd format["%1",name _x]; 		if(_x == player) then {_npjlzlwopidmscdpolvxvrqzvzjdbbflicseshrxtzwiqrddxwqpvbadtnwualv = true;}; 	} foreach _lcdpvxjejzrksppwveoopbjkmsowpffitpefubhtjubddvdujwtlayuuotnv; };  if(count _wkqlfjxbuhrwuiafcokarrwlxnwaejjgalphuwojvnvxjzcgbnhwuwjkmpvywahvvn > 0) then { 	{ 		_vfhnrtwdktxrlvnbxtwvofvehwueiajuphotfqkainfjwqsbyeprjqcoeqwsoygmcbqyrm lbAdd format["%1",name _x]; 		if(_x == player) then {_npjlzlwopidmscdpolvxvrqzvzjdbbflicseshrxtzwiqrddxwqpvbadtnwualv = true;}; 	} foreach _wkqlfjxbuhrwuiafcokarrwlxnwaejjgalphuwojvnvxjzcgbnhwuwjkmpvywahvvn; };  if(_npjlzlwopidmscdpolvxvrqzvzjdbbflicseshrxtzwiqrddxwqpvbadtnwualv) then { 	ctrlShow[5310,true]; 	ctrlShow[5311,true]; 	ctrlShow[5308,false]; 	ctrlShow[5309,false]; }; 