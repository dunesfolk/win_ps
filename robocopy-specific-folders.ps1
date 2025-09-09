
$textfile = "" #path to text file with a folder names
$dirlist | Set-Content -Path $textfile -Encoding UTF8
$src_basepath = ""
$dst_basepath = ""

foreach ($dir in $dirlist) {
    $datetime = Get-Date -Format "yyyyMMdd_HHmmss"
    $cp_src = "${src_basepath}\${$dir}\"
    $cp_dst = "${dst_basepath}\${dir}\"
    $cp_log = "${dst_basepath}\_log\$datetime" + "_$dir.log"
    $cp_opt = "/MIR /mt:2 /r:2 /w:2 /np /sl /xf desktop.ini thumbs.db /Log:$cp_log"
    robocopy $cp_src $cp_dst ($cp_opt -split " ")
}
