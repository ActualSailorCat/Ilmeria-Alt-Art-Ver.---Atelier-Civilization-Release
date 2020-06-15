-----------------------------------------------
-- Colors
-----------------------------------------------
INSERT INTO Colors
        (Type,								 Color)
VALUES  ('COLOR_SAILOR_ILMERIA_ALT_PRIMARY',	'62,80,140,255'),
        ('COLOR_SAILOR_ILMERIA_ALT_SECONDARY',	'206,83,97,255'),
		('COLOR_SAILOR_ILMERIA_ALT_PRIMARY2',	'79,101,177,255'),
        ('COLOR_SAILOR_ILMERIA_ALT_SECONDARY2',	'138,173,215,255'),
		('COLOR_SAILOR_ILMERIA_ALT_PRIMARY3',	'99,107,132,255'),
        ('COLOR_SAILOR_ILMERIA_ALT_SECONDARY3',	'126,178,186,255');

-----------------------------------------------
-- PlayerColors
-----------------------------------------------
INSERT INTO PlayerColors (
		Type,
		Usage, 
		PrimaryColor, 
		SecondaryColor, 
		Alt1PrimaryColor, 
		Alt1SecondaryColor, 
		Alt2PrimaryColor, 
		Alt2SecondaryColor, 
		Alt3PrimaryColor, 
		Alt3SecondaryColor)
VALUES	('LEADER_SAILOR_ILMERIA_ALT',
		'Unique',
		'COLOR_SAILOR_ILMERIA_ALT_PRIMARY',
		'COLOR_SAILOR_ILMERIA_ALT_SECONDARY',
		'COLOR_SAILOR_ILMERIA_ALT_PRIMARY2',
		'COLOR_SAILOR_ILMERIA_ALT_SECONDARY2',
		'COLOR_SAILOR_ILMERIA_ALT_PRIMARY3',
		'COLOR_SAILOR_ILMERIA_ALT_SECONDARY3',
		'COLOR_SAILOR_ATLEER_C_PRIMARY',
		'COLOR_SAILOR_ATLEER_C_SECONDARY');