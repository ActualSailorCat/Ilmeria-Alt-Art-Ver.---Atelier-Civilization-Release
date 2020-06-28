--=============================================
-- Ilmeria / Agenda
--=============================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,								Kind)
VALUES	('TRAIT_AGENDA_SAILOR_ILMERIA_ALT',	'KIND_TRAIT');

-----------------------------------------------	
-- Agendas
-----------------------------------------------	
INSERT INTO Agendas
		(AgendaType,					Name,								Description)
VALUES	('AGENDA_SAILOR_ILMERIA_ALT',	'LOC_AGENDA_SAILOR_ILMERIA_ALT_NAME',	'LOC_AGENDA_SAILOR_ILMERIA_ALT_DESCRIPTION');

-----------------------------------------------	
-- Traits
-----------------------------------------------	
INSERT INTO Traits
		(TraitType,							Name,					Description)
VALUES	('TRAIT_AGENDA_SAILOR_ILMERIA_ALT',	'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');

-----------------------------------------------	
-- AgendaTraits
-----------------------------------------------	
INSERT INTO AgendaTraits
		(AgendaType,							TraitType)
VALUES	('AGENDA_SAILOR_ILMERIA_ALT',			'TRAIT_AGENDA_SAILOR_ILMERIA_ALT');

-----------------------------------------------	
-- TraitModifiers
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,								ModifierId)
VALUES	('TRAIT_AGENDA_SAILOR_ILMERIA_ALT',		'AGENDA_SAILOR_ILMERIA_ALT_HIGH'),
		('TRAIT_AGENDA_SAILOR_ILMERIA_ALT',		'AGENDA_SAILOR_ILMERIA_ALT_LOW');

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,									SubjectRequirementSetId)
VALUES	('AGENDA_SAILOR_ILMERIA_ALT_HIGH',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_HIGH'),
		('AGENDA_SAILOR_ILMERIA_ALT_LOW',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_LOW');

-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	
INSERT INTO ModifierArguments
		(ModifierId,							Name,							Value)
VALUES	('AGENDA_SAILOR_ILMERIA_ALT_HIGH',		'InitialValue',					10),
		('AGENDA_SAILOR_ILMERIA_ALT_HIGH',		'StatementKey',					'LOC_DIPLO_KUDA_LEADER_SAILOR_ILMERIA_ALT_REASON_HIGH'),
		('AGENDA_SAILOR_ILMERIA_ALT_HIGH',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_ILMERIA_ALT_HIGH'),
		('AGENDA_SAILOR_ILMERIA_ALT_LOW',		'InitialValue',					-10),
		('AGENDA_SAILOR_ILMERIA_ALT_LOW',		'StatementKey',					'LOC_DIPLO_KUDA_LEADER_SAILOR_ILMERIA_ALT_REASON_LOW'),
		('AGENDA_SAILOR_ILMERIA_ALT_LOW',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_ILMERIA_ALT_LOW');

-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_HIGH',		'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_LOW',		'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_ILMERIA_ALT_AGENDA_LOW',				'REQUIREMENTSET_TEST_ANY');

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_HIGH',		'REQUIRES_MET_10_TURNS_AGO'),
		('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_HIGH',		'REQUIRES_MAJOR_CIV_OPPONENT'),
		('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_HIGH',		'REQUIRES_HAS_HIGH_SCIENCE'),
		('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_HIGH',		'REQUIRES_HAS_HIGH_INDUSTRY'),
		('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_LOW',		'REQUIRES_MET_10_TURNS_AGO'),
		('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_LOW',		'REQUIRES_MAJOR_CIV_OPPONENT'),
		('SAILOR_ILMERIA_ALT_AGENDA_REQUIRES_LOW',		'SAILOR_ILMERIA_ALT_LOW_REQUIREMENTSET'),
		('SAILOR_ILMERIA_ALT_AGENDA_LOW',				'REQUIRES_HAS_LOW_SCIENCE'),
		('SAILOR_ILMERIA_ALT_AGENDA_LOW',				'REQUIRES_HAS_LOW_INDUSTRY');

-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,									RequirementType)
VALUES	('SAILOR_ILMERIA_ALT_LOW_REQUIREMENTSET',		'REQUIREMENT_REQUIREMENTSET_IS_MET');
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments 
		(RequirementId,									Name,					Value) 
VALUES	('SAILOR_ILMERIA_ALT_LOW_REQUIREMENTSET',		'RequirementSetId',		'SAILOR_ILMERIA_ALT_AGENDA_LOW');

-----------------------------------------------	
-- HistoricalAgendas
-----------------------------------------------	
INSERT INTO HistoricalAgendas
		(LeaderType,					AgendaType)
VALUES	('LEADER_SAILOR_ILMERIA_ALT',	'AGENDA_SAILOR_ILMERIA_ALT');

-----------------------------------------------	
-- ExclusiveAgendas
-----------------------------------------------	
INSERT INTO ExclusiveAgendas
		(AgendaOne,						AgendaTwo)
VALUES	('AGENDA_SAILOR_ILMERIA_ALT',	'AGENDA_TECHNOPHILE'),
		('AGENDA_SAILOR_ILMERIA_ALT',	'AGENDA_INDUSTRIALIST');

-----------------------------------------------	
-- AgendaPreferredLeaders
-----------------------------------------------	
INSERT INTO AgendaPreferredLeaders
		(AgendaType,						LeaderType,					PercentageChance)
VALUES	('AGENDA_GREAT_PERSON_ADVOCATE',	'LEADER_SAILOR_ILMERIA_ALT',	20);

-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT INTO ModifierStrings
		(ModifierId,							Context,		Text)
VALUES	('AGENDA_SAILOR_ILMERIA_ALT_HIGH',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_SAILOR_ILMERIA_ALT_LOW',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');
