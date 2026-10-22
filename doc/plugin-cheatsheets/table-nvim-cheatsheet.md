# Table cheat sheet (`q` or `Esc` to close)
- Works in markdown files, keys are Alt based

# Create a table
- Use `Alt + T` to create a new table at the cursor
- Use `Alt + Shift + T` to create a table that is not surrounded by pipes

| Column1 | Column2 |
| ------- | ------- |
| x       | x       |

Column1 | Column2
------- | -------
x       | x

# Insert rows and columns
- Use `Alt + H` and `Alt + L` to insert columns to left and right of current column
- Use `Alt + J` and `Alt + K` to insert rows below and above current row

# Move rows and columns
- Use `Alt + Shift + J` and `Alt + Shift + K` to move the current row down and up
- Use `Alt + Shift + H` and `Alt + Shift + L` to move the current column left and right

# Delete
- Use `Alt + D` to delete the column under the cursor

# Move around in cells
- Use `TAB` to move to the next cell
- Use `Shift + TAB` to move to the previous cell
- Both work in Normal and Insert mode, all other keys are Normal mode only

# This sheet
- `:TableHelp` opens this window
- Setup lives in `lua/custom/plugins/table-nvim.lua`
