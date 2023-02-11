#Use Handbrake 1.6+

function AV1([string] $FileName, [int] $BitRate = 800)
{
 $File = Get-ChildItem $FileName
 $VideosFolder = [environment]::getfolderpath("myvideos")
 $TOutputFile = $VideosFolder + "\" + $File.Name
 $OutputFile = [System.IO.Path]::ChangeExtension($TOutputFile,".mp4")
 handbrakecli -e svt_av1 -b $BitRate -i $FileName  -E copy:aac --audio-fallback aac --mixdown stereo -o $OutputFile
}
function AV1Folder([string] $Folder, [int] $BitRate = 800)
{
 $CurrentFolder = PWD
 CD $Folder
 $oldvids = (Get-ChildItem -Filter "*.mp4" -Path $Folder | Sort-Object Length) 
 foreach ($oldvid in $oldvids)
 {
   AV1 -FileName $oldvid.FullName -BitRate $BitRate
 }
 CD $CurrentFolder 
}