 private ["_jviqxtdiieluehnnbnkedxejulmfsjtbkrmrvqxqcflscpmfpeiukbmkizrnohmklimqkl","_sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt","_level","_qybgjpbzybehrluvilhlgqrrruocbxrackkatgxmjjvzxdsycaiuvfkjhhqsbbnswqoqzd"];  _qybgjpbzybehrluvilhlgqrrruocbxrackkatgxmjjvzxdsycaiuvfkjhhqsbbnswqoqzd = [_this,0,0,[0]] call BIS_fnc_param;   _sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt = 0; for "_i" from 1 to 101 do { 	if(_i < 80) then { 		_jviqxtdiieluehnnbnkedxejulmfsjtbkrmrvqxqcflscpmfpeiukbmkizrnohmklimqkl = (500 * (log(_i) / log(2)) * (_i/5)); 	} else { 		_jviqxtdiieluehnnbnkedxejulmfsjtbkrmrvqxqcflscpmfpeiukbmkizrnohmklimqkl = (10000 * ((log(_i) / log(2)) * (_i/5))) - 960000; 	}; 	_sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt = _sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt + _jviqxtdiieluehnnbnkedxejulmfsjtbkrmrvqxqcflscpmfpeiukbmkizrnohmklimqkl; 	if(leveling_xp < _sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt OR _i == 101) exitWith { 		leveling_level = _i - 1; 		if(leveling_level >= 100) then {leveling_level = 100; leveling_xp = _sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt;}; 		leveling_xpNeeded = _sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt; 		leveling_xpLastNeeded = _sgzrfxlyyqkqkswtbbweavmwetkbpuqbeldqnfadjnsiodcmyoghbnjwowsumxeszt - _jviqxtdiieluehnnbnkedxejulmfsjtbkrmrvqxqcflscpmfpeiukbmkizrnohmklimqkl; 		if(_qybgjpbzybehrluvilhlgqrrruocbxrackkatgxmjjvzxdsycaiuvfkjhhqsbbnswqoqzd != 0) then {perks_unspentPoints = leveling_level - perk_spentPoints;}; 		 		switch (_qybgjpbzybehrluvilhlgqrrruocbxrackkatgxmjjvzxdsycaiuvfkjhhqsbbnswqoqzd) do { 			case 1: { 				player say3d "levelup"; 				[[0,2],format[localize "STR_m_LeveledUp",leveling_level]] spawn life_fnc_broadcast; 			}; 			 			case 2: { 				player say3D "shame"; 				[[0,2],format[localize "STR_m_LeveledDown",leveling_level]] spawn life_fnc_broadcast; 			}; 		}; 	}; };  