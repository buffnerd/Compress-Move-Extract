
██████╗░██╗░░░██╗███████╗███████╗  ███╗░░██╗███████╗██████╗░██████╗░
██╔══██╗██║░░░██║██╔════╝██╔════╝  ████╗░██║██╔════╝██╔══██╗██╔══██╗
██████╦╝██║░░░██║█████╗░░█████╗░░  ██╔██╗██║█████╗░░██████╔╝██║░░██║
██╔══██╗██║░░░██║██╔══╝░░██╔══╝░░  ██║╚████║██╔══╝░░██╔══██╗██║░░██║
██████╦╝╚██████╔╝██║░░░░░██║░░░░░  ██║░╚███║███████╗██║░░██║██████╔╝
╚═════╝░░╚═════╝░╚═╝░░░░░╚═╝░░░░░  ╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═════╝░

# Compress Modify Extract / a.k.a. the CME-tool

# Here is a PowerShell script that compresses, creates a like path in another network location, sends the files to new location, and extracts them there.

# You can run this script in the PowerShell command prompt on your local machine. 
# In this script the folder that you want to compress is defined as $folder. 
# It will be compressed to the location defined as $zipFile. 
# The destination server is defined as $server.  (Note: you will be prompted to enter credentials to access the server.)

# Compress folder and contents into .zip

$folder = "C:\path\to\folder"
$zipFile = "C:\path\to\compressed.zip"
Compress-Archive -Path $folder -DestinationPath $zipFile

# Send compressed files to another server

$server = "\\server\destination"
$destinationFolder = "Z:\destinationfolder"
$cred = Get-Credential
New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root $server -Credential $cred

# Ensure destination server has the correct folder

if(!(Test-Path -Path $destinationFolder)){
    New-Item -ItemType Directory -Path $destinationFolder
}
Copy-Item -Path $zipFile -Destination "Z:\"
Remove-PSDrive -Name "Z"

# Extract compressed files in new location

Expand-Archive -Path "Z:\compressed.zip" -DestinationPath $destinationFolder


# This script first checks if the destination folder already exists on the destination server by using the Test-Path cmdlet. 
# If the folder does not exist, the script creates the folder using the New-Item cmdlet. Once the folder is confirmed to 
# exist, the script proceeds to copy the compressed file and extract it in the destination folder.
