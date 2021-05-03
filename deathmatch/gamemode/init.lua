AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("database/cl_database.lua")
AddCSLuaFile("hud.lua")

include("shared.lua")
include("cfg/config.lua")
include("database/database.lua")



function GM:PlayerConnect(name,ip)
	print("Player: "..name..", has joined the game.")
end

function GM:PlayerInitialSpawn(ply)
	print("Player: "..ply:Nick()..", has spawned.")

	ply:SetGamemodeTeam( math.Random(0,1) )
end

function GM:PlayerSpawn(ply)
	ply:SetModel( DefaultModel )
	ply:SetGravity( DefaultGravity )
	ply:SetHealth( DefaultHP )
	ply:SetMaxHealth( DefaultMaxHP )
	ply:SetArmor( DefaultArmor )
	ply:SetMaxArmor( DefaultMaxArmor )
	ply:SetRunSpeed( DefaultRunSpeed )
	ply:SetWalkSpeed( DefaultWalkSpeed )
	ply:SetupHands()
	for k,v in pairs( weapons ) do
		ply:Give(v)
	end
end

function GM:PlayerAuthed(ply,steamID,uniqueID)
	print("Player: "..ply:Nick()..", has gotten authed.")
end

function GM:PlayerDisconnected(ply)
	ply:databaseDisconnect()
end