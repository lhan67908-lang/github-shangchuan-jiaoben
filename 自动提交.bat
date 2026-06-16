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
echo 12. 分支管理            git branch / switch
echo 13. 查看差异            git diff
echo 14. 撤销操作            git restore / reset
echo.
echo  h. 使用指南（新手必看！）
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
if "%choice%"=="12" goto git_branch
if "%choice%"=="13" goto git_diff
if "%choice%"=="14" goto git_undo
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
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ Git 管理代码需要一个"仓库"。               │
echo │ git init 就是在当前文件夹里创建这个仓库。 │
echo │ 就像你要用箱子装东西，先得有个空箱子。    │
echo │ 执行后文件夹里会多一个 .git 隐藏文件夹，  │
echo │ 仓库就存在那里，你不用手动去改它。        │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   你刚新建了一个项目文件夹，里面有代码文件，
echo   想开始用 Git 来跟踪和管理这些代码的修改历史。
echo.
echo 操作后会看到什么？
echo   Initialized empty Git repository in .../.git/
echo   翻译：空仓库创建成功！这个文件夹从此归 Git 管了。
echo.
echo 操作步骤：
echo   1. 确认你现在就在想要管理的项目文件夹里
echo   2. 下面输入 y 然后按回车
echo   3. 看到上面那行英文提示就说明成功了
echo.
set /p confirm=现在执行 git init？输入 y 确认，直接回车跳过：
if /i "%confirm%"=="y" git init
pause
goto menu


:git_clone
cls
echo ===== 2. 下载/克隆仓库 git clone =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git clone = 把 GitHub 上一个完整的项目   │
echo │ 下载到你电脑上。                         │
echo │ 就像从别人电脑复制文件到自己电脑，        │
echo │ 但这个"复制"会把所有历史版本也带下来。    │
echo │ 下载下来后，你就可以在本地修改和运行了。  │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   你在 GitHub 上看到一个开源项目想下载跑起来；
echo   或者同事发了一个仓库地址让你拉取代码。
echo.
echo 操作后会看到什么？
echo   出现下载进度条（Receiving objects...），
echo   下载完显示 Resolving deltas... done 就成功了。
echo.
echo 操作步骤：
echo   1. 去 GitHub 项目页面，点绿色 "Code" 按钮，复制地址
echo   2. 把地址粘贴到下面（右键粘贴）
echo   3. 然后输入你想保存的文件夹名（直接回车 = 用默认名）
echo.
set /p repo=第1步：粘贴仓库地址（如 https://github.com/用户名/仓库名.git）：
if "%repo%"=="" (
    echo 仓库地址不能为空。
    pause
    goto menu
)

set /p folder=第2步：输入保存的文件夹名（直接回车 = 用默认名称）：
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
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git status = 看看你的项目"发生了什么"。   │
echo │ 哪些文件被改过了？哪些文件还没提交？      │
echo │ 就像你每天打开书包检查：作业带了没，      │
echo │ 课本拿了没。提交前先看 status 是好习惯。  │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   做任何 Git 操作之前，都先看一眼 status。
echo   养成习惯：打开项目 → git status → 再干活。
echo.
echo 操作步骤：下面会自动执行 git status。
echo 执行完后会显示中文翻译对照，请一一对应查看。
echo.
echo ═══════════════════════════════════════════
echo           正在执行 git status ...
echo ═══════════════════════════════════════════
echo.
git status
echo.
echo ══════════════════════ 中文翻译 ══════════════════════
echo.
echo On branch xxx
echo → 你当前在 xxx 分支上
echo.
echo Your branch is up to date with 'origin/xxx'.
echo → 你的代码和远程仓库一致，没有需要更新的
echo.
echo Your branch is ahead of 'origin/xxx' by 1 commit.
echo → 你的本地比远程多 1 次提交（需要 push 了）
echo.
echo Changes not staged for commit:
echo → 以下文件已经修改了，但还没执行 git add
echo   （红色 = 改了但没 add）
echo.
echo Changes to be committed:
echo → 以下文件已经 add 了，等待 commit
echo   （绿色 = 已暂存）
echo.
echo Untracked files:
echo → 以下文件是新建的，Git 还没开始跟踪
echo   需要的话用 git add 添加
echo.
echo modified: 文件名
echo → 这个文件的内容被修改了
echo.
echo nothing to commit, working tree clean
echo → 当前没有未提交的内容，工作区很干净！
echo.
echo no changes added to commit
echo → 没有需要提交的内容（还没 add）
echo.
echo ═══════════════════════════════════════════════════:git_add
cls
echo ===== 4. 添加文件到暂存区 git add =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git add = 把你修改过的文件"标记"为要提交  │
echo │ 想象你在网上购物：                         │
echo │ 改了文件 = 逛商场看中了一个商品            │
echo │ git add  = 把商品放进购物车                │
echo │ git commit = 去收银台结账                  │
echo │ 所以 add 和 commit 总是成对出现。          │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   你改完代码，准备提交了。先 add，再 commit。
echo.
echo 操作后会看到什么？
echo   通常什么也不显示，没有报错就是成功了。
echo   可以用 git status 验证：文件名变绿色了。
echo.
echo 操作步骤：
echo   1. 想添加当前文件夹里所有改过的文件 → 直接按回车
echo   2. 只想添加某个特定文件 → 输入文件名（比如 index.html）
echo.
set /p file=请输入文件名（直接回车 = 添加所有文件 git add .）：
if "%file%"=="" (
    git add .
) else (
    git add "%file%"
)

pause
goto menu


:git_commit
cls
echo ===== 5. 提交一个版本 git commit =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git commit = 把暂存区的修改"拍个照"保存。 │
echo │ 每次 commit 就像一个游戏存档点，           │
echo │ 以后你可以随时回到这次提交的状态。         │
echo │ 每次提交都要写一句说明（-m "xxx"），       │
echo │ 这样以后你能想起这次提交干了什么。         │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   做完 git add 之后。先把修改加进暂存区，
echo   再用 commit 把这些修改正式保存为一个版本。
echo.
echo 操作后会看到什么？
echo   显示 [main xxxxx] 你的说明
echo   1 file changed, 10 insertions(+)
echo   翻译：提交成功，改了1个文件，新增了10行代码。
echo.
echo 提交说明怎么写？（写清楚改了啥，方便以后查找）
echo   例子1：修复了登录页面的密码错误提示
echo   例子2：添加了商品列表页的分页功能
echo   例子3：更新了 README 文档
echo.
echo 操作步骤：
echo   在下面输入你这次改了什么（一句话说清楚就行）
echo.
set /p msg=请输入本次提交说明（例如：修复登录Bug）：
if "%msg%"=="" set msg=update

git commit -m "%msg%"

pause
goto menu


:git_push
cls
echo ===== 6. 上传到 GitHub git push =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git push = 把本地提交"推"上 GitHub。      │
echo │ 你在本地做了 git commit，但别人看不到。   │
echo │ push 就是把你的代码上传到 GitHub 网站，   │
echo │ 这样别人能看到，你也能在其他电脑下载。     │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   本地 commit 之后，想把代码同步到 GitHub。
echo.
echo 操作后会看到什么？
echo   进度条和 done 字样表示上传成功。
echo   如果报错，常见原因是还没连远程仓库（先做第9项）。
echo.
echo 选择你的情况：
echo.
echo   1）我正常更新，之前已经上传过
echo      直接 git push 就行
echo.
echo   2）我是第一次往 GitHub 上传
echo      用 git push -u origin main
echo      第一次需要建立关联，以后就不用加参数了
echo.
echo   3）我想上传到其他分支（不是 main 分支）
echo      用 git push origin 分支名
echo.
set /p mode=你属于哪种情况？输入 1 / 2 / 3：
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
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git pull = 把 GitHub 上的最新代码下载下来。│
echo │ 如果别人更新了代码，或者你在别的电脑上    │
echo │ 传了新代码，就要用 pull 同步到本地。       │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   1. 别人更新了仓库代码，你想拿到最新版
echo   2. 你在另一台电脑上传了代码，这台电脑要同步
echo   3. 每次开始工作前，先 pull 一下，避免冲突
echo.
echo 操作后会看到什么？
echo   显示下载的进度和合并的信息。
echo   Already up to date = 已经是最新版，不用更新。
echo.
echo 选择你的情况：
echo   1）正常拉取，仓库已经关联了远程
echo      直接 git pull
echo   2）指定拉取 origin main（明确从 GitHub 的 main 分支拉）
echo      git pull origin main
echo   3）第一次下载，本地仓库和 GitHub 历史不一致
echo      git pull origin main --allow-unrelated-histories
echo      适合：本地是新仓库，GitHub 上也是新仓库
echo.
set /p mode=你属于哪种情况？输入 1 / 2 / 3：

if "%mode%"=="1" git pull
if "%mode%"=="2" git pull origin main
if "%mode%"=="3" git pull origin main --allow-unrelated-histories

pause
goto menu


:git_log
cls
echo ===== 8. 查看提交历史 git log =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git log = 查看你之前提交过的所有版本记录。│
echo │ 就像查看日记本，能看到哪天谁改了什么。     │
echo │ 每一条记录都有编号（commit ID），           │
echo │ 这个编号在撤销操作时要用到。               │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   想回顾一下之前改了啥；
echo   或者需要找到某次提交的 commit ID。
echo.
echo 操作后会看到什么？
echo   commit xxxxx（黄色编号 = commit ID）
echo   Author: 作者
echo   Date: 日期
echo   下面紧跟着是提交说明。
echo.
echo 选择你的情况：
echo   1）简洁模式（只看提交说明和编号，一目了然）
echo      用 git log --oneline
echo   2）完整模式（看所有详细信息，包括谁改的、什么时间）
echo      用 git log
echo.
set /p mode=你想看简洁版还是完整版？输入 1（简洁）/ 2（完整）：
if "%mode%"=="1" git log --oneline
if "%mode%"=="2" git log

pause
goto menu


:git_remote
cls
echo ===== 9. 连接远程仓库 git remote =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git remote = 让本地仓库和 GitHub 仓库     │
echo │ "建立联系"。                              │
echo │ 就像你把手机号和微信号绑定，               │
echo │ remote 就是把本地仓库和 GitHub 地址绑定。  │
echo │ （origin 是 GitHub 仓库的默认名字）        │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   第一次上传之前，必须先绑定 GitHub 地址。
echo   或者你想换一个 GitHub 仓库地址。
echo.
echo 操作后会看到什么？
echo   origin  https://github.com/... (fetch)
echo   origin  https://github.com/... (push)
echo   意思是：你的本地仓库已经指向这个 GitHub 地址了。
echo.
echo 选择你的情况：
echo   1）先看看有没有绑过远程仓库
echo      git remote -v
echo      如果空白 = 还没绑定，需要做第2步
echo   2）绑定 GitHub 地址（告诉本地仓库要传到哪）
echo      git remote add origin 仓库地址
echo      注意：只需要做一次，以后不用重复
echo   3）换一个 GitHub 地址（比如搬到新仓库了）
echo      git remote set-url origin 新仓库地址
echo.
set /p mode=你想做哪个？输入 1（查看）/ 2（绑定）/ 3（换地址）：
if "%mode%"=="1" git remote -v
if "%mode%"=="2" (
    set /p repo=请粘贴 GitHub 仓库地址：
    git remote add origin "%repo%"
)
if "%mode%"=="3" (
    set /p repo=请粘贴新的 GitHub 仓库地址：
    git remote set-url origin "%repo%"
)

pause
goto menu


:git_auto_push
cls
echo ===== 10. 一键添加提交上传 =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ 把第4、5、6步（add + commit + push）     │
echo │ 三个命令一键执行。                        │
echo │ 适合日常快速上传，省去来回输入的麻烦。    │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   平时写完了代码，想快速上传到 GitHub。
echo   一个快捷键搞定 add + commit + push。
echo.
echo 操作会自动：
echo   1. git add .          （添加所有修改）
echo   2. git commit -m "xxx"（提交并写说明）
echo   3. git push           （上传到 GitHub）
echo.
echo 操作步骤：
echo   在下面输入你这次改了什么，然后自动执行。
echo   注意：会自动添加【所有文件】，不要有不想提交的文件。
echo.
set /p msg=请输入本次提交说明（例如：修复了首页显示问题）：
if "%msg%"=="" set msg=update

echo.
echo 第1步：添加所有文件 git add .
git add .

echo.
echo 第2步：提交版本 git commit
git commit -m "%msg%"

echo.
echo 第3步：上传到 GitHub git push
git push

pause
goto menu


:git_config
cls
echo ===== 11. Git 基础配置 =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ 第一次用 Git 时，需要告诉 Git 你是谁。    │
echo │ 这样你每次提交代码，Git 就知道是谁改的。  │
echo │ 就像快递要写寄件人信息一样。              │
echo │ 注意：这个配置做一次就行，以后不用重复。  │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   刚装好 Git，第一次用。
echo   或者你想换一个名字/邮箱。
echo.
echo 配置什么？
echo   用户名 = 你的名字（会显示在每次提交记录里）
echo   邮箱   = 你的邮箱（一般和 GitHub 账号邮箱一致）
echo.
echo 操作后会看到什么？
echo   user.name=你的名字
echo   user.email=你的邮箱
echo   说明配置成功了。
echo.
echo 选择你的情况：
echo   1）看看当前已经配置了什么
echo       git config --global --list
echo   2）设置你的用户名和邮箱
echo       git config --global user.name "你的名字"
echo       git config --global user.email "你的邮箱"
echo.
set /p mode=你想做哪个？输入 1（查看）/ 2（设置）：
if "%mode%"=="1" git config --global --list
if "%mode%"=="2" (
    set /p username=请输入你的 Git 用户名（例如：张三）：
    set /p email=请输入你的邮箱（例如：zhangsan@qq.com）：
    git config --global user.name "%username%"
    git config --global user.email "%email%"
)

pause
goto menu


:git_branch
cls
echo ===== 12. 分支管理 =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ 分支 = 项目的"平行宇宙"。         │
echo │ main 分支是你的正式版本（主宇宙）。        │
echo │ 创建分支 = 复制出一个独立空间，让你在里面  │
echo │ 安全地开发新功能或修Bug。                  │
echo │ 成功了就合并回主分支，失败了就删掉，       │
echo │ 完全不影响主分支的代码！                   │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   开发新功能时，别在 main 上直接改，
echo   创建一个分支（比如 feature-login），
echo   写完测试没问题了再合并回 main。
echo.
echo 分支操作一览：
echo.
echo   1）查看所有本地分支（带*的是你正在用的）
echo      git branch
echo   2）查看所有分支（含远程 GitHub 上的）
echo      git branch -a
echo   3）创建一个新分支（但还不切换过去）
echo      git branch 新分支名
echo   4）切换到另一个已有分支
echo      git switch 分支名
echo   5）创建新分支并直接切换过去（推荐，一步到位）
echo      git switch -c 新分支名
echo   6）删除一个已经合并过的分支
echo      git branch -d 分支名
echo.
echo 操作步骤：
echo   下面输入编号选择你要的操作。
echo   切换/删除分支前会自动显示当前分支列表，避免搞错。
echo.
set /p mode=选择方式：1 查看本地，2 查看含远程，3 创建分支，4 切换分支，5 创建并切换，6 删除分支：
if "%mode%"=="1" git branch
if "%mode%"=="2" git branch -a
if "%mode%"=="3" goto br_create
if "%mode%"=="4" goto br_switch
if "%mode%"=="5" goto br_create_switch
if "%mode%"=="6" goto br_delete
pause
goto menu

:br_create
set /p bname=请输入新分支名（例如：feature-login）：
if not "%bname%"=="" git branch "%bname%"
pause
goto menu

:br_switch
echo 当前分支列表（*号表示你正在这个分支上）：
git branch
set /p bname=请输入要切换到的分支名：
if not "%bname%"=="" git switch "%bname%"
pause
goto menu

:br_create_switch
set /p bname=请输入新分支名（例如：feature-login）：
if not "%bname%"=="" git switch -c "%bname%"
pause
goto menu

:br_delete
echo 当前分支列表：
git branch
set /p bname=请输入要删除的分支名：
if not "%bname%"=="" git branch -d "%bname%"
pause
goto menu


:git_diff
cls
echo ===== 13. 查看差异 git diff =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ git diff = 显示你具体改了哪些文件的哪几行。│
echo │ 就像 Word 的"修订模式"，                   │
echo │ 红色的（-开头）= 你删除的内容              │
echo │ 绿色的（+开头）= 你新增的内容              │
echo │ 提交前先看一遍 diff，是好习惯！            │
echo └─────────────────────────────────────────┘
echo.
echo 什么时候需要做这个？
echo   提交之前，确认自己没改错东西。
echo   或者代码出问题了，看看这次到底改了什么。
echo.
echo diff 的两种场景（重要！）：
echo.
echo   1）还没执行过 git add（刚改完代码）
echo      git diff → 看还没暂存的修改
echo.
echo   2）已经执行过 git add 了
echo      git diff --staged → 看暂存区里等提交的修改
echo.
echo   3）只看某个文件的修改
echo      git diff 文件名
echo.
echo   4）只看统计（改了几个文件，几行），不看具体内容
echo      git diff --stat
echo.
set /p mode=选择方式：1 未暂存的修改（还没add），2 已暂存的修改（已add），3 指定文件，4 简洁统计：
if "%mode%"=="1" git diff
if "%mode%"=="2" git diff --staged
if "%mode%"=="3" goto diff_file
if "%mode%"=="4" git diff --stat
pause
goto menu

:diff_file
set /p fname=请输入文件名（例如：index.html）：
if not "%fname%"=="" git diff "%fname%"
pause
goto menu


:git_undo
cls
echo ===== 14. 撤销操作 =====
echo.
echo ┌─ 这是干什么的？─────────────────────────┐
echo │ 写代码难免犯错，撤销操作帮你"反悔"。       │
echo │ 关键要先搞清楚：你现在在哪个阶段？          │
echo │                                          │
echo │ 还没 add      → 用 1-2（恢复工作区修改）   │
echo │ 已 add 没提交 → 用 3-4（取消暂存）         │
echo │ 已提交没推送  → 用 5-7（撤销提交）         │
echo │ 已推送        → 用 8（安全反悔）           │
echo └─────────────────────────────────────────┘
echo.
echo ==========================================
echo ? 带警告的操作是不可逆的，请仔细看说明！
echo ==========================================
echo.
echo ═════ 第一类：撤销工作区修改（还没 git add） ═════
echo   你在改代码，但还没 add。后悔了，想回到没改之前。
echo.
echo   1）只撤销某个文件的修改【安全】
echo      git restore 文件名
echo      例子：你改了 index.html 但改错了，想恢复原样
echo.
echo   2）撤销所有文件的修改【需确认】
echo      git restore .
echo      所有没 add 的修改都会被丢掉，不能恢复！
echo.
echo ═════ 第二类：取消暂存（已 git add，还没 commit） ═════
echo   你执行了 git add，但还没 commit。想从暂存区拿出来。
echo.
echo   3）取消暂存某个文件【安全，修改保留】
echo      git restore --staged 文件名
echo      文件从暂存区移除，但修改还保留在工作区
echo.
echo   4）取消暂存所有文件【安全，修改保留】
echo      git restore --staged .
echo      所有文件从暂存区移除，修改都在工作区保留
echo.
echo ═════ 第三类：撤销提交（已 commit，还没 push） ═════
echo   你已经用了 git commit，但还没传到 GitHub。
echo.
echo   5）撤销最近一次提交，但保留修改在暂存区【安全】
echo      git reset --soft HEAD~1
echo      适合：提交说明写错了，想重写
echo.
echo   6）撤销最近一次提交，修改放回工作区【安全】
echo      git reset HEAD~1
echo      适合：提交太早了，想继续改代码
echo.
echo   7）彻底删除最近一次提交【危险！不可恢复！】
echo      git reset --hard HEAD~1
echo      本次提交的所有修改永久删除！
echo      除非你非常确定不要了，否则用 5 或 6
echo.
echo ═════ 第四类：撤销已推送的提交（已经传到 GitHub） ═════
echo   8）生成一个新提交来撤销旧提交【最安全推荐！】
echo      git revert 提交的ID编号
echo      因为不删除历史，只是新增一个"反操作"的提交
echo      提交ID 在 git log 里可以看到，通常是7位编号
echo.
set /p mode=你现在在哪个阶段？输入 1-8 选择你要的操作：
if "%mode%"=="1" goto undo_one_file
if "%mode%"=="2" goto undo_all_files
if "%mode%"=="3" goto undo_unstage_one
if "%mode%"=="4" git restore --staged .
if "%mode%"=="5" goto undo_soft_reset
if "%mode%"=="6" goto undo_mixed_reset
if "%mode%"=="7" goto undo_hard_reset
if "%mode%"=="8" goto undo_revert
pause
goto menu

:undo_one_file
set /p fname=请输入要撤销修改的文件名（例如：index.html）：
if not "%fname%"=="" git restore "%fname%"
pause
goto menu

:undo_all_files
echo 你确定要丢掉所有文件的修改吗？这个操作不能恢复！
set /p confirm=输入 y 确认，其他键取消：
if /i "%confirm%"=="y" git restore .
pause
goto menu

:undo_unstage_one
set /p fname=请输入要取消暂存的文件名（例如：index.html）：
if not "%fname%"=="" git restore --staged "%fname%"
pause
goto menu

:undo_soft_reset
echo 将撤销最近一次提交，但修改会保留在暂存区。
echo 之后你可以重新 git commit。
set /p confirm=输入 y 确认，其他键取消：
if /i "%confirm%"=="y" git reset --soft HEAD~1
pause
goto menu

:undo_mixed_reset
echo 将撤销最近一次提交，修改放回工作区（未暂存）。
echo 之后你可以继续改代码，然后重新 add 和 commit。
set /p confirm=输入 y 确认，其他键取消：
if /i "%confirm%"=="y" git reset HEAD~1
pause
goto menu

:undo_hard_reset
echo ??? 严重警告：此操作将永久删除最近一次提交的所有修改！
echo 删除后无法恢复！确定要执行吗？
set /p confirm=输入 YES（必须大写）确认，其他键取消：
if "%confirm%"=="YES" git reset --hard HEAD~1
pause
goto menu

:undo_revert
echo 下面会打开一个编辑器让你确认撤销信息，直接关闭即可。
set /p commitid=请输入要撤销的提交ID（在 git log 可看到，如 a1b2c3d）：
if not "%commitid%"=="" git revert "%commitid%"
pause
goto menu


:help
cls
echo ===== Git 使用指南（新手必看！） =====
echo.
echo ┌─ 新手最常见的 4 个操作流程 ────────────┐
echo │ 下面每一行都是一个步骤，                │
echo │ 在本工具中对应一个编号，                │
echo │ 按顺序做完就能完成任务！                │
echo └─────────────────────────────────────────┘
echo.
echo ── 流程一：自己新建项目并上传 GitHub ──
echo   （场景：你有一个文件夹，想第一次传到 GitHub）
echo.
echo   第一步：11 → 设置用户名和邮箱（只做一次）
echo   第二步：1  → git init 初始化仓库
echo   第三步：4  → git add . 添加文件
echo   第四步：5  → git commit -m "第一次提交" 提交版本
echo   第五步：9  → git remote add origin 地址 绑定 GitHub 地址
echo   第六步：6  → 选2 第一次上传main分支
echo.
echo ── 流程二：下载别人的项目 ──
echo   （场景：在 GitHub 上看到了一个开源项目）
echo.
echo   第一步：2  → git clone 仓库地址
echo   直接粘贴地址按回车，搞定！
echo.
echo ── 流程三：日常更新代码到 GitHub ──
echo   （场景：改了代码，想同步到 GitHub）
echo.
echo   第一步：3  → git status 看看改了啥（养成习惯！）
echo   第二步：13 → git diff 查看具体改动（可选，但推荐）
echo   第三步：10 → 一键添加提交上传（最方便！）
echo   或者分步做：4(add) → 5(commit) → 6(push)
echo.
echo ── 流程四：同步 GitHub 上的最新代码 ──
echo   （场景：别人更新了代码，你也要拿到最新版）
echo.
echo   第一步：7 → git pull 拉取更新
echo.
echo ── 高级用法提示 ──
echo   做新功能 → 先用 12 创建分支
echo   改错了  → 先用 14 按阶段撤销
echo   看历史  → 用 8 查看提交记录
echo.
pause
goto menu