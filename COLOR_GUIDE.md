# Color Guide - Game of Life TUI

## Cell Age Colors (Meaningful Rainbow)

The cells in the Game of Life change color based on how long they've been alive, creating a beautiful, meaningful rainbow effect:

### Cell Age Progression
1. **Bright Cyan** - Age 1 (Newborn cells) 🐣
   - Freshly created cells glow in bright cyan
   - Just born from three neighbors

2. **Bright Green** - Age 2 (Young cells) 🌱
   - Survived their first generation
   - Growing stronger

3. **Bright Yellow** - Age 3 (Mature cells) ⭐
   - Well-established cells
   - In their prime

4. **Bright Magenta** - Age 4 (Old cells) 🔮
   - Long-lived survivors
   - Rare and valuable

5. **Bright Blue** - Age 5+ (Ancient cells) 💎
   - Extremely rare
   - The wise elders of the grid

## UI Colors

### Status Bar
- **Background**: Uses theme's panel color (changes with theme)
- **Playing Mode**: Bright green (▶ PLAYING)
- **Paused Mode**: Bright yellow (⏸ PAUSED)
- **Stats**: Colored labels with white values
  - Generation counter: Cyan
  - Population count: Magenta
  - Speed indicator: Yellow
- **Separators**: Bright blue │
- **Keyboard hints**: Grey tones

### Cursor (Edit Mode)
- **Background**: Bright red
- **Text**: Bold bright white
- Only visible when paused

### Background
- **Grid background**: Uses theme's surface color (changes with theme)
- Themes available: Press `Ctrl+\` while running

### Header/Footer
- **Background**: Uses theme's panel color (changes with theme)

## Why These Colors?

### Meaningful Progression
The color progression tells a story:
- **Cyan** (birth) → **Green** (growth) → **Yellow** (maturity) → **Magenta** (wisdom) → **Blue** (eternity)

### Visual Benefits
1. **High Contrast**: All colors pop against dark background
2. **Easy Tracking**: You can instantly see cell age distribution
3. **Pattern Recognition**: Different patterns create different color patterns
4. **Age Diversity**: Quickly spot stable vs. dynamic regions
   - Lots of cyan = High birth rate
   - Lots of blue/magenta = Stable structures
   - Mixed colors = Chaotic/interesting areas

### Scientific Insight
The colors help you understand:
- **Oscillators**: Show repeating color patterns
- **Still lifes**: Quickly age to blue/magenta
- **Gliders/spaceships**: Trail of colors as they move
- **Population dynamics**: Color distribution changes over time

## Theme Support

The app now supports Textual's built-in themes!

### How to Change Themes
- Press `Ctrl+\` (Control + Backslash) while the app is running
- Select from available themes (textual-dark, textual-light, nord, monokai, etc.)

### What Changes with Themes
- **Background colors**: Grid and UI backgrounds adapt to theme
- **Panel colors**: Header, footer, status bar adapt to theme
- **Cell colors**: Stay vibrant and consistent (cyan→green→yellow→magenta→blue)
- **Status text**: Stays colorful for visibility

### Why Keep Cell Colors Consistent?
The rainbow cell colors are **meaningful and intentional** - they represent cell age and should be consistent across themes for:
- Easy pattern recognition
- Scientific insight into cell dynamics
- Visual consistency when sharing patterns
- Better learning experience

### Recommended Themes
- **textual-dark** (default): Best contrast, easy on eyes
- **nord**: Soft, pleasant colors
- **monokai**: Vibrant, high contrast
- **gruvbox**: Warm, retro feel
- **textual-light**: For bright environments

## Terminal Compatibility

These colors use the standard 16-color ANSI palette's "bright" variants:
- Works on all modern terminals
- No 256-color or true-color requirements
- Consistent across macOS, Linux, Windows terminals
