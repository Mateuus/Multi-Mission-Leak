update players SET civ_gear=REPLACE(civ_gear, '150Rnd_762x51_Box', '150Rnd_762x54_Box') where civ_gear like '%150Rnd_762x51_Box%';

update players SET civ_gear=REPLACE(civ_gear, '10Rnd_762x51_Mag', '10Rnd_762x54_Mag') where civ_gear like '%10Rnd_762x51_Mag%';