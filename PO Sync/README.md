# PO Sync

Generating a 'PO-Sync' signal to sync Teenage Engineering Pocket Operators with the Playdate.

```lua
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
```

## Links

* https://www.soundtech.co.uk/music-retail/teenageengineering/news/pocket-operator-sync-modes

> Make sure the impulse length is correct. The impulses in the sync signal also have to last for the right amount of time. If they're too short, the impulse won't trigger the Pocket Operator. If they're too long, the Pocket Operator's sequencer will start to skip steps. When we tested it, the sync signal worked correctly when the impulse time was between 3-67ms. This range will be pretty normal for most clock signals, so don't worry if it's not a configurable option!