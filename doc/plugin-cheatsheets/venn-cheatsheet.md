# Venn cheat sheet (`q` or `Esc` to close)
- Draw boxes and lines with box characters, great for diagrams in plain text
- Drawing mode is per buffer and is toggled on and off

# Toggle drawing mode
- Use `<leader>v` to turn drawing mode on
- Use `<leader>v` again to turn it off
- While on, virtualedit is `all`, so the cursor can go anywhere, even past the end of a line
- While on, `J`, `K`, `L` and `H` are remapped, they no longer join lines or show docs

# Draw lines
- Use `H`, `J`, `K` and `L` to draw a line left, down, up and right
- The line follows the cursor, so move in a path to draw corners

# Draw boxes
- Use `Ctrl + V` to start a block selection and cover the corners of the box
- Use `f` to draw a box around the selection
- Or run `:VBox` on the selection

# Box variants
- `:VBox` draws a single line box
- Variants for double and heavy lines also exist, type `:VBox` and press `Tab` to list them

# Tips
- Use `u` to undo a stroke
- Turn drawing mode off before editing normally, since the remaps are buffer local
- Move a drawn box with the comment-box paste, see `PluginHelp` and pick comment-box

# This sheet
- `:PluginHelp` fuzzy finds all cheat sheets
- Setup lives in `lua/custom/plugins/venn.lua`
