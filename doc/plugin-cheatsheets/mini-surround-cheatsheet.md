# Mini.surround cheat sheet (`q` or `Esc` to close)
- Every key starts with `s`, which replaces the built-in substitute (use `cl` instead)
- Surround characters: `)` or `b` for parens, `]` for brackets, `}` for braces, `"`, `'`, `` ` ``, `t` for tags

# Add
- Use `sa` + motion + character, e.g. `saiw)` wraps the word in `(word)`
- Use `sa` in Visual mode + character to wrap the selection
- Use `saiW)` for a WORD, `sa2aw)` for two words, `sa$)` to the end of the line
- A closing character like `)` wraps tight: `(word)`
- An opening character like `(` adds inner spaces: `( word )`

# Delete
- Use `sd)` to delete the surrounding `()`
- Use `sd'` to delete the surrounding quotes

# Replace
- Use `sr)"` to replace the surrounding `()` with `""`
- Use `sr"'` to replace double quotes with single quotes

# Find and highlight
- Use `sf)` to jump to the next `)` surrounding, `sF)` to jump to the previous one
- Use `sh)` to highlight the surrounding `()` briefly

# Next and last
- Add `n` or `l` after `sd`, `sr`, `sf` or `sh` to act on the next or previous surrounding
- e.g. `sdn)` deletes the next `()` pair after the cursor

# Look it up
- Use `<leader>sk` and search for `surround` to list all of these with descriptions
- They are global mappings from `mini.nvim`, set up in `lua/kickstart/plugins/mini.lua`

# This sheet
- `:PluginHelp` fuzzy finds all cheat sheets
