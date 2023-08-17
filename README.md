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

<kbd>CMD</kbd> + <kbd>t</kbd> === Run Test Under Cursor

<kbd>CMD</kbd> + <kbd>g</kbd> === `Share to Rust Playground`

<kbd>CMD</kbd> + <kbd>x</kbd> === `Expand Macros on Rust`

### <strong>Debugging:</strong>

<kbd>CMD</kbd> + <strong>`</strong> === `Toggle Debugger UI`

<kbd>CMD</kbd> + <kbd>d</kbd> === `Toggle Breakpoint``

<kbd>CMD</kbd> + <kbd>F1</kbd> === `Continue`

<kbd>CMD</kbd> + <kbd>F2</kbd> === `Step Over`

<kbd>CMD</kbd> + <kbd>F3</kbd> === `Step Into`

<kbd>CMD</kbd> + <kbd>F4</kbd> === `Step Out`


</details>

<details>
<summary>
Global Key Bindings
</summary>

### <strong>File Editing</strong>

<kbd>F2</kbd> === `Rename`

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


### <strong>LSP</strong>

<kbd>CMD</kbd> + <kbd>.</kbd> === `Code Actions`

<kbd>CMD</kbd> + <kbd>P</kbd> === `Search File`

> Built in LSP keybindings

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;cd</code> | Line Diagnostics | **n** |
| <code>&lt;leader&gt;cl</code> | Lsp Info | **n** |
| <code>gd</code> | Goto Definition | **n** |
| <code>gr</code> | References | **n** |
| <code>gD</code> | Goto Declaration | **n** |
| <code>gI</code> | Goto Implementation | **n** |
| <code>gy</code> | Goto T[y]pe Definition | **n** |
| <code>K</code> | Hover | **n** |
| <code>gK</code> | Signature Help | **n** |
| <code>&lt;c-k&gt;</code> | Signature Help | **i** |
| <code>]d</code> | Next Diagnostic | **n** |
| <code>[d</code> | Prev Diagnostic | **n** |
| <code>]e</code> | Next Error | **n** |
| <code>[e</code> | Prev Error | **n** |
| <code>]w</code> | Next Warning | **n** |
| <code>[w</code> | Prev Warning | **n** |
| <code>&lt;leader&gt;cf</code> | Format Document | **n** |
| <code>&lt;leader&gt;cf</code> | Format Range | **v** |
| <code>&lt;leader&gt;ca</code> | Code Action | **n**, **v** |
| <code>&lt;leader&gt;cA</code> | Source Action | **n** |
| <code>&lt;leader&gt;cr</code> | Rename | **n** |

### <strong>Jumping Around</strong>

<kbd>f</kbd> === `Jump to Char Forward`

<kbd>F</kbd> === `Jump to Char Forward`

### <strong> Searching </strong>

<kbd>/</kbd> === `Search for Characters` ,  to search forward `n` and `N` for backward

<kbd>gw</kbd> === `Search Word under cursor` , to search forward `n` and `N` for backward

</details>

#### [Learn Lazy Vim Keymaps](https://www.lazyvim.org/keymaps)