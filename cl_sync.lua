--[[---------------------------------------------------------------------------------------

	Wraith ARS 2X
	Created by WolfKnight
	
	For discussions, information on future updates, and more, join 
	my Discord: https://discord.gg/fD4e6WD 
	
	MIT License

	Copyright (c) 2020 WolfKnight

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

---------------------------------------------------------------------------------------]]--

local DECOR_TYPES = 
{
	FLOAT = 1, 
	BOOL = 2, 
	INT = 3
}

SYNC = {}

SYNC.decors = 
{
	{ "wk_wars2x__radarEnabled", DECOR_TYPES.BOOL },
	{ "wk_wars2x__frontAntennaLocked", DECOR_TYPES.BOOL },
	{ "wk_wars2x__rearAntennaLocked", DECOR_TYPES.BOOL }
}

SYNC.data_types = 
{
	radarEnabled = 1, 
	frontAntEnabled = 2, 
	frontAntMode = 3,
	frontAntLockState = 4, 
	rearAntEnabled = 5, 
	rearAntMode = 6,
	rearAntennaLockState = 7 
}

-- Create a thread to register the decorators that will be used
Citizen.CreateThread( function()
	for _, v in pairs( SYNC.decors ) do 
		DecorRegister( v[1], v[2] )
	end 
end )

function SYNC:IsRadarOn()
	return DecorGetBool( PLY.veh, "wk_wars2x__radarEnabled" )
end 

-- data could be:
-- { _type = SYNC.radarEnabled, state = false }
-- { _type = SYNC.frontAntMode, state = 2 }
function SYNC:SendMessage( target, data )
	
end 