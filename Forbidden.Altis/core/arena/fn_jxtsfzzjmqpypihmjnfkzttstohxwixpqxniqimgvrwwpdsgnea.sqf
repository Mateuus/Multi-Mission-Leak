private["_orjglniseohactiibsjfnvyshscmjvxsppxjrvqaxghrivczazzsdgsadxyvvlhxvu","_mhgkabbvyyagugreuhlaaiyljndyfvdpyjbqgwbftzvmzvobryxuwvdbsbegqezx","_dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu","_hlpdeobcoguiiduibyqvyrseccesvjpbobewqobxrdjvzgyvspusnigdhrmwwvkumcdf"]; disableSerialization; _orjglniseohactiibsjfnvyshscmjvxsppxjrvqaxghrivczazzsdgsadxyvvlhxvu = [_this,0,[],[[]]] call BIS_fnc_param; _mhgkabbvyyagugreuhlaaiyljndyfvdpyjbqgwbftzvmzvobryxuwvdbsbegqezx = findDisplay 5000; _dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu = _mhgkabbvyyagugreuhlaaiyljndyfvdpyjbqgwbftzvmzvobryxuwvdbsbegqezx displayctrl 5001;  lbClear _dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu; { 	_hlpdeobcoguiiduibyqvyrseccesvjpbobewqobxrdjvzgyvspusnigdhrmwwvkumcdf = _x; 	_dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu lbAdd format["%1", _hlpdeobcoguiiduibyqvyrseccesvjpbobewqobxrdjvzgyvspusnigdhrmwwvkumcdf select 1]; 	_dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu lbSetData [(lbSize _dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu)-1,str(_hlpdeobcoguiiduibyqvyrseccesvjpbobewqobxrdjvzgyvspusnigdhrmwwvkumcdf)]; } foreach _orjglniseohactiibsjfnvyshscmjvxsppxjrvqaxghrivczazzsdgsadxyvvlhxvu;  if(((lbSize _dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu)-1) == -1) then { 	_dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu lbAdd "Inga aktiva lobbys"; 	_dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu lbSetData [(lbSize _dgnuhhzrzzyqwcjntfrljkotemyrcfvqkkgqfambugkfhkskrzcoqcstyyvxcfuogyqhu)-1,str ["0165","0165"]]; };  ctrlSetText[5105,"Ansluten"]; 