# dotfiles-caos
Пока поддерживаются только `ubuntu`/`debian`/`mint`/etc

Устанавливает:
## vim
Менеджер плагинов [vim-plug](https://github.com/junegunn/vim-plug)
Плагины:
* [coc.nvim](https://github.com/neoclide/coc.nvim) - автодополнение. Использует language server, поэтому может использоваться с почти любым языком. Но для ассемблера ничего не нашел.
* [nerdtree](https://github.com/preservim/nerdtree) - навигация по файлам.
* [ultisnips](https://github.com/SirVer/ultisnips) - разные полезные сниппеты.
* [airline](https://github.com/vim-airline/vim-airline) - более красивая тема.
* [rainbow](https://github.com/luochen1990/rainbow) - разноцветные скобки. Помогает когда скобок много.

Основные сочетания клавиш:
* `<F1>` - активирует `nerdtree`
* `<F9>` - компиляция
* `<F10>` - запуск
* `<F7>` - очищает экран команд
* В `insert mode`: `<Ctrl-space>` - триггерит автодополнение
* Выбор автодополнения: `tab` - next, `<Shift-tab>` - prev, `Enter` или `<Ctrl-y>` - выбрать
* `<Space-4>` - переключиться в буфер 4. Работает для 1-9

По умолчанию стоит анализатор кода только для `c++`, для остальных ставится через `CocInstall (имя плагина)` или `CocList marketplace`

## gdb
Устанавливает [gdb-gef](https://github.com/hugsy/gef)
Может плохо работать если не установлены юникодные локали. Установить:
```bash
sudo locale-gen en_US.utf8
echo 'export LC_ALL=en_US.utf8' >> ~/.bashrc
source ~/.bashrc
```
Если не работает или ругается, проверить название локали через `locale -a`
