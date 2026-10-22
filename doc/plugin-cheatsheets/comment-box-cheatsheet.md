# Comment-box cheat sheet (`q` or `Esc` to close)
- All keys start with `<leader>c`
- Boxes and lines are plain (no comment chars)

# Make
- Use `<leader>cb` for a box around text (normal: current line, visual: selection)
- Use `<leader>ct` for a titled line (the text becomes the title)
- Use `<leader>cl` for a simple line (normal mode only)
- Use `<leader>cc` to open the style catalog, `q` closes it

# Move a box
- Use `V` to select the box lines, then `x` (cut) or `y` (copy)
- Move the cursor to where the top-left corner should go
- Use `<leader>cp` to paste at the cursor column
- It overwrites the text underneath, nothing to the right moves
- Undo with `u`

# Styles
- Commands take an optional style number from the catalog, e.g. `:CBlabox14`
- Naming is `CB` + position (`l`/`c`/`r`) + text align (`l`/`c`/`r`, `a` = adapted) + `box`
- Setup (widths, border characters) lives in `lua/custom/plugins/comment-box.lua`

# This sheet
- `:CBhelp` or `<leader>c?` opens this window
- `<leader>c` in which-key lists everything above
