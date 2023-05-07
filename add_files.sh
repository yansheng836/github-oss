# 打印命令执行情况
set -v

git add .
git commit -m "chore: add some files"
git push origin main

#
find ./ -size +0b -exec ls -lh {} \; | grep -v './.git/' > file-size.text
