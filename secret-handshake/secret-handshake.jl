function secret_handshake(code)
    actions = []
    code & 1 > 0 && push!(actions, "wink")
    code & 2 > 0 && push!(actions, "double blink")
    code & 4 > 0 && push!(actions, "close your eyes")
    code & 8 > 0 && push!(actions, "jump")
    code & 16 > 0 ? reverse(actions) : actions
end
