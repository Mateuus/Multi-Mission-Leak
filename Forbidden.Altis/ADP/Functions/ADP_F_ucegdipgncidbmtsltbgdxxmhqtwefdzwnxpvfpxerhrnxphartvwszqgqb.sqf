      _KeyNum = _this select 1; _KeyCheck = format ["%1", _KeyNum]; if (_KeyCheck == "24") then { 	disableSerialization; 	 	 	if(life_isAlive) then {closeDialog 0;}; 	if(isNil "ADP_lastTab") then {ADP_lastTab = 1;}; 	if(isNil "ADPFade") then {ADPFade = 0;}; 	switch (ADP_lastTab) do { 		case 0: {[true] spawn ADP_fnc_ndsybjptxwqixppdiqgpiumakpibsmjgnlshiudulvnffjfodg;}; 		case 1: {[true] spawn ADP_fnc_adpMain;}; 		case 2: {[true] spawn ADP_fnc_iiglvqyubunxskkcuapgnyknpbrbadnpdqhfegozvfkwquvswtv;}; 		case 3: {[true] spawn ADP_fnc_havzyadaqqqecudzryocdruhpzmvesqrxfketorpetwwjgrvdwrhrgxvkbx;}; 		case 4: {[true] spawn ADP_fnc_ssqixfzneimkhownrodvsniaaedmglqlymuutbysnfypippzqn;}; 		case 5: {[true] spawn ADP_fnc_adpEvents;}; 		case 6: {[true] spawn ADP_fnc_bwjgbwwqcnxmhsnptfpkrfnopvqpsdxwqpjwfyzjbctyjhijquqmuxj;}; 	}; }; 