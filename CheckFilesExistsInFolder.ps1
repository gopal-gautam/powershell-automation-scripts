function checkfile($listfile, $folder1, $folder2="")
{
	$ArrImageLists = get-content $listfile
	$found_folder = $folder1
	foreach ($file in $ArrImageLists)
	{
		$found1 = Test-Path $folder1\$file
		if ( !$found1 -and $folder2.Trim() -ne "")
		{
			$found2 = Test-Path $folder2\$file
		}
		if ( !$found2 -and !$found1 )
		{
			Write-Host -ForeGroundColor Red "Not Found: $file"
			Add-Content -value $file NotFoundFile.txt
		}
		elseif($found1 -and !$found2)
		{
			$found_folder = $folder1
			Write-Host -ForeGroundColor Gree "Found in 1st Folder: $file"
			Add-Content -value $folder1$file Found1.txt
		}
		elseif ($found2 -and !$found1)
		{
			$found_folder = $folder2
			Write-Host -ForeGroundColor Blue "Found in 2nd Folder: $file"
			Add-Content -value $folder1$file Found2.txt
		}
		elseif($found1 -and $found2)
		{
			#$found_folder = $folder2
			Write-Host -ForeGroundColor Cyan "Found in Both: $file"
			Add-Content -value $file FoundBoth.txt
		}
		else
		{
			Write-Host -ForeGroundColor DarkBlue "Found in Both: $file"
			Add-Content -value $file Error.txt 
		}
		
	}
}