# Nushell Config File

# The default config record. This is where much of your global configuration is setup.
let-env config = {
  filesize_metric: false
  table_mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
  use_ls_colors: true
  rm_always_trash: false
  use_grid_icons: true
  footer_mode: auto # always, never, number_of_rows, auto
  quick_completions: true  # set this to false to prevent auto-selecting completions when only one remains
  partial_completions: true  # set this to false to prevent partial filling of the prompt
  float_precision: 2
  use_ansi_coloring: true
  filesize_format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
  edit_mode: vi # emacs, vi
  max_history_size: 100000 # Session has to be reloaded for this to take effect
  sync_history_on_enter: true # Enable to share the history between multiple sessions, else you have to close the session to persist history to file
  menus: [
      # Configuration for default nushell menus
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
  ]
}

let-env STARSHIP_SHELL = "nu"
let-env STARSHIP_SESSION_KEY = (random chars -l 16)
let-env PROMPT_MULTILINE_INDICATOR = (^/usr/bin/starship prompt --continuation)

# Does not play well with default character module.
# TODO: Also Use starship vi mode indicators?
let-env PROMPT_INDICATOR = ""

let-env PROMPT_COMMAND = {
    # jobs are not supported
    let width = (term size -c | get columns | into string)
    ^/usr/bin/starship prompt $"--cmd-duration=($env.CMD_DURATION_MS)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)"
}

# Not well-suited for `starship prompt --right`.
# Built-in right prompt is equivalent to $fill$right_format in the first prompt line.
# Thus does not play well with default `add_newline = True`.
let-env PROMPT_COMMAND_RIGHT = {''}

# Zoxide
source ~/.zoxide.nu
