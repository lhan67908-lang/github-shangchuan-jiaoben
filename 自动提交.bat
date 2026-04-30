@echo off
chcp 936 >nul
title Git 初学者菜单助手

:menu
cls
echo ==========================================
echo          Git 初学者菜单助手
echo ==========================================
echo.
echo  1. 初始化仓库          git init
echo  2. 复制/克隆仓库       git clone
echo  3. 查看当前状态        git status
echo  4. 添加文件到暂存区    git add
echo  5. 提交一个版本        git commit
echo  6. 上传到 GitHub       git push
echo  7. 拉取远程更新        git pull
echo  8. 查看提交历史        git log
echo  9. 查看/添加远程仓库   git remote
echo 10. 一键添加提交上传    add + commit + push
echo 11. Git 基础配置        user.name / user.email
echo.
echo  h. 查看总帮助
echo  0. 退出
echo.
set /p choice=请输入编号：

if "%choice%"=="1" goto git_init
if "%choice%"=="2" goto git_clone
if "%choice%"=="3" goto git_status
if "%choice%"=="4" goto git_add
if "%choice%"=="5" goto git_commit
if "%choice%"=="6" goto git_push
if "%choice%"=="7" goto git_pull
if "%choice%"=="8" goto git_log
if "%choice%"=="9" goto git_remote
if "%choice%"=="10" goto git_auto_push
if "%choice%"=="11" goto git_config
if /i "%choice%"=="h" goto help
if "%choice%"=="0" exit

echo.
echo 输入无效，请重新选择。
pause
goto menu


:git_init
cls
echo ===== 1. 初始化仓库 git init =====
echo.
echo 作用：
echo 把当前文件夹变成一个 Git 仓库。
echo.
echo 常用命令：
echo git init
echo.
echo 适合场景：
echo 你自己新建了一个项目文件夹，想开始用 Git 管理它。
echo.
set /p confirm=是否在当前文件夹执行 git init？输入 y 确认：
if /i "%confirm%"=="y" git init
pause
goto menu


:git_clone
cls
echo ===== 2. 复制/克隆仓库 git clone =====
echo.
echo 作用：
echo 从 GitHub / Gitee / GitLab 下载一个完整项目到本地。
echo.
echo 常用方法：
echo.
echo 1）克隆到默认文件夹：
echo git clone https://github.com/用户名/仓库名.git
echo.
echo 2）克隆到指定文件夹：
echo git clone https://github.com/用户名/仓库名.git my-project
echo.
echo 3）克隆指定分支：
echo git clone -b 分支名 https://github.com/用户名/仓库名.git
echo.
echo 注意：
echo 仓库地址一般在 GitHub 项目页面绿色 Code 按钮里复制。
echo.
set /p repo=请输入仓库地址：
if "%repo%"=="" (
    echo 仓库地址不能为空。
    pause
    goto menu
)

set /p folder=请输入保存的文件夹名，直接回车表示默认：
if "%folder%"=="" (
    git clone "%repo%"
) else (
    git clone "%repo%" "%folder%"
)

pause
goto menu


:git_status
cls
echo ===== 3. 查看当前状态 git status =====
echo.
echo 作用：
echo 查看哪些文件被修改了、哪些文件还没提交。
echo.
echo 常用命令：
echo git status
echo.
git status
pause
goto menu


:git_add
cls
echo ===== 4. 添加文件 git add =====
echo.
echo 作用：
echo 把修改过的文件加入暂存区，准备提交。
echo.
echo 常用方法：
echo.
echo 1）添加全部文件：
echo git add .
echo.
echo 2）添加指定文件：
echo git add 文件名
echo.
set /p file=请输入要添加的文件，直接回车表示 git add .：
if "%file%"=="" (
    git add .
) else (
    git add "%file%"
)

pause
goto menu


:git_commit
cls
echo ===== 5. 提交版本 git commit =====
echo.
echo 作用：
echo 把暂存区里的修改保存成一个版本。
echo.
echo 常用命令：
echo git commit -m "本次修改说明"
echo.
echo 提交说明例子：
echo 更新首页
echo 修复登录问题
echo 添加毕业设计代码
echo.
set /p msg=请输入本次提交说明：
if "%msg%"=="" set msg=update

git commit -m "%msg%"

pause
goto menu


:git_push
cls
echo ===== 6. 上传到 GitHub git push =====
echo.
echo 作用：
echo 把本地提交上传到远程仓库，比如 GitHub。
echo.
echo 常用方法：
echo.
echo 1）普通上传：
echo git push
echo.
echo 2）第一次上传 main 分支：
echo git push -u origin main
echo.
echo 3）上传到指定分支：
echo git push origin 分支名
echo.
set /p mode=选择方式：1 普通push，2 第一次上传main，3 指定分支：
if "%mode%"=="1" git push
if "%mode%"=="2" git push -u origin main
if "%mode%"=="3" (
    set /p branch=请输入分支名：
    git push origin "%branch%"
)

pause
goto menu


:git_pull
cls
echo ===== 7. 拉取远程更新 git pull =====
echo.
echo 作用：
echo 把 GitHub 上最新代码同步到本地。
echo.
echo 常用方法：
echo.
echo 1）普通拉取：
echo git pull
echo.
echo 2）拉取指定分支：
echo git pull origin main
echo.
set /p mode=选择方式：1 普通pull，2 拉取origin main：
if "%mode%"=="1" git pull
if "%mode%"=="2" git pull origin main

pause
goto menu


:git_log
cls
echo ===== 8. 查看提交历史 git log =====
echo.
echo 作用：
echo 查看以前提交过哪些版本。
echo.
echo 常用方法：
echo.
echo 1）简洁查看：
echo git log --oneline
echo.
echo 2）完整查看：
echo git log
echo.
set /p mode=选择方式：1 简洁，2 完整：
if "%mode%"=="1" git log --oneline
if "%mode%"=="2" git log

pause
goto menu


:git_remote
cls
echo ===== 9. 远程仓库 git remote =====
echo.
echo 作用：
echo 管理本地项目和 GitHub 仓库之间的连接。
echo.
echo 常用方法：
echo.
echo 1）查看远程仓库：
echo git remote -v
echo.
echo 2）添加远程仓库：
echo git remote add origin 仓库地址
echo.
echo 3）修改远程仓库地址：
echo git remote set-url origin 仓库地址
echo.
set /p mode=选择方式：1 查看，2 添加origin，3 修改origin：
if "%mode%"=="1" git remote -v
if "%mode%"=="2" (
    set /p repo=请输入远程仓库地址：
    git remote add origin "%repo%"
)
if "%mode%"=="3" (
    set /p repo=请输入新的远程仓库地址：
    git remote set-url origin "%repo%"
)

pause
goto menu


:git_auto_push
cls
echo ===== 10. 一键添加提交上传 =====
echo.
echo 作用：
echo 自动执行：
echo git add .
echo git commit -m "说明"
echo git push
echo.
echo 适合场景：
echo 平时写完代码，想快速上传到 GitHub。
echo.
set /p msg=请输入本次提交说明：
if "%msg%"=="" set msg=update

echo.
echo 正在执行 git add .
git add .

echo.
echo 正在执行 git commit
git commit -m "%msg%"

echo.
echo 正在执行 git push
git push

pause
goto menu


:git_config
cls
echo ===== 11. Git 基础配置 =====
echo.
echo 作用：
echo 第一次使用 Git 时，需要配置用户名和邮箱。
echo.
echo 常用命令：
echo git config --global user.name "你的名字"
echo git config --global user.email "你的邮箱"
echo.
echo 查看当前配置：
echo git config --global --list
echo.
set /p mode=选择方式：1 查看配置，2 设置用户名和邮箱：
if "%mode%"=="1" git config --global --list
if "%mode%"=="2" (
    set /p username=请输入你的 Git 用户名：
    set /p email=请输入你的邮箱：
    git config --global user.name "%username%"
    git config --global user.email "%email%"
)

pause
goto menu


:help
cls
echo ===== Git 初学者总帮助 =====
echo.
echo 最常见流程一：自己新建项目并上传 GitHub
echo.
echo 1. git init
echo 2. git add .
echo 3. git commit -m "first commit"
echo 4. git remote add origin 仓库地址
echo 5. git branch -M main
echo 6. git push -u origin main
echo.
echo 最常见流程二：下载别人的项目
echo.
echo git clone 仓库地址
echo.
echo 最常见流程三：日常更新代码
echo.
echo 1. git status
echo 2. git add .
echo 3. git commit -m "更新说明"
echo 4. git push
echo.
echo 最常见流程四：同步 GitHub 最新代码
echo.
echo git pull
echo.
pause
goto menu