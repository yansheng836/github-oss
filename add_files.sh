# 打印命令执行情况
set -v

# 备份csdn的照片 H:\Workspaces\eclipse最新英文版\GCI\csdn-images-backup\CSDN博客图片备份
# 排除空格，null 等影响
find /H/Workspaces/eclipse最新英文版/GCI/csdn-images-backup/CSDN博客图片备份 -type f -print0 | xargs -0 -i cp -r {} csdn-img/

# 统计文件大小
find ./ -size +0b -exec ls -lh {} \; | grep -v './.git/' > file-size.txt

# 文件的cdn链接
find ./ -type f | grep -v './.git/' | sed 's/\.\//https:\/\/cdn.jsdelivr.net\/gh\/yansheng836\/github-oss\//g' > file-cdn-urls.txt

# 提交到仓库
date=`date "+%Y-%m-%d %H:%M:%S"`
git add .
git commit -m "chore: add some files on $date"
git push origin main
