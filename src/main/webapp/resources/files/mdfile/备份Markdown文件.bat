git status && (
	echo is git-cmd
	git add *
	git commit -m "auto commit"
	git push origin master
) || (
	echo is win-cmd
	F:\kity\Git\git-cmd.exe ����Markdown�ļ�.bat
)

exit