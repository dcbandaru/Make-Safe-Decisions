SELECT  'Campus' AS Site, 
CONCAT(AC.[Unitid],AC.[Campus ID]) AS SiteID, 
AC.[Survey Year], AC.[Institution Size], AC.[Illegal weapons possession] AS ArrestWeapon, AC.[Drug law violations] AS ArrestDrug, AC.[Liquor law violations] AS ArrestLiquor,  
CC.[Robbery], CC.[Aggravated assault], CC.[Burglary], CC.[Motor vehicle theft], CC.[Arson], 
SUM(
     (COALESCE(CC.[Rape] ,0)) + 
	 (COALESCE(CC.[Fondling] ,0)) + 
	 (COALESCE(CC.[Incest] ,0))+ 
	 (COALESCE(CC.[Statutory rape] ,0))) 
	 AS SexualAssault,
SUM(
	(COALESCE(CC.[Murder Non-negligent manslaughter], 0)) +
	(COALESCE(CC.[Negligent manslaughter], 0)))
	AS Manslaughter, 
DC.[Illegal weapons possession], DC.[Drug law violations], DC.[Liquor law violations], 
VAWAC.[Domestic violence] AS VAWADomestic, VAWAC.[Dating violence] AS VAWADating, VAWAC.[Stalking] AS VAWAStalking,

UC.[Survey year], UC.[Total unfounded crimes]

FROM [test].[dbo].[ArrestsCampus] AC
LEFT OUTER JOIN [test].[dbo].[CriminalCampus] CC
	ON AC.[Survey year]= CC.[Survey year]
		AND AC.[Unitid] = CC.[Unitid]
		AND AC.[Campus ID] = CC.[Campus ID]
		AND AC.[Institution Size] = CC.[Institution Size]
LEFT OUTER JOIN [test].[dbo].[Disciplinary Campus] DC
	ON AC.[Survey year]= DC.[Survey year]
		AND AC.[Unitid] = DC.[Unitid]
		AND AC.[Campus ID] = DC.[Campus ID]
		AND AC.[Institution Size] = DC.[Institution Size]
LEFT OUTER JOIN [test].[dbo].[VAWACampus] VAWAC
	ON AC.[Survey year]= VAWAC.[Survey year]
		AND AC.[Unitid] = VAWAC.[Unitid]
		AND AC.[Campus ID] = VAWAC.[Campus ID]
		AND AC.[Institution Size] = VAWAC.[Institution Size]
LEFT OUTER JOIN  FROM [dbo].[UnfoundedCrimes]
GROUP BY  
CONCAT(AC.[Unitid],AC.[Campus ID]), 
AC.[Survey Year], AC.[Institution Size], AC.[Illegal weapons possession], AC.[Drug law violations], AC.[Liquor law violations],  
CC.[Robbery], CC.[Aggravated assault], CC.[Burglary], CC.[Motor vehicle theft],CC.[Arson],
DC.[Illegal weapons possession], DC.[Drug law violations], DC.[Liquor law violations], 
VAWAC.[Domestic violence], VAWAC.[Dating violence], VAWAC.[Stalking] 



UNION ALL

SELECT  'Housing' AS Site, 
CONCAT(AH.[Unitid],AH.[Campus ID]) AS SiteID, 
AH.[Survey Year], AH.[Institution Size], AH.[Illegal weapons possession] AS ArrestWeapon, AH.[Drug law violations] AS ArrestDrug, AH.[Liquor law violations] AS ArrestLiquor,  
CH.[Robbery], CH.[Aggravated assault], CH.[Burglary], CH.[Motor vehicle theft], CH.[Arson], 
SUM(
     (COALESCE(CH.[Rape] ,0)) + 
	 (COALESCE(CH.[Fondling] ,0)) + 
	 (COALESCE(CH.[Incest] ,0))+ 
	 (COALESCE(CH.[Statutory rape] ,0))) 
	 AS SexualAssault,
SUM(
	(COALESCE(CH.[Murder Non-negligent manslaughter], 0)) +
	(COALESCE(CH.[Negligent manslaughter], 0)))
	AS Manslaughter, 
DH.[Illegal weapons possession], DH.[Drug law violations], DH.[Liquor law violations], 
VAWAH.[Domestic violence] AS VAWADomestic, VAWAH.[Dating violence] AS VAWADating, VAWAH.[Stalking] AS VAWAStalking 

FROM [test].[dbo].[ArrestsHousing] AH
LEFT OUTER JOIN [test].[dbo].[CriminalHousing] CH
	ON AH.[Survey year]= CH.[Survey year]
		AND AH.[Unitid] = CH.[Unitid]
		AND AH.[Campus ID] = CH.[Campus ID]
		AND AH.[Institution Size] = CH.[Institution Size]
LEFT OUTER JOIN [test].[dbo].[DisciplinaryHousing] DH
	ON AH.[Survey year]= DH.[Survey year]
		AND AH.[Unitid] = DH.[Unitid]
		AND AH.[Campus ID] = DH.[Campus ID]
		AND AH.[Institution Size] = DH.[Institution Size]
LEFT OUTER JOIN [test].[dbo].[VAWAHousing] VAWAH
	ON AH.[Survey year]= VAWAH.[Survey year]
		AND AH.[Unitid] = VAWAH.[Unitid]
		AND AH.[Campus ID] = VAWAH.[Campus ID]
		AND AH.[Institution Size] = VAWAH.[Institution Size]
GROUP BY  
CONCAT(AH.[Unitid],AH.[Campus ID]), 
AH.[Survey Year], AH.[Institution Size], AH.[Illegal weapons possession], AH.[Drug law violations], AH.[Liquor law violations],  
CH.[Robbery], CH.[Aggravated assault], CH.[Burglary], CH.[Motor vehicle theft],CH.[Arson],
DH.[Illegal weapons possession], DH.[Drug law violations], DH.[Liquor law violations], 
VAWAH.[Domestic violence], VAWAH.[Dating violence], VAWAH.[Stalking] 