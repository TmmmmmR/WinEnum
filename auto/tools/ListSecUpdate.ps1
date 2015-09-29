$MUS = New-Object -com Microsoft.Update.Session 
$Usearch = $MUS.CreateUpdateSearcher() 
 
$Usresult = $Usearch.Search("IsInstalled=0 and Type='Software'") 
 
For ($a = 0; $a -le $Usresult.Updates.Count-1; $a++){ 
 $Update = $Usresult.Updates.Item($a) 
 $Update.Title 
} 