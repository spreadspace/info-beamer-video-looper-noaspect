gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

util.no_globals()

local video

util.json_watch("config.json", function(config)
    if video then
        video:dispose()
    end
    video = resource.load_video{
        file = config.video.asset_name,
        looped = true,
        audio = config.audio,
        raw = true,
    }
end)

function node.render()
    gl.clear(0, 0, 0, 1)
    local state, w, h = video:state()
    if state == "loaded" then
        video:place(0, 0, NATIVE_WIDTH, NATIVE_HEIGHT):layer(2)
    end
end
