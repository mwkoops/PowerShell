function 265([string] $FileName)
{
 $File = Get-ChildItem $FileName
 $VideosFolder = [environment]::getfolderpath("myvideos")
 $TOutputFile = $VideosFolder + "\" + $File.Name
 $OutputFile = [System.IO.Path]::ChangeExtension($TOutputFile,".mp4")
 handbrakecli_133 -e vce_h265 -q 26.0 --no-two-pass -E copy:aac --audio-fallback aac --mixdown stereo -i $FileName -o $OutputFile
 $done = Get-ChildItem $newvid  
 $Saved = ($oldvid.Length - $done.Length)
 Format-FileSize -size $Saved
 Write-Host "`r`n"
}