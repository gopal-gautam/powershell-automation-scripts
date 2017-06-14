function moveToDestopFolder($file, $folderInDesktop) {
	$full_folder_path = [io.path]::Combine([Environment]::GetFolderPath("Desktop"), $folderInDesktop)
	if( -not (Test-Path $full_folder_path)) {
		$new_folder = New-Item -Type Directory $full_folder_path
	}
	Move-Item $file -Destination $full_folder_path
}
