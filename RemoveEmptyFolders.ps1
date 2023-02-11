﻿function RemoveEmptySubFolders([string]$Folder)
{
 $CurrentFolder = PWD
 CD $Folder
 Get-ChildItem $Folder -Recurse -Force -Directory | 
    Sort-Object -Property FullName -Descending |
    Where-Object { $($_ | Get-ChildItem -Force | Select-Object -First 1).Count -eq 0 } |
    Remove-Item -Verbose
 CD $CurrentFolder
}