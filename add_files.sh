# 打印命令执行情况
set -v

# 统计文件大小
find ./ -size +0b -exec ls -lh {} \; | grep -v './.git/' > file-size.txt

# 文件的cdn链接
find ./ -type f | grep -v './.git/' | sed 's/\.\//https:\/\/cdn.jsdelivr.net\/gh\/yansheng836\/github-oss\//g' > file-cdn-urls.txt

# 提交到仓库
git add .
git commit -m "chore: add some files"
git push origin main
