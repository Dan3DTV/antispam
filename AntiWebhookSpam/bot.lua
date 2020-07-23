local discordia = require("discordia")
local json = require('json')
local client = discordia.Client()
local coro = require("coro-http")
local token = "NzM1NjI3MjQyMDE2NjA0MjEw.XxjAcw.1xCUkqRi3Kkz4kZ9rIjwa5og82s"
local correct = false

function wait(seconds)
    local endTime = os.time() + seconds
    while os.time() < endTime do
    end
end

--[[
    createAt
    id
    timestamp
    arrachment
    author
    channel
    cleanContent
    content 
    editedTimestamp
    embed
    embeds
    guild
    link
    member  
]]

client:on("messageCreate", function(message)
	local correct = false
	local msg = message.content
	print(message.channel)
	if message.embed then
		if message.embed.title:find("ISIS Infected Game - ") then
			correct = true
		else
			correct = false
		end
	else
		correct = false
	end
	if message.channel.id == "727183801783943319" then
		print("in")
		if not message.embed and not correct then
			print("could not find 'ISIS Infected Game -' in "..msg)
			message:delete()
		end
	end
end)

client:run("Bot "..token)