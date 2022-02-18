#!/bin/bash
currentTime=`date '+%s'`
tmp_path="${HOME}/tmp_xcode_snippet_${currentTime}"
git clone https://github.com/Loxe/XBXcodeCodeSnippets.git "${tmp_path}"

code_snippet_path="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"
if [ ! -d "${code_snippet_path}" ];then
  mkdir "${code_snippet_path}"
else
  echo "文件夹已经存在"
fi
softfiles=$(ls $tmp_path)
for sfile in ${softfiles}
do 
    if [ "${sfile##*.}" = "codesnippet" ];then
        cp -rf "${tmp_path}/${sfile}" "${code_snippet_path}/${sfile}"
    fi
done

rm -rf "${tmp_path}"