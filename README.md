
██████╗░██╗░░░██╗███████╗███████╗  ███╗░░██╗███████╗██████╗░██████╗░
██╔══██╗██║░░░██║██╔════╝██╔════╝  ████╗░██║██╔════╝██╔══██╗██╔══██╗
██████╦╝██║░░░██║█████╗░░█████╗░░  ██╔██╗██║█████╗░░██████╔╝██║░░██║
██╔══██╗██║░░░██║██╔══╝░░██╔══╝░░  ██║╚████║██╔══╝░░██╔══██╗██║░░██║
██████╦╝╚██████╔╝██║░░░░░██║░░░░░  ██║░╚███║███████╗██║░░██║██████╔╝
╚═════╝░░╚═════╝░╚═╝░░░░░╚═╝░░░░░  ╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═════╝░

# Compress-Move-Extract

This PowerShell Script automates the process of compressesing, moving, and extracting a folder of files from one location on the network to another
location on the network.  You will need to modify Drive Letters and directories to make this script fit your unique needs.  This can be useful for
database management in situations where you frequently need to move large data sets to new network locations securely.

1.)  Compresses a folder and it's contents into a .zip

2.)  Sends the compressed files to another server on the network

3.)  Ensures the destination server has a folder with the appropriate name

4.)  Extracts the compressed files in the new location on the network
