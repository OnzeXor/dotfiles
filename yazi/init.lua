-- Altera automaticamente a ordenação dependendo do diretório
ps.sub("cd", function()
	local cwd = tostring(cx.active.current.cwd)
	local home = os.getenv("HOME")
	local downloads = home .. "/Downloads"

	if cwd == downloads then
		-- Em Downloads: ordena por data de criação (btime), mais recentes no topo
		ya.emit("sort", { "btime", reverse = true, dir_first = true })
	elseif cwd == home then
		-- Na Home: ordena por nome alfabético (natural)
		ya.emit("sort", { "natural", reverse = false, dir_first = true })
	end
end)
