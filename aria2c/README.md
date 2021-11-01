# aria2.conf

Fork from [mogeko/aria2.conf (gist)](https://gist.github.com/mogeko/64a20bc441cb43a7b26e416270c10168).

自用的 Aria2 配置，在 [3TERX/aria2.conf](https://github.com/P3TERX/aria2.conf) 的基础上改的。

在继承 [3TERX/aria2.conf](https://github.com/P3TERX/aria2.conf) 的优点外做了以下改动:

- 关闭了 RPC
- 下载完成后自动整理下载好的文件

## 使用方法

下载 `aria2.conf`, `arrange.sh`, `tracker.sh` 到 `$HOME/.aria2/`：

```
curl -fLo $HOME/.aria2/aria2.conf --create-dirs \
    https://raw.githubusercontent.com/mogeko/dotfiles/master/aria2c/aria2.conf
curl -fLo $HOME/.aria2/arrange.sh --create-dirs \
    https://raw.githubusercontent.com/mogeko/dotfiles/master/aria2c/arrange.sh
curl -fLo $HOME/.aria2/tracker.sh --create-dirs \
    https://raw.githubusercontent.com/mogeko/dotfiles/master/aria2c/tracker.sh
```

因 `aria2.conf` 中不能使用变量，所以将 `$HOME/.aria2/aria2.conf` 中所有的 `$HOME` 替换为 `$HOME` 的绝对路径。

为 `arrange.sh` 和 `tracker.sh` 配置可执行权限：

```
chmod +x $HOME/.aria2/arrange.sh
chmod +x $HOME/.aria2/tracker.sh
```

手动运行一下 `tracker.sh` (如果你愿意，可以使用 `crontab` 等工具周期性的运行此脚本)。

```
$HOME/.aria2/tracker.sh
```
