# Autopairs cheat sheet (`q` or `Esc` to close)
- All of this happens in Insert mode, there are no extra keys to learn
- Pairs are `()`, `[]`, `{}`, `""`, `''` and backticks

# Auto close
- Type `(` and you get `(|)` with the cursor in the middle
- Same for `[`, `{`, `"`, `'` and backticks

# Type over the closer
- Type the closing character when the cursor is already on it and it just moves past it
- So typing `(foo)` out by hand does not leave a second `)`

# Backspace
- Use `Backspace` between an empty pair like `(|)` to delete both characters

# Enter between braces
- Use `Enter` inside `{|}` to get three lines with the cursor indented in the middle
- Handy for C functions, structs and `if` blocks

# Quotes are context aware
- A `'` after a letter is not paired, so `don't` works
- A quote is not paired when it would just close an existing one

# Turn it off
- Use `:lua require('nvim-autopairs').disable()` to turn it off for the session
- Use `:lua require('nvim-autopairs').enable()` to turn it back on

# Watch out for
- With blink.cmp, `Enter` may confirm a completion instead of splitting the braces
- Backticks pair in markdown too, so type the closer to move past it

# This sheet
- `:PluginHelp` fuzzy finds all cheat sheets
- Enabled in `lua/plugins.lua`, setup lives in `lua/kickstart/plugins/autopairs.lua`
