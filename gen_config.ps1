param(
	[string] $outdir="WinRel",
    [string] $outfile="src\config.h.W32"
	)
Get-Content .\configure.ac |select-string -pattern "^AC_INIT\(\[GNU make\],\[([^]]+)\].*" |%{$version= $_.matches.groups[1].Value }
Get-Content .\src\config.h.W32.template | %{ $_ -replace "%VERSION%","$version"} |%{$_ -replace "%PACKAGE%","make" } | out-file -Encoding ASCII $outfile
