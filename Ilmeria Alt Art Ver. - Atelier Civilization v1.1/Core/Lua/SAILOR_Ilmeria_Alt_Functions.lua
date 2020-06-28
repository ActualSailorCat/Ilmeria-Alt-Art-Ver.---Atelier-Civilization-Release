--=============================================
-- Ilmeria Lessons by SailorCat
--=============================================
--------------------
-- Setup
--------------------
--//// Gathering strategic resources and their technologies...
local sailorIlmeriaAltReference = {}
for k, v in ipairs(DB.Query("SELECT ResourceType, PrereqTech FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_STRATEGIC' AND PrereqTech IS NOT NULL AND PrereqTech IN (SELECT TechnologyType FROM Boosts)")) do
	local ilResType = GameInfo.Resources[v.ResourceType].ResourceType
	local ilTech = GameInfo.Technologies[v.PrereqTech].Index
	table.insert(sailorIlmeriaAltReference, {Resource = ilResType, Technology = ilTech})
end

-- All Applicable Buildings
local ilmeriaAltBuildings = {}
local ilmeriaAltBuildingQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_INDUSTRIAL_ZONE')")
for i, ilAltBuild in ipairs(ilmeriaAltBuildingQuery) do
	local ilAltBuildIndex = GameInfo.Buildings[ilAltBuild.BuildingType].Index
	ilmeriaAltBuildings[i] = ilAltBuildIndex
end

-- Campus Buildings
local ilmeriaAltCampus = {}
local ilmeriaAltCampusQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS'")
for i, ilAltCamp in ipairs(ilmeriaAltCampusQuery) do
	local ilAltCampIndex = GameInfo.Buildings[ilAltCamp.BuildingType].Index
	ilmeriaAltCampus[i] = ilAltCampIndex
end
-- Industrial Zone Buildings
local ilmeriaAltIndustrial = {}
local ilmeriaAltIndustQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE'")
for i, ilAltIndu in ipairs(ilmeriaAltIndustQuery) do
	local ilAltInduIndex = GameInfo.Buildings[ilAltIndu.BuildingType].Index
	ilmeriaAltIndustrial[i] = ilAltInduIndex
end

--------------------
-- Function
--------------------
local sailorIlmeriaAltMod = (GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier)/100
function Sailor_Ilmeria_Alt_Genius_Points (playerID, cityID, buildingID, ImprovementID, plotID, bCancelled, bOriginalConstruction, iBuildType, iX, iY)
	local bILMERIAALTLeader = false
	local pPlayer = Players[playerID]
	local pPlayerCities = pPlayer:GetCities()
	local pCity = pPlayerCities:FindID(cityID)
	local pOwner = pCity:GetOwner()
	if pOwner ~= -1 then
		local pPlayerConfig = PlayerConfigurations[pOwner]
		local sLeader = pPlayerConfig:GetLeaderTypeName()
		if sLeader == 'LEADER_SAILOR_ILMERIA_ALT' then
			bILMERIAALTLeader = true
		end
	end

	if bILMERIAALTLeader == true then
		--//// Gathering buildings...
		local iBuilt = GameInfo.Buildings[buildingID].Index
		for i, iBuild in ipairs(ilmeriaAltBuildings) do
			if iBuild == GameInfo.Buildings[buildingID].Index then

				--//// Checking for adjacent Atelier...
				local pPlayerCities = pPlayer:GetCities()
				local pCity = pPlayerCities:FindID(cityID)
				local pCityBuildings = pCity:GetBuildings()
				local pPlot = Map.GetPlotByIndex(pCityBuildings:GetBuildingLocation(buildingID))
				local iX, iY = pPlot:GetX(), pPlot:GetY()
				local iNumberofAtelier = 0
				local iAtleerRadius = 2

				for dx = (iAtleerRadius * -1), iAtleerRadius do
					for dy = (iAtleerRadius * -1), iAtleerRadius do
						local pPlotNearBuilding = Map.GetPlotXYWithRangeCheck(iX, iY, dx, dy, iAtleerRadius);
						if pPlotNearBuilding and (pPlotNearBuilding:GetOwner() == pOwner) and (pPlotNearBuilding:GetImprovementType() > -1) then
							local pImprovement = pPlotNearBuilding:GetImprovementType()
							if pImprovement > -1 then
								local pImprovementIndex = GameInfo.Buildings[pImprovement].Index
								local pImprovementType = GameInfo.Improvements[pImprovementIndex].ImprovementType
								if pImprovementType == 'IMPROVEMENT_SAILOR_ATLEER_UI' then
									iNumberofAtelier = iNumberofAtelier + 1
								end
							end
						end
					end
				end
				--//// Time for treats...
				if iNumberofAtelier > 0 then
					local pPoints = pPlayer:GetEra() + 10
					local pGPP = (((pPoints * iNumberofAtelier) * sailorIlmeriaAltMod) + 5)
					local pPlayerGP = pPlayer:GetGreatPeoplePoints()
					-- Campus
					for k, iAlch in ipairs(ilmeriaAltCampus) do
						if iAlch == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_SCIENTIST"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatScientist]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					-- Industrial Zone
					for k, iSteam in ipairs(ilmeriaAltIndustrial) do
						if iSteam == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_ENGINEER"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatEngineer]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					break
				end
			end
		end
	end
end
--!!!!
--[END]
--!!!!

--!!!!
--ILMERIA EUREKA VISIBILITY
--!!!!
function Sailor_Ilmeria_Alt_Eureka_Visibility (playerID, iTechBoosted, iUnknownA, iUnknownB)
	local bILMERIAALTLeader = false
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sLeader = pPlayerConfig:GetLeaderTypeName()
	if sLeader == 'LEADER_SAILOR_ILMERIA_ALT' then
			bILMERIAALTLeader = true
	end

	if bILMERIAALTLeader == true then
		local pPlayer = Players[playerID]
		for i, ilBoost in ipairs(sailorIlmeriaAltReference) do
			if ilBoost.Technology == iTechBoosted then
				pPlayer:AttachModifierByID("SAILOR_ILMERIA_ALT_VISIBILITY_" .. ilBoost.Resource)
				break
			end
		end
	end
end
--!!!!
--[END]
--!!!!
--=============================================
-- Leader Present Detection by SeelingCat
--=============================================
local bILMERIAALTPresent = false

for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
    if bILMERIAALTPresent == false then
        local sLeaderType = PlayerConfigurations[v]:GetLeaderTypeName()
        if sLeaderType == 'LEADER_SAILOR_ILMERIA_ALT' then
			bILMERIAALTPresent = true
        end
    end
end
if bILMERIAALTPresent == true then
    print ("///// Ilmeria Alt detected. Loading lua functions...")
	Events.TechBoostTriggered.Add(Sailor_Ilmeria_Alt_Eureka_Visibility)
	GameEvents.BuildingConstructed.Add(Sailor_Ilmeria_Alt_Genius_Points)
else
    print ("///// Ilmeria Alt not detected.")
end