// ----------------- WIND -------------------- //
player createDiaryRecord ["tort_DiaryWeatherMenu", ["Wind","<br/>
<execute expression = '[] call infoboard_on; tort_process_wind = true'>[Wind processing ON]</execute> -
 <execute expression = '[] call infoboard_on; tort_process_wind = false'>[Wind processing OFF]</execute><br/>
<br/>
Apply wind speed(Bft) NOW:<br/>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 0'>0</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 1'>1</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 2.5'>2</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 4.45'>3</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 6.75'>4</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 9.4'>5</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 12.35'>6</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 15.55'>7</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 19'>8</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 22.65'>9</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 26.5'>10</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 30.6'>11</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_now = 35.1'>12</execute><br/>
Apply direction NOW:<br/>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 0'>N</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 45'>NE</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 90'>E</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 135'>SE</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 180'>S</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 225'>SW</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 270'>W</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_dir_now = 315'>NW</execute>
<br/>
<br/>
Wind details:<br/>
Minimum speed (Bft):
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 0'>0</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 1'>1</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 2.5'>2</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 4.45'>3</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 6.75'>4</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 9.4'>5</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 12.35'>6</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 15.55'>7</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 19'>8</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 22.65'>9</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 26.5'>10</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 30.6'>11</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_min = 35.1'>12</execute>
<br/>
Maximum speed (Bft):
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 0'>0</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 1'>1</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 2.5'>2</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 4.45'>3</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 6.75'>4</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 9.4'>5</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 12.35'>6</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 15.55'>7</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 19'>8</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 22.65'>9</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 26.5'>10</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 30.6'>11</execute>
 <execute expression = 'tort_process_wind = true;tort_wind_speed_max = 35.1'>12</execute>
<br/>
Direction A:
 <execute expression = 'tort_wind_dir_min = 0'>N</execute>
 <execute expression = 'tort_wind_dir_min = 45'>NE</execute>
 <execute expression = 'tort_wind_dir_min = 90'>E</execute>
 <execute expression = 'tort_wind_dir_min = 135'>SE</execute>
 <execute expression = 'tort_wind_dir_min = 180'>S</execute>
 <execute expression = 'tort_wind_dir_min = 225'>SW</execute>
 <execute expression = 'tort_wind_dir_min = 270'>W</execute>
 <execute expression = 'tort_wind_dir_min = 315'>NW</execute>
<br/>
Direction B:
 <execute expression = 'tort_wind_dir_max = 0'>N</execute>
 <execute expression = 'tort_wind_dir_max = 45'>NE</execute>
 <execute expression = 'tort_wind_dir_max = 90'>E</execute>
 <execute expression = 'tort_wind_dir_max = 135'>SE</execute>
 <execute expression = 'tort_wind_dir_max = 180'>S</execute>
 <execute expression = 'tort_wind_dir_max = 225'>SW</execute>
 <execute expression = 'tort_wind_dir_max = 270'>W</execute>
 <execute expression = 'tort_wind_dir_max = 315'>NW</execute>
<br/>
Weighting:
 <execute expression = 'tort_wind_weighting = -1'>-1</execute>
 <execute expression = 'tort_wind_weighting = -0.75'>-0.75</execute>
 <execute expression = 'tort_wind_weighting = -0.5'>-0.5</execute>
 <execute expression = 'tort_wind_weighting = -0.25'>-0.25</execute>
 <execute expression = 'tort_wind_weighting = 0'>0</execute>
 <execute expression = 'tort_wind_weighting = 0.25'>0.25</execute>
 <execute expression = 'tort_wind_weighting = 0.5'>0.5</execute>
 <execute expression = 'tort_wind_weighting = 0.75'>0.75</execute>
 <execute expression = 'tort_wind_weighting = 1'>1</execute>
<br/>
Turbulence:
 <execute expression = 'tort_wind_turbulence = 0'>0</execute>
 <execute expression = 'tort_wind_turbulence = 0.1'>0.1</execute>
 <execute expression = 'tort_wind_turbulence = 0.2'>0.2</execute>
 <execute expression = 'tort_wind_turbulence = 0.3'>0.3</execute>
 <execute expression = 'tort_wind_turbulence = 0.4'>0.4</execute>
 <execute expression = 'tort_wind_turbulence = 0.5'>0.5</execute>
 <execute expression = 'tort_wind_turbulence = 0.6'>0.6</execute>
 <execute expression = 'tort_wind_turbulence = 0.7'>0.7</execute>
 <execute expression = 'tort_wind_turbulence = 0.8'>0.8</execute>
 <execute expression = 'tort_wind_turbulence = 0.9'>0.9</execute>
 <execute expression = 'tort_wind_turbulence = 1'>1</execute>
<br/>
<br/>
<execute expression = '[] call infoboard_on'>[Infoboard ON]</execute> - <execute expression = '[] call infoboard_off'>[Infoboard OFF]</execute>
"]];