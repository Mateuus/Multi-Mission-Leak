if(life_barMusic) exitWith {};
life_barMusic = true;
[]spawn
{
	while {life_barMusicTrig} do
	{
		pnj_bar say3D "BarMusic";
		sleep 45.0;
	};
	life_barMusic = false;
};