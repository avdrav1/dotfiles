/**
 * @name Omarchy
 * @author av
 * @version 1.0.0
 * @description Follows the current Omarchy theme. Rendered from
 *   ~/.config/omarchy/themed/vencord.theme.css.tpl on every theme switch
 *   (a theme that ships its own vencord.theme.css wins over this template).
 *   Variable block adapted from https://github.com/imbypass/base16-Discord
 **/

:root {
    --color05: {{ foreground }};
    --color07: {{ foreground }};
    --base00: {{ background }};
    --base01: {{ mix background foreground 3% }};
    --base02: {{ mix background foreground 13% }};
    --base03: {{ mix background foreground 42% }};
    --base04: {{ foreground }};
    --base05: {{ foreground }};
    --base06: {{ foreground }};
    --base07: {{ bright_foreground }};
    --base08: {{ red }};
    --base09: {{ orange }};
    --base0A: {{ yellow }};
    --base0B: {{ accent }};
    --base0C: {{ cyan }};
    --base0D: {{ accent }};
    --base0E: {{ magenta }};
    --base0F: {{ orange }};
}

.theme-light,
.theme-dark,
.theme-darker,
.theme-midnight,
.visual-refresh {
    --activity-card-background: var(--base01) !important;
    --background-accent: var(--base03) !important;
    --background-floating: var(--base02) !important;
    --background-mentioned-hover: color-mix(in srgb, var(--base0B) 35%, var(--base01)) !important;
    --background-mentioned: color-mix(in srgb, var(--base0B) 25%, var(--base01)) !important;
    --background-message-highlight: var(--base02) !important;
    --background-message-hover: var(--base02) !important;
    --background-mod-strong: var(--base02) !important;
    --background-modifier-accent: var(--base02) !important;
    --background-modifier-active: var(--base02) !important;
    --background-modifier-hover: var(--base01) !important;
    --background-modifier-selected: var(--base01) !important;
    --background-primary: var(--base01) !important;
    --background-secondary-alt: var(--base01) !important;
    --background-secondary: var(--base00) !important;
    --background-surface-highest: var(--base02) !important;
    --background-surface-higher: var(--base02) !important;
    --background-surface-high: var(--base02) !important;
    --background-tertiary: var(--base00) !important;
    --background-base-low: var(--base01) !important;
    --background-base-lower: var(--base00) !important;
    --background-base-lowest: var(--base00) !important;
    --background-base-tertiary: var(--base00) !important;
    --background-code: var(--base02) !important;
    --background-mod-subtle: var(--base01) !important;
    --bg-base-secondary: var(--base00) !important;
    --bg-base-tertiary: var(--base00) !important;
    --bg-brand: var(--base0B) !important;
    --bg-mod-faint: var(--base01) !important;
    --bg-overlay-2: var(--base01) !important;
    --bg-overlay-3: var(--base01) !important;
    --bg-overlay-color-inverse: var(--base03) !important;
    --bg-surface-raised: var(--base02) !important;
    --bg-surface-overlay: var(--base00) !important;
    --black: var(--base00) !important;
    --blurple-50: var(--base03) !important;
    --border-faint: var(--base02) !important;
    --border-subtle: var(--border-faint) !important;
    --brand-05a: var(--base01) !important;
    --brand-10a: var(--base01) !important;
    --brand-15a: var(--base01) !important;
    --brand-260: var(--base0B) !important;
    --brand-360: var(--base0B) !important;
    --brand-500: var(--base0B) !important;
    --brand-560: var(--base01) !important;
    --button-danger-background: var(--base08) !important;
    --button-danger-background-disabled: var(--base03) !important;
    --button-filled-brand-background: var(--base0B) !important;
    --button-filled-brand-background-hover: var(--base08) !important;
    --button-filled-brand-text: var(--base00) !important;
    --button-filled-brand-text-hover: var(--base05) !important;
    --button-outline-positive-border: var(--base0B) !important;
    --button-outline-danger-background-hover: var(--base08) !important;
    --button-outline-danger-border-hover: var(--base08) !important;
    --button-positive-background: var(--base0B) !important;
    --button-positive-background-disabled: var(--base03) !important;
    --button-positive-background-hover: var(--base03) !important;
    --button-secondary-background: var(--base02) !important;
    --button-secondary-background-disabled: var(--base03) !important;
    --button-secondary-background-hover: var(--base03) !important;
    --button-secondary-text: var(--color07) !important;
    --card-primary-bg: var(--base02) !important;
    --card-background-default: var(--base02) !important;
    --channel-icon: var(--base0B) !important;
    --channels-default: var(--base03) !important;
    --channel-text-area-placeholder: var(--base03) !important;
    --channeltextarea-background: var(--base01) !important;
    --chat-background-default: var(--base01) !important;
    --chat-text-muted: var(--base03) !important;
    --checkbox-background-checked: var(--base0D) !important;
    --checkbox-border-checked: var(--base0D) !important;
    --checkbox-background-default: var(--base02) !important;
    --checkbox-border-default: var(--base03) !important;
    --control-brand-foreground-new: var(--base0D) !important;
    --control-brand-foreground: var(--base04) !important;
    --control-text-primary-default: var(--base00) !important;
    --control-background-primary-default: var(--color05) !important;
    --custom-notice-text: var(--base01) !important;
    --custom-poll-style-vote-percentage: var(--base04) !important;
    --deprecated-text-input-bg: var(--base01) !important;
    --deprecated-text-input-border: var(--base02) !important;
    /*--font-display: var(--font, "gg sans") !important;
    --font-headline: var(--font, "gg sans") !important;
    --font-primary: var(--font, "gg sans") !important;*/
    --green-330: var(--base0B) !important;
    --green-360: var(--base0B) !important;
    --green-300: var(--base0B) !important;
    --header-primary: var(--base0B) !important;
    --header-secondary: var(--base0B) !important;
    --home-background: var(--base00) !important;
    --info-warning-foreground: var(--base0A) !important;
    --input-background: var(--base02) !important;
    --input-border: var(--base03) !important;
    --input-placeholder-text: var(--base03) !important;
    --interactive-active: var(--color07) !important;
    --interactive-hover: var(--color07) !important;
    --interactive-muted: var(--base03) !important;
    --interactive-normal: var(--color07) !important;
    --mention-background: color-mix(in srgb, var(--base0B) 30%, var(--base01)) !important;
    --mention-foreground: var(--base05) !important;
    --menu-item-danger-active-bg: var(--base08) !important;
    --menu-item-danger-hover-bg: var(--base08) !important;
    --menu-item-default-hover-bg: var(--base03) !important;
    --message-reacted-background: var(--base02) !important;
    --message-reacted-text: var(--base05) !important;
    --modal-background: var(--base01) !important;
    --modal-footer-background: var(--base00) !important;
    --notice-background-positive: var(--base0B) !important;
    --notice-text-positive: var(--base01) !important;
    --notice-background-warning: var(--base0A) !important;
    --notice-text-warning: var(--base01) !important;
    --notice-background-negative: var(--base08) !important;
    --notice-text-negative: var(--base01) !important;
    --opacity-blurple-24: var(--base02) !important;
    --plum-23: var(--base02) !important;
    --polls-victor-fill: var(--base0B) !important;
    --profile-gradient-button-color: var(--base02) !important;
    --primary-130: var(--base05) !important;
    --primary-300: var(--base05) !important;
    --primary-500: var(--base02) !important;
    --primary-600: var(--base00) !important;
    --primary-630: var(--base01) !important;
    --primary-660: var(--base00) !important;
    --primary-700: var(--base01) !important;
    --primary-800: var(--base00) !important;
    --red-400: var(--base08) !important;
    --red-460: var(--base08) !important;
    --red-500: var(--base08) !important;
    --red-630: var(--base08) !important;
    --red: var(--base08) !important;
    --red-new-22: var(--base08) !important;
    --redesign-input-control-selected: var(--base0B) !important;
    --scrollbar-auto-thumb: var(--base00) !important;
    --scrollbar-auto-track: transparent;
    --scrollbar-thin-thumb: var(--base00) !important;
    --scrollbar-thin-track: transparent;
    --search-popout-option-fade: none;
    --search-popout-option-non-text-color: var(--base07) !important;
    --status-danger-background: var(--base08) !important;
    --status-danger: var(--base08) !important;
    --status-negative: var(--base08) !important;
    --status-positive-background: var(--base0B) !important;
    --status-positive-text: var(--base0B) !important;
    --status-positive: var(--base0B) !important;
    --status-success: var(--base0B) !important;
    --status-warning-background: var(--base03) !important;
    --status-warning: var(--base09) !important;
    --teal-430: var(--base0C) !important;
    --text-brand: var(--base0D) !important;
    --text-default: var(--base05) !important;
    --text-feedback-positive: var(--base0B) !important;
    --text-feedback-negative: var(--base08) !important;
    --text-feedback-warning: var(--base09) !important;
    --text-feedback-success: var(--base0B) !important;
    --text-link: var(--base0B) !important;
    --text-muted: var(--base03) !important;
    --text-negative: var(--base08) !important;
    --text-normal: var(--base05) !important;
    --text-positive: var(--base0B) !important;
    --text-primary: var(--base05) !important;
    --text-secondary: var(--base04) !important;
    --text-tertiary: var(--base03) !important;
    --text-warning: var(--base09) !important;
    --textbox-markdown-syntax: var(--base05) !important;
    --theme-base-color: var(--base00) !important;
    --user-profile-overlay-background: var(--base01) !important;
    --white-100: var(--base05) !important;
    --white-200: var(--base05) !important;
    --white-500: var(--base05) !important;
    --white: var(--color05) !important;
    --yellow-360: var(--base0A) !important;
    --yellow-300: var(--base0A) !important;
    --__lottieIconColor: var(--base03) !important;
    --card-background-default: var(--base02) !important;
    --redesign-button-secondary-background: var(--base03) !important;
}

/*--- Default Color Swap ---*/
path[fill^="currentColor"],
svg[fill^="currentColor"],
rect[fill^="currentColor"] {
    fill: var(--color07) !important;
}

/*--- Channel Icon Recolor ---*/
a[data-list-item-id^="channels___"] svg,
a[data-list-item-id^="channels___"] svg path {
    fill: var(--channel-icon) !important;
}

/*--- Unread Bar + Badges ---*/
div[class*="unreadBar"],
span[class*="unreadBar"],
div[class*="unreadPill"] {
    background-color: var(--base0B) !important;
    color: var(--base00) !important;
}
div[class*="numberBadge"],
span[class*="numberBadge"],
div[class*="textBadge"],
span[class*="textBadge"] {
    background-color: var(--base0B) !important;
    color: var(--base00) !important;
}

/*--- Selected Text Recolor ---*/
::selection {
    color: var(--base00);
    background: var(--base03);
}

/*--- Mention Interactive Hover Color ---*/
.mention.interactive:hover {
    background-color: var(--base04) !important;
    color: var(--base00) !important;
}
