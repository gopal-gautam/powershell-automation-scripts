#Check for each movie directory if subtitle file exists or not
diff (ls -Directory | ?{ $_.GetFiles().Extension -eq ".srt" }) (ls -Directory)

#Check for the file Thumbs.db and remove them
ls -Force -Recurse | ?{$_.Name -match "Thumbs.db"} | %{rm $_.fullname}

#Change ip address on the fly
netsh interface ip set address "Ethernet 3" static 192.168.1.100 255.255.255.0 192.168.1.1;
