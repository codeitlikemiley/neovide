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

##  Rust Specific Key Bindings

### <strong>Testing:</strong>

<kbd>F1</kbd> === `RustRunnables`

<kbd>F3</kbd> === `RustDebuggables`

<kbd>F4</kbd> === `Run Ignored Tests`

<kbd>F5</kbd> === `Reload Workspace`

<kbd>CMD</kbd> + <kbd>r</kbd>  ===  `Run App`

<kbd>CMD</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd>  ===  Run Test Under Cursor

<kbd>CMD</kbd> + <kbd>g</kbd>  ===  `Share to Rust Playground`


### <strong>Debugging:</strong>

<kbd>CMD</kbd> +  <kbd>D</kbd>  ===  `Toggle Breakpoint``

<kbd>CMD</kbd> +  <kbd>F1</kbd>  ===  `Continue`

<kbd>CMD</kbd> +  <kbd>F2</kbd>  ===  `Step Over`

<kbd>CMD</kbd> +  <kbd>F3</kbd>  ===  `Step Into`

<kbd>CMD</kbd> +  <kbd>F4</kbd>  ===  `Step Out`


### <strong>LSP</strong>


<kbd>F2</kbd> === `Rename`

<kbd>CMD</kbd> + <kbd>.</kbd>  ===  `Code Actions`

<kbd>CMD</kbd> + <kbd>P</kbd>  ===  `Search File`


## Global Key Bindings

### <strong>File Editing</strong>

<kbd>CMD</kbd> + <kbd>S</kbd>  ===  `Save`

<kbd>CMD</kbd> + <kbd>V</kbd>  ===  `Paste`

<kbd>CMD</kbd> + <kbd>Y</kbd>  ===  `Redo`

<kbd>CMD</kbd> + <kbd>Z</kbd>  ===  `Undo`

<kbd>CMD</kbd> + <kbd>J,K</kbd> === `Move Line Up and Down`


### <strong>Tabs Navigation</strong>


<kbd>CMD</kbd> + <kbd>Q</kbd>  ===  `Quit`

<kbd>CMD</kbd> + <kbd>T</kbd>  ===  `New Tab`

<kbd>CMD</kbd> + <kbd>W</kbd>  ===  `Close Tab`

<kbd>CMD</kbd> + <kbd>[1-9]</kbd>  ===  `Switch Tab [1-9]`

<kbd>CMD</kbd> + <kbd>B</kbd>  ===  `Toggle Sidebar`

<kbd>CTRL</kbd> + <kbd>H,J,K,L</kbd> === `Pane Navigation`

</details>

<details>
<summary>
<strong>Keymaps.lua
</summary>
<br>
```sh
-- Keymaps for quickly moving around panes and resizing panes
require("config/keymaps/navigation") -- navigation panes with [CMD] + [h,j,k,l]
require("config/keymaps/sidebar") -- [CMD] + b to toggle sidebar
require("config/keymaps/split-windows") -- [vsp] and [sp]  split windows
require("config/keymaps/resizepane") -- resize panes with -- . == . __ . and ++

-- Keymaps for editing , manipulating text
require("config/keymaps/clipboard") -- paste with [CMD] + v , Y to yank whole line
require("config/keymaps/unredo") -- [CMD] + z and [CMD] +y
require("config/keymaps/save") -- [CMD] + s to save
require("config/keymaps/reload") -- [shift] + f5 to reload
require("config/keymaps/movelines") -- [OPT] + j and [OPT] + k to move lines up and down

-- manage buffers
require("config/keymaps/smartquit") -- [qq] to smart quit
require("config/keymaps/tabs") -- [CMD] + 1-9 to switch tabs, [CMD] + w to close tab , [CMD] + n to open new tab
require("config/keymaps/buffer_manager") -- [bp, bn, bd ,bq] to manage buffers
```
<details>

#### [Learn Lazy Vim Keymaps](https://www.lazyvim.org/keymaps)
