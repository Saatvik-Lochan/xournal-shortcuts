# Easy Xournal++ Keyboard Shortcuts
Configure and change your xournal++ keybindings easily!

# Installation
Find your xournal++ plugin folder (normally located at `~/.xournal/plugins/` on linux) and `git clone` there or copy these files into a
folder in that repository. 

```
plugins
├── xournal-shortcuts
│   ├── actions.txt
│   ├── keybindings.lua
│   ├── main.lua
│   └── plugin.ini
```
It should look somewhat like this.

# Configuration
Simply open the `keybindings.lua` file, it contains a table called `Mappings`. Within it you bind keys.
Under the `actions` subtable, you can use any of the action keywords described in `possible_actions.txt`, and replace
the existing ones.

Under the `cycle` subtable, you can add any of action keywords, and the button press will cycle between them.

Under the `raw` keywords, you can define custom functions. Use the utility `changePen` which accepts `VERY_FINE`, `FINE`, 
`MEDIUM`, `THICK`, and `VERY_THICK`, along with a hex colour, to easily change the pen.

You can use letters such as 'a', 'b', and so on to bind keys to, and you can also use modifiers along with them such as
'<Shift>a' etc. One issue might be that a keybinding is already used by xournal, in this case your binding might not trigger.
So keep away from using '<Ctrl>' unless you know nothing is bound to it.

Read my example config in `keybindgs.lua` to get a better idea. Note that I use colemak (not qwerty), so most of the default
keybindgs will probably not suit your needs.

If the plugin suddenly stops working, then you've probably accidentally disabled all the keyboard shortcuts (this is bound to
be toggled on tab). You can stop this from happening permanently by editing `main.lua` 
(look for `registerUi` with the menu "Toggle shortcuts enabled").

# Further Plugins Stuff
https://xournalpp.github.io/guide/plugins/plugins/
