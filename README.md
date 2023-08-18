# Rust IDE with Neovide for Lazy Vim Users

> Better workflow , testing and debugging capability on your Next Rust Projects

TODO:
 - Add Spellcheck
 - Add [Snippets](https://www.lazyvim.org/plugins/coding)
 - Add [VsCode](https://www.lazyvim.org/extras/vscode)

<details>
<summary>
<strong> Requirements  <strong>
</summary>

Must Have Installed, check the link on how to install it

- [Rust](https://www.rust-lang.org/tools/install)

- [Neovim](https://neovim.io)

- [Nerd Font](https://www.nerdfonts.com)

- [Neovide](https://neovide.dev)

- [Cargo Nexttest](https://nexte.st)

- [Lazy Git](https://github.com/jesseduffield/lazygit#installation)

> Note if you have existing neovim set up [check this out](https://www.lazyvim.org/installation)

</details>

<br>

<details>
<summary>
 <strong> Ultimate Productivity Keybindings </strong>
</summary>
<br>

### <strong>Show All Keymaps</strong>


<kbd>SHIFT</kbd>+<kbd>SPACE</kbd> === `List and Search All Keymaps`

Note: For Mac <kbd>CMD</kbd> for Windows/Linux replace it with <kbd>ALT</kbd>

### <strong>Testing:</strong>

<kbd>F1</kbd> === `RustRunnables`

<kbd>F3</kbd> === `RustDebuggables`

<kbd>F4</kbd> === `Toggle Test Summary`

<kbd>F5</kbd> === `Reload Workspace`

<kbd>CMD</kbd> + <kbd>R</kbd> === `Run App`

<kbd>CMD</kbd> + <kbd>E</kbd> === Run Test Under Cursor

<kbd>CMD</kbd> + <kbd>T</kbd> === `Debug Test Under Cursor`

### <strong>Debugging:</strong>

<kbd>CMD</kbd> + `backtick` === `Toggle Debugger UI`

<kbd>CMD</kbd> + <kbd>X</kbd> === `Toggle Breakpoint``

<kbd>CMD</kbd> + <kbd>F1</kbd> === `Step Over`

<kbd>CMD</kbd> + <kbd>F2</kbd> === `Step Into`

<kbd>CMD</kbd> + <kbd>F3</kbd> === `Step Out`

<kbd>CMD</kbd> + <kbd>F4</kbd> === `Continue`

<kbd>CMD</kbd> + <kbd>i</kbd> === `Rust Toggle Inlay Hints`

### <strong>File Editing</strong>

<kbd>F2</kbd> === `Rename`

<kbd>CMD</kbd> + <kbd>S</kbd> === `Save`

<kbd>CMD</kbd> + <kbd>V</kbd> === `Paste`

<kbd>CMD</kbd> + <kbd>Y</kbd> === `Redo`

<kbd>CMD</kbd> + <kbd>Z</kbd> === `Undo`

<kbd>CMD</kbd> + <kbd>.</kbd> === `Code Actions`

<kbd>CMD</kbd> + <kbd>M</kbd> === `Expand Rust Macro`


> Note: this is for MacOS users only

<kbd>OPT</kbd> + <kbd>J,K</kbd> === `Move Line Up and Down`

### <strong> Navigation</strong>

> Note: You need to Rebind CMD + Q to use Smart Quit (optional) , defaults to Quit `Neovide`

<kbd>CMD</kbd> + <kbd>Q</kbd> === `Quit All`

<kbd>CMD</kbd> + <kbd>N</kbd> === `New Tab`

<kbd>CMD</kbd> + <kbd>[1-9]</kbd> === `Switch Tab [1-9]`

<kbd>CMD</kbd> + <kbd>B</kbd> === `Toggle Sidebar`

## <strong>Telescope</strong>

<kbd>CMD</kbd> + <kbd>D</kbd> === `Workspace Diagnostics`

<kbd>OPT</kbd> + <kbd>D</kbd> === `Document Diagnostics`

<kbd>CMD</kbd> + <kbd>F</kbd> === `Find Everything on Workspace`

<kbd>OPT</kbd> + <kbd>F</kbd> === `Find on Files (CWD)`

<kbd>CMD</kbd> + <kbd>G</kbd> === `Open Lazy Git`

<kbd>OPT</kbd> + <kbd>G</kbd> === `Diff File History`

<kbd>CMD</kbd> + <kbd>O</kbd> === `Go to Symbols on Workspace`

<kbd>OPT</kbd> + <kbd>O</kbd> === `Go to Symbols on Current Open File`

<kbd>CMD</kbd> + <kbd>P</kbd> === `Open Files on Current Working Directory`

<kbd>CMD</kbd> + <kbd>W</kbd> === `Find Open Buffers`

<kbd>CTRL</kbd> + <kbd>R</kbd> === `Recent Files`

<kbd>OPT</kbd> + <kbd>R</kbd> === `Recent (CWD)`


### <strong>Rust Leader Commands</strong>

> Note: Leader Key is <kbd>space</kbd>

| Key                           | Description                   | Mode  |
|-------------------------------|-------------------------------|-------|
| <code>&lt;leader&gt;rt</code> | Run Test Under Cursor         | **n** |
| <code>&lt;leader&gt;rr</code> | Rust Runnables                | **n** |
| <code>&lt;leader&gt;rl</code> | List Test Summary             | **n** |
| <code>&lt;leader&gt;rd</code> | Rust Debuggables              | **n** |
| <code>&lt;leader&gt;rm</code> | Rust Expand Macro             | **n** |
| <code>&lt;leader&gt;rh</code> | Rust Disable Inlay Hints      | **n** |
| <code>&lt;leader&gt;rH</code> | Rust Enable Inlay Hints       | **n** |
| <code>&lt;leader&gt;ru</code> | Toggle Debug UI               | **n** |
| <code>&lt;leader&gt;rs</code> | Rust Standalone Server        | **n** |
| <code>&lt;leader&gt;rv</code> | Reload Vim Configuration      | **n** |
| <code>&lt;leader&gt;dS</code> | Delete Swap Files             | **n** |

<hr>

</details>

<details>
<summary>
Some Built in Keybindings by Lazy Nvim
</summary>

## <strong>LSP</strong>

<kbd>leader</kbd> + <kbd>uf</kbd> === `Toggle Formatting`

| Key                           | Description            | Mode         |
| ----------------------------- | ---------------------- | ------------ |
| <code>gd</code>               | Goto Definition        | **n**        |
| <code>gr</code>               | References             | **n**        |
| <code>gD</code>               | Goto Declaration       | **n**        |
| <code>gI</code>               | Goto Implementation    | **n**        |
| <code>gy</code>               | Goto T[y]pe Definition | **n**        |
| <code>K</code>                | Hover                  | **n**        |
| <code>]d</code>               | Next Diagnostic        | **n**        |
| <code>[d</code>               | Prev Diagnostic        | **n**        |
| <code>]e</code>               | Next Error             | **n**        |
| <code>[e</code>               | Prev Error             | **n**        |
| <code>]w</code>               | Next Warning           | **n**        |
| <code>[w</code>               | Prev Warning           | **n**        |
| <code>&lt;leader&gt;cf</code> | Format Document        | **n**        |
| <code>&lt;leader&gt;ca</code> | Code Action            | **n**, **v** |
| <code>&lt;leader&gt;cA</code> | Source Action          | **n**        |
| <code>&lt;leader&gt;cr</code> | Rename                 | **n**        |

### <strong>Jumping Around</strong>

> Note: usage is press eg. <strong>f / F</strong> then the character to search eg: <strong>a</strong> then press <strong>any highligted 1 char<strong> to jump into

<kbd>f</kbd> === `Jump to Char Forward`

<kbd>F</kbd> === `Jump to Char Backward`


> Note: you can use <strong>n</strong> to search forward and <strong>N</strong> to search backward

<kbd>/</kbd> === `Search for Characters`

<kbd>gw</kbd> === `Search Word under cursor`

</details>

#### [For More Built in Keymaps of Lazy Nvim Check this out](https://www.lazyvim.org/keymaps)


#### [Solution to Known Issues with Neovide on Mac](https://github.com/neovide/neovide/discussions/1984)
