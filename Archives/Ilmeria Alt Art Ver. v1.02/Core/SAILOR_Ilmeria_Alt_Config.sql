--==========================================================================================================================
-- Totori / Config
--==========================================================================================================================
-----------------------------------------------		
-- Players Vanilla
-----------------------------------------------
INSERT INTO Players	(
		CivilizationType,
		Portrait,
		PortraitBackground,
		LeaderType,
		LeaderName,
		LeaderIcon,
		LeaderAbilityName,
		LeaderAbilityDescription,
		LeaderAbilityIcon,
		CivilizationName,
		CivilizationIcon,
		CivilizationAbilityName,
		CivilizationAbilityDescription,
		CivilizationAbilityIcon
		)
VALUES	('CIVILIZATION_SAILOR_ATLEER', -- CivilizationType
		'LEADER_SAILOR_ILMERIA_ALT_SELECT', -- Portrait
		'LEADER_SAILOR_ILMERIA_ALT_BACKGROUND', -- PortraitBackground
		'LEADER_SAILOR_ILMERIA_ALT', -- LeaderType
		'LOC_LEADER_SAILOR_ILMERIA_ALT_NAME', -- LeaderName
		'ICON_LEADER_SAILOR_ILMERIA_ALT', -- LeaderIcon
		'LOC_TRAIT_LEADER_SAILOR_ILMERIA_ALT_UA_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_SAILOR_ILMERIA_ALT_UA_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_SAILOR_ILMERIA_ALT', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_SAILOR_ATLEER_NAME', -- CivilizationName
		'ICON_CIVILIZATION_SAILOR_ATLEER', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_SAILOR_ATLEER_UA_NAME', --CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_SAILOR_ATLEER_UA_DESCRIPTION', --CivilizationAbilityDescription
		'ICON_CIVILIZATION_SAILOR_ATLEER'); -- CivilizationAbilityIcon

-----------------------------------------------		
-- PlayerItems Vanilla
-----------------------------------------------
INSERT INTO PlayerItems	(
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
VALUES	('CIVILIZATION_SAILOR_ATLEER',
		'LEADER_SAILOR_ILMERIA_ALT',
		'UNIT_SAILOR_ATLEER_UU',
		'ICON_UNIT_SAILOR_ATLEER_UU',
		'LOC_UNIT_SAILOR_ATLEER_UU_NAME',
		'LOC_UNIT_SAILOR_ATLEER_UU_DESCRIPTION',
		10);	

INSERT INTO PlayerItems	(
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
VALUES	('CIVILIZATION_SAILOR_ATLEER',
		'LEADER_SAILOR_ILMERIA_ALT',
		'IMPROVEMENT_SAILOR_ATLEER_UI',
		'ICON_IMPROVEMENT_SAILOR_ATLEER_UI',
		'LOC_IMPROVEMENT_SAILOR_ATLEER_UI_NAME',
		'LOC_IMPROVEMENT_SAILOR_ATLEER_UI_DESCRIPTION',
		20);

-----------------------------------------------		
-- Players Expansion
-----------------------------------------------
INSERT INTO Players	(
		Domain,
		CivilizationType,
		Portrait,
		PortraitBackground,
		LeaderType,
		LeaderName,
		LeaderIcon,
		LeaderAbilityName,
		LeaderAbilityDescription,
		LeaderAbilityIcon,
		CivilizationName,
		CivilizationIcon,
		CivilizationAbilityName,
		CivilizationAbilityDescription,
		CivilizationAbilityIcon
		)
VALUES	('Players:Expansion1_Players', -- Domain
		'CIVILIZATION_SAILOR_ATLEER', -- CivilizationType
		'LEADER_SAILOR_ILMERIA_ALT_SELECT', -- Portrait
		'LEADER_SAILOR_ILMERIA_ALT_BACKGROUND', -- PortraitBackground
		'LEADER_SAILOR_ILMERIA_ALT', -- LeaderType
		'LOC_LEADER_SAILOR_ILMERIA_ALT_NAME', -- LeaderName
		'ICON_LEADER_SAILOR_ILMERIA_ALT', -- LeaderIcon
		'LOC_TRAIT_LEADER_SAILOR_ILMERIA_ALT_UA_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_SAILOR_ILMERIA_ALT_UA_XP_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_SAILOR_ILMERIA_ALT', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_SAILOR_ATLEER_NAME', -- CivilizationName
		'ICON_CIVILIZATION_SAILOR_ATLEER', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_SAILOR_ATLEER_UA_NAME', --CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_SAILOR_ATLEER_UA_DESCRIPTION', --CivilizationAbilityDescription
		'ICON_CIVILIZATION_SAILOR_ATLEER'); -- CivilizationAbilityIcon

-----------------------------------------------		
-- PlayerItems Expansion
-----------------------------------------------
INSERT INTO PlayerItems	(
		Domain,
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
VALUES	('Players:Expansion1_Players',
		'CIVILIZATION_SAILOR_ATLEER',
		'LEADER_SAILOR_ILMERIA_ALT',
		'UNIT_SAILOR_ATLEER_UU',
		'ICON_UNIT_SAILOR_ATLEER_UU',
		'LOC_UNIT_SAILOR_ATLEER_UU_NAME',
		'LOC_UNIT_SAILOR_ATLEER_UU_DESCRIPTION',
		10);

INSERT INTO PlayerItems	(
		Domain,
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
VALUES	('Players:Expansion1_Players',
		'CIVILIZATION_SAILOR_ATLEER',
		'LEADER_SAILOR_ILMERIA_ALT',
		'IMPROVEMENT_SAILOR_ATLEER_UI',
		'ICON_IMPROVEMENT_SAILOR_ATLEER_UI',
		'LOC_IMPROVEMENT_SAILOR_ATLEER_UI_NAME',
		'LOC_IMPROVEMENT_SAILOR_ATLEER_UI_DESCRIPTION',
		20);

-----------------------------------------------		
-- Players Expansion2
-----------------------------------------------
INSERT INTO Players	(
		Domain,
		CivilizationType,
		Portrait,
		PortraitBackground,
		LeaderType,
		LeaderName,
		LeaderIcon,
		LeaderAbilityName,
		LeaderAbilityDescription,
		LeaderAbilityIcon,
		CivilizationName,
		CivilizationIcon,
		CivilizationAbilityName,
		CivilizationAbilityDescription,
		CivilizationAbilityIcon
		)
VALUES	('Players:Expansion2_Players', -- Domain
		'CIVILIZATION_SAILOR_ATLEER', -- CivilizationType
		'LEADER_SAILOR_ILMERIA_ALT_SELECT', -- Portrait
		'LEADER_SAILOR_ILMERIA_ALT_BACKGROUND', -- PortraitBackground
		'LEADER_SAILOR_ILMERIA_ALT', -- LeaderType
		'LOC_LEADER_SAILOR_ILMERIA_ALT_NAME', -- LeaderName
		'ICON_LEADER_SAILOR_ILMERIA_ALT', -- LeaderIcon
		'LOC_TRAIT_LEADER_SAILOR_ILMERIA_ALT_UA_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_SAILOR_ILMERIA_ALT_UA_XP_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_SAILOR_ILMERIA_ALT', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_SAILOR_ATLEER_NAME', -- CivilizationName
		'ICON_CIVILIZATION_SAILOR_ATLEER', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_SAILOR_ATLEER_UA_NAME', --CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_SAILOR_ATLEER_UA_XP2_DESCRIPTION', --CivilizationAbilityDescription
		'ICON_CIVILIZATION_SAILOR_ATLEER'); -- CivilizationAbilityIcon

-----------------------------------------------		
-- PlayerItems Expansion2
-----------------------------------------------
INSERT INTO PlayerItems	(
		Domain,
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
VALUES	('Players:Expansion2_Players',
		'CIVILIZATION_SAILOR_ATLEER',
		'LEADER_SAILOR_ILMERIA_ALT',
		'UNIT_SAILOR_ATLEER_UU',
		'ICON_UNIT_SAILOR_ATLEER_UU',
		'LOC_UNIT_SAILOR_ATLEER_UU_NAME',
		'LOC_UNIT_SAILOR_ATLEER_UU_DESCRIPTION',
		10);

INSERT INTO PlayerItems	(
		Domain,
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
VALUES	('Players:Expansion2_Players',
		'CIVILIZATION_SAILOR_ATLEER',
		'LEADER_SAILOR_ILMERIA_ALT',
		'IMPROVEMENT_SAILOR_ATLEER_UI',
		'ICON_IMPROVEMENT_SAILOR_ATLEER_UI',
		'LOC_IMPROVEMENT_SAILOR_ATLEER_UI_NAME',
		'LOC_IMPROVEMENT_SAILOR_ATLEER_UI_DESCRIPTION',
		20);