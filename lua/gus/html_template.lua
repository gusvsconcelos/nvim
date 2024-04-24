function Create_html_template()
	-- Get current buffer
	local current_buf = vim.api.nvim_get_current_buf()

	-- Get the name of the current buffer
	local buf_name = vim.api.nvim_buf_get_name(current_buf)

	-- Check if the current buffer is empty
	local is_empty = vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)

	-- If the buffer is not empty, ask for confirmation to overwrite
	if #is_empty > 0 then
		local confirm = vim.fn.confirm("Buffer is not empty. Overwrite?", "&Yes\n&No", 2)
		if confirm ~= 1 then
			return
		end
	end

	-- Set the HTML template content
	local html_template = [[
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>

</body>
</html>
]]

	-- Replace the content of the buffer with the HTML template
	vim.api.nvim_buf_set_lines(current_buf, 0, -1, false, vim.split(html_template, "\n"))

	-- Set the file type as HTML
	vim.api.nvim_buf_set_option(current_buf, "filetype", "html")

	print("HTML template created successfully!")
end
