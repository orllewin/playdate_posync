import 'CoreLibs/graphics'

local graphics <const> = playdate.graphics

local bpm = 120
local sound = playdate.sound
local synth = sound.synth.new(playdate.sound.kWaveSquare)
synth:setParameter(1, 0.3)--square wave duty cycle
synth:setVolume(1)

local clockChannel = playdate.sound.channel.new()
clockChannel:addSource(synth)
clockChannel:setPan(-1)--left
clockChannel:setVolume(1)

synth:playNote((bpm/60) * 2)

function playdate.update()
	graphics.clear(graphics.kColorWhite)
	graphics.drawText("PO Sync - BPM: " .. bpm, 12, 12)
end

function playdate.upButtonDown()
	bpm += 1
	synth:playNote((bpm/60) * 2)
end

function playdate.downButtonDown()
	bpm -= 1
	synth:playNote((bpm/60) * 2)
end


