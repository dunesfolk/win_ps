$datetime = Get-Date -Format "yyyyMMdd_HHmmss"
$cp_src = ""
$cp_dst = ""
$cp_log = "${cp_dst}\${datetime}.txt"
$cp_opt = "/MIR /mt:2 /r:2 /w:2 /np /sl /xf desktop.ini thumbs.db /Log:$cp_log"
robocopy $cp_src $cp_dst ($cp_opt -split " ")
