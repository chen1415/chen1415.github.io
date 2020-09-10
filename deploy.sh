echo -e "清除旧文件"
hexo clean
echo -e "\t\t......OK\n正在【生成】静态页面"
hexo g
if [ $1 == 'p' ]
then
    echo -e "\t\t......OK\n正在【预览】静态页面"
    hexo s
    echo "预览完成"
fi
if [ $1 == 'g' ]
then
    echo -e "\t\t......OK\n正在【发布】静态页面"
    hexo d
    echo "发布完成"
fi