function rb
{

	param(  
    		[	
			Parameter(
        			Position=0, 
        			Mandatory=$true, 
        			ValueFromPipeline=$true,
        			ValueFromPipelineByPropertyName=$true
				)
		]
    		[Alias('FullName')]
    		[String[]]$file
    	)

	#Lets escape the $file first
	$file = $file -replace "(\[)","``["
	$file = $file -replace "(\])","``]"
	try {
		$objFolder = get-item $file -ErrorAction Stop
	}
	catch {
		write-host "Caught an exception:" -ForegroundColor Green
    		write-host "Exception Type: $($_.Exception.GetType().FullName)" -ForegroundColor Green
    		write-host "Exception Message: $($_.Exception.Message)" -ForegroundColor Green
		write-host "Will try to forcely open the file" -ForeGroundColor Green
		try {
			$objFolder = get-item $file -Force -ErrorAction Stop
		}
		catch {
			Write-Host "Failed completely here" -ForeGroundColor Red
			return
		}
		
	}
	$filepath = $objFolder.FullName
	#write-host $filepath
	#$filepath = ( get-item $file ).FullName
	Add-Type -AssemblyName Microsoft.VisualBasic
	if ($objFolder -is [System.IO.DirectoryInfo])
	{
		[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($filepath, 'OnlyErrorDialogs', 'SendToRecycleBin')
	}
	else
	{
		[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($filepath, 'OnlyErrorDialogs', 'SendToRecycleBin')
	}
}
