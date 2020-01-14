Add-Type -AssemblyName 'Microsoft.Office.Interop.Excel' -Passthru
$ExcelFiles = Get-ChildItem -Path $Folder -Filter *.xlsx -Recurse

$excelApp = New-Object -ComObject Excel.Application
	$excelApp.DisplayAlerts = $false

	$ExcelFiles | ForEach-Object {
		$workbook = $excelApp.Workbooks.Open($_.FullName)
		$csvFilePath = $_.FullName -replace "\.xlsx$", ".csv"
		$workbook.SaveAs($csvFilePath, [Microsoft.Office.Interop.Excel.XlFileFormat]::xlCSV)
		$workbook.Close()
	}

# Release Excel Com Object resource
$excelApp.Workbooks.Close()
$excelApp.Visible = $true
Start-Sleep 5
$excelApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null
