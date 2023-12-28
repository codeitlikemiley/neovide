# Rust IDE with Neovide for Lazy Vim Users

> Better workflow , testing and debugging capability on your Next Rust Projects


**NOTE**: Only MacOS Keymaps Are Well Documented on this README.md , I have remove all examples for windows/linux.

**NOTE**: At the moment , only MacOS have been tested and perfected for the workflow. You can Fork and Submit Pull Request If you wanted your Contribution to be added on Main Branch.

<details>
  <summary>Installation on Macos and Linux</summary>

```sh
git clone https://github.com/codeitlikemiley/nvim
mv nvim ~/.config
cd nvim ~/.config/nvim
chmod +x ./install.sh
```

</details>

> Please Check `./install.sh` before running it , especially if your on linux , your package manager might not be supported by the script

<details>
<summary>
<strong> Requirements<strong>
</summary>

Must Have Installed, check the link on how to install it

- [Brew](https://brew.sh) , Package Managers on Linux Distributions , [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)


- [Rust](https://www.rust-lang.org/tools/install)

- [Neovim](https://neovim.io)

- [Nerd Font](https://www.nerdfonts.com) Optional

- [Neovide](https://neovide.dev)

- [Cargo Nexttest](https://nexte.st)

- [Git](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line) and [Lazy Git](https://github.com/jesseduffield/lazygit#installation)


</details>

> Warning: if you have existing neovim set up [check this out](https://www.lazyvim.org/installation)

<br>

> Note: if you forget keybindings just press SHIFT + SPACE

<details>
<summary>
 <strong> Ultimate Productivity Keybindings </strong>
</summary>
<br>

### <strong>Show All Keymaps</strong>


<kbd>SHIFT</kbd>+<kbd>SPACE</kbd> === `List and Search All Keymaps`

Note: For Mac <kbd>CMD</kbd> for Windows/Linux replace it with <kbd>ALT</kbd> for different keymaps it is listed below

### <strong>Testing:</strong>

<kbd>F1</kbd> === `RustRunnables`

<kbd>F3</kbd> === `RustDebuggables`

<kbd>F5</kbd> === `Reload Workspace`



-- Mac Only

<kbd>CMD</kbd> + <kbd>R</kbd> === `Rust Cargo Run / Test under cursor (mac)`

<kbd>CMD</kbd> + <kbd>T</kbd> === `Debug Test Under Cursor (mac)`

<kbd>CMD</kbd> + <kbd>K</kbd> === `Debug Continue (mac)`

> If you have created `.dap_config` folder with `rust.lua` inside it would load that **dap configuration**

<details>
<summary>
 <strong> Example Dap Configuration for Rust </strong>
</summary>

```rust
local function get_configurations()
    return {
        {
            type = 'codelldb',
            request = 'launch',
            name = "Debug executable 'server'",
            cargo = {
                args = {
                    "build",
                    "--bin=server",
                    "--package=server"
                },
                filter = {
                    name = "server",
                    kind = "bin"
                }
            },
            args = {},
            cwd = '${workspaceFolder}',
            program = function()
                return vim.fn.getcwd() .. '/target/debug/server'
            end,
        },
        -- Add other configurations here...
    }
end

return get_configurations
```
</details>

<kbd>OPT</kbd> + <kbd>r</kbd> === `Cargo Bin Runner (mac)`


> This would list all commands in your `.cargo/bin` , and you can `pick` and `run` commands




### <strong>Debugging:</strong>

<kbd>CMD</kbd> + `backtick` === `Toggle Debugger UI`



<kbd>CMD</kbd> + <kbd>J</kbd> === `Step Over`

<kbd>CMD</kbd> + <kbd>L</kbd> === `Step Into`

<kbd>CMD</kbd> + <kbd>H</kbd> === `Step Out`

<kbd>OPT</kbd> + <kbd>S</kbd> === `Continue`

<kbd>F8</kbd>  === `Dap Terminate`

<kbd>CMD</kbd> + <kbd>I</kbd> === `Rust Toggle Inlay Hints`

-- Mac Only
<kbd>CMD</kbd> + <kbd>D</kbd> === `Toggle Breakpoint (mac)`

### <strong>File Editing</strong>

<kbd>F2</kbd> === `Rename`

<kbd>CMD</kbd> + <kbd>S</kbd> === `Save`

<kbd>CMD</kbd> + <kbd>V</kbd> === `Paste`

<kbd>CMD</kbd> + <kbd>Z</kbd> === `Undo`

<kbd>CMD</kbd> + <kbd>.</kbd> === `Code Actions`

<kbd>CMD</kbd> + <kbd>M</kbd> === `Expand Rust Macro`

<kbd>CMD</kbd> + <kbd>slash</kbd> === `Comment Selected Lines on Visual / Normal Mode`

<kbd>slash</kbd> + <kbd>slash</kbd> === `Comment Line`


> Note: this is for MacOS users only

<kbd>OPT</kbd> + <kbd>J,K</kbd> === `Move Line Up and Down`

### <strong> Navigation</strong>

> Note: You need to Rebind CMD + Q to use Smart Quit (optional) , defaults to Quit `Neovide`

<kbd>CMD</kbd> + <kbd>Q</kbd> === `Quit All`

<kbd>CMD</kbd> + <kbd>N</kbd> === `New Tab`

<kbd>CMD</kbd> + <kbd>Y</kbd> === `Rust Parent Module`

<kbd>CMD</kbd> + <kbd>[1-9]</kbd> === `Switch Tab [1-9]`

<kbd>CMD</kbd> + <kbd>F1</kbd> === `Toggle Sidebar`

<kbd>CMD</kbd> + <kbd>F2</kbd> === `Neotest Summary`

<kbd>CMD</kbd> + <kbd>F3</kbd> === `Toggle Document Diagnostics`

<kbd>CMD</kbd> + <kbd>F5</kbd> === `Reload VimRC`

<kbd>CMD</kbd> + <kbd>Y</kbd> === `RustParentModule`

## <strong>Telescope</strong>

<kbd>OPT</kbd> + <kbd>D</kbd> === `Document Diagnostics`

<kbd>OPT</kbd> +<kbd>SHIFT</kbd> + <kbd>D</kbd> === `Workspace Diagnostics`

<kbd>CMD</kbd> + <kbd>F</kbd> === `Find Everything on Workspace`

<kbd>CMD</kbd> + <kbd>G</kbd> === `Open Lazy Git`

<kbd>OPT</kbd> + <kbd>D</kbd> === `Diff File History`

<kbd>CMD</kbd> + <kbd>O</kbd> === `Go to Symbols on Current Open File`

<kbd>CMD</kbd> + <kbd>P</kbd> === `Open Files on Current Working Directory`

<kbd>OPT</kbd> + <kbd>P</kbd> === `Telescope Diagnostics`

<kbd>CMD</kbd> + <kbd>E</kbd> === `Recent Files(CWD)`


### <strong>Rust Leader Commands</strong>

> Note: Leader Key is <kbd>space</kbd>

| Key                           | Description                   | Mode  |
|-------------------------------|-------------------------------|-------|
| <code>&lt;leader&gt;rt</code> | Run Test Under Cursor         | **n** |
| <code>&lt;leader&gt;rb</code> | Run All Cargo Bin Commands    | **n** |
| <code>&lt;leader&gt;rr</code> | Rust Runnables                | **n** |
| <code>&lt;leader&gt;rl</code> | List Test Summary             | **n** |
| <code>&lt;leader&gt;rd</code> | Rust Debuggables              | **n** |
| <code>&lt;leader&gt;rn</code> | Smart Cargo Run Under Cursor  | **n** |
| <code>&lt;leader&gt;rm</code> | Rust Expand Macro             | **n** |
| <code>&lt;leader&gt;rh</code> | Rust Disable Inlay Hints      | **n** |
| <code>&lt;leader&gt;rH</code> | Rust Enable Inlay Hints       | **n** |
| <code>&lt;leader&gt;ru</code> | Toggle Debug UI               | **n** |
| <code>&lt;leader&gt;rs</code> | Rust Standalone Server        | **n** |
| <code>&lt;leader&gt;rw</code> | Rust Cargo Watch              | **n** |
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




<details>

<summary>Checkout Built-in Snippets with Rust</summary>
  <a href="https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/rust/rust.json">Click here to view the snippets</a>

### A
- allow
- assert
- assert_eq

### B
- bench

### C
- cfg
- cfg_attr
- cfg!
- column
- concat
- concat_idents
- const

### D
- deny
- debug_assert
- debug_assert_eq
- derive

### E
- env
- extern-crate
- extern-fn
- extern-mod
- else
- enum
- Err

### F
- file
- format
- format_args
- fn
- for

### I
- include
- include_bytes
- include_str
- if-let
- if
- impl-trait
- impl
- inline-fn

### L
- line
- loop
- let

### M
- macro_use
- module_path
- main
- match
- mod
- mod-block
- macro_rules

### N
- no_std
- no_core

### O
- option_env
- Ok

### P
- panic
- print
- println
- pfn

### R
- repr

### S
- stringify
- static
- Some
- struct-tuple
- struct-unit
- struct

### T
- thread_local
- try
- test
- trait
- type

### U
- unimplemented
- unreachable

### V
- vec

### W
- write
- writeln
- while-let
- while

</details>


<details>

<summary><strong>How to add custom snippets?</strong></summary>

1. Create a file in `~/.config/nvim/snippets/rust.snippets`

`mkdir -pv ~/.config/nvim/snippets && touch ~/.config/nvim/snippets/rust.snippets`

2. Edit `~/.config/nvim/lua/plugins/snip.lua`

```lua
dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").load({
        include = { "rust" },
        -- Uncomment paths
        paths = {
         "~/.config/nvim/snippets"
        },
      })
    end,
  },
```

3. Add your custom snippets in `~/.config/nvim/snippets/rust.snippets`

Note: Format should be the same as vscode snippets eg. [built-in-rust-snippets](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#vs-code)

As a reference on the structure of these snippet libraries, see friendly-snippets.

We support a small extension: snippets can contain LuaSnip-specific options in the luasnip-table:

```json
"example1": {
	"prefix": "options",
	"body": [
		"whoa! :O"
	],
	"luasnip": {
		"priority": 2000,
		"autotrigger": true,
		"wordTrig": false
	}
}
```

Files with the extension jsonc will be parsed as jsonc, json with comments, while *.json are parsed with a regular json parser, where comments are disallowed. (the json-parser is a bit faster, so don't default to jsonc if it's not necessary).

Example:

`~/.config/nvim/my_snippets/package.json`:

```json
{
	"name": "example-snippets",
	"contributes": {
		"snippets": [
			{
				"language": [
					"all"
				],
				"path": "./snippets/all.json"
			},
			{
				"language": [
					"lua"
				],
				"path": "./lua.json"
			}
		]
	}
}
```


`~/.config/nvim/my_snippets/snippets/all.json:`

```json
{
	"snip1": {
		"prefix": "all1",
		"body": [
			"expands? jumps? $1 $2 !"
		]
	},
	"snip2": {
		"prefix": "all2",
		"body": [
			"multi $1",
			"line $2",
			"snippet$0"
		]
	}
}
```

`~/.config/nvim/my_snippets/lua.json`:

```json
{
	"snip1": {
		"prefix": "lua",
		"body": [
			"lualualua"
		]
	}
}
````

This collection can be loaded with any of

-- don't pass any arguments, luasnip will find the collection because it is (probably) in rtp.

```lua
require("luasnip.loaders.from_vscode").lazy_load()
```

-- specify the full path...

```
 uarequire("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/my_snippets"})
```
-- or relative to the directory of $MYVIMRC

```lua
require("luasnip.loaders.from_vscode").load({paths = "./my_snippets"})
````
Standalone

</details>


#### [Solution to Known Issues with Neovide on Mac](https://github.com/neovide/neovide/discussions/1984)
