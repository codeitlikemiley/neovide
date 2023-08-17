# Rust IDE with Neovide for Lazy Vim Users

> Better workflow , testing and debugging capability

<details>
<summary>
<strong> Requirements  <strong>
</summary>

Must Have Installed, check the link on how to install it

- [Rust](https://www.rust-lang.org/tools/install)

- [Neovide](https://neovide.dev)

- [Cargo Nexttest](https://nexte.st)

</details>

<br>

<details>
<summary>
 <strong>  MacOS Keybinding Lists </strong>
</summary>
<br>

## Rust Specific Key Bindings

### <strong>Testing:</strong>

<kbd>F1</kbd> === `RustRunnables`

<kbd>F3</kbd> === `RustDebuggables`

<kbd>F4</kbd> === `Run Ignored Tests`

<kbd>F5</kbd> === `Reload Workspace`

<kbd>CMD</kbd> + <kbd>r</kbd> === `Run App`

<kbd>CMD</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd> === Run Test Under Cursor

<kbd>CMD</kbd> + <kbd>g</kbd> === `Share to Rust Playground`

### <strong>Debugging:</strong>

<kbd>CMD</kbd> + <kbd>D</kbd> === `Toggle Breakpoint``

<kbd>CMD</kbd> + <kbd>F1</kbd> === `Continue`

<kbd>CMD</kbd> + <kbd>F2</kbd> === `Step Over`

<kbd>CMD</kbd> + <kbd>F3</kbd> === `Step Into`

<kbd>CMD</kbd> + <kbd>F4</kbd> === `Step Out`

### <strong>LSP</strong>

<kbd>F2</kbd> === `Rename`

<kbd>CMD</kbd> + <kbd>.</kbd> === `Code Actions`

<kbd>CMD</kbd> + <kbd>P</kbd> === `Search File`

## Global Key Bindings

### <strong>File Editing</strong>

<kbd>CMD</kbd> + <kbd>S</kbd> === `Save`

<kbd>CMD</kbd> + <kbd>V</kbd> === `Paste`

<kbd>CMD</kbd> + <kbd>Y</kbd> === `Redo`

<kbd>CMD</kbd> + <kbd>Z</kbd> === `Undo`

<kbd>CMD</kbd> + <kbd>J,K</kbd> === `Move Line Up and Down`

### <strong>Tabs Navigation</strong>

<kbd>CMD</kbd> + <kbd>Q</kbd> === `Quit`

<kbd>CMD</kbd> + <kbd>T</kbd> === `New Tab`

<kbd>CMD</kbd> + <kbd>W</kbd> === `Close Tab`

<kbd>CMD</kbd> + <kbd>[1-9]</kbd> === `Switch Tab [1-9]`

<kbd>CMD</kbd> + <kbd>B</kbd> === `Toggle Sidebar`

<kbd>CTRL</kbd> + <kbd>H,J,K,L</kbd> === `Pane Navigation`

</details>

<details>
<summary>
<strong>Keymaps.lua
</summary>

<br>

> <strong>Keymaps for quickly moving around panes and resizing panes</strong>

<br>

`config/keymaps/navigation`

<strong>navigation panes with <kbd>CMD</kbd> + <kbd>h,j,k,l</kbd></strong>

<br>

`config/keymaps/sidebar`

<strong><kbd>CMD</kbd> + b to toggle sidebar</strong>

<br>

`config/keymaps/split-windows`

<strong>split windows <kbd>vsp</kbd> and <kbd>sp</kbd></strong>

<br>

`config/keymaps/resizepane`

<strong> resize panes with <kbd>--</kbd> , <kbd>==</kbd> , <kbd>\_\_</kbd>, and <kbd>++</kbd>

<br>

> <strong>Keymaps for editing , manipulating text</strong>

<br>

`config/keymaps/clipboard`

<strong>Clipboard Pasting with <kbd>CMD</kbd> + <kbd>v</kbd> and <kbd>Y</kbd> to yank Line</strong>

<br>

`config/keymaps/undoredo`

<strong>UNDO and REDO with <kbd>CMD</kbd>+<kbd>z</kbd> and <kbd>CMD</kbd>+<kbd>Y</kbd></strong>

<br>

`config/keymaps/save`

<strong>Save Files with <kbd>CMD</kbd>+<kbd>S</kbd></strong>

<br>

`config/keymaps/reload`

<strong>Reload Vim Config with <kbd>Shift</kbd>+<kbd>f5</kbd></strong>

<br>

`config/keymaps/movelines`

<strong>Move lines Up and Down with <kbd>OPT</kbd>+ <kbd>J/K</kbd></strong>

<br>

<br>

> <strong>Manage buffers</strong>

<br>

`config/keymaps/smartquit`

<strong> Smart Quit with <kbd>qq</kbd></strong>

<br>

`config/keymaps/tabs`

<strong>Switch Tabs with <kbd>CMD</kbd>+<kbd>1-9</kbd> , close tab with <kbd>CMD</kbd>+ <kbd>w</kbd> , new tab with <kbd>CMD</kbd>+ <kbd>n</kbd></strong>

<br>

`config/keymaps/buffer_manager`

<strong> Previous Buffer <kbd>bp</kbd>,Next Buffer <kbd>bn</kbd>, Delete Buffer <kbd>bd</kbd>, Quit all Buffers Except Current <kbd>bq</kbd> </strong>

<br>

<details>

#### [Learn Lazy Vim Keymaps](https://www.lazyvim.org/keymaps)
