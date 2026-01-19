<div align="center">

<img src="assets/logo.png" alt="Game of Life TUI Logo" width="300">

# Game of Life TUI

A beautiful, interactive terminal-based implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) built with Python and [Textual](https://textual.textualize.io/).

![Python Version](https://img.shields.io/badge/python-3.8+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![PyPI](https://img.shields.io/badge/pypi-game--of--life--tui-blue.svg)

[Installation](#-installation) • [Features](#-features) • [Controls](#-controls) • [Documentation](#-documentation)

</div>

---

## 📸 Screenshot

<div align="center">

![Game of Life TUI in action](assets/screenshot.png)

*Watch cells evolve through rainbow colors as they age - cyan (newborn) → green → yellow → magenta → blue (ancient)*

</div>

---

## ✨ Features

- 🌈 **Vibrant Rainbow Colors** - Cells cycle through cyan→green→yellow→magenta→blue as they age, making pattern dynamics instantly visible
- 🎨 **Theme Support** - Switch between multiple beautiful themes (`Ctrl+\`) while keeping meaningful cell colors
- ⚡ **Zero System Dependencies** - 100% pure Python, installs with a single `pip` command
- 🎮 **Interactive TUI** - Beautiful terminal interface optimized for standard 80×24 screens
- 📦 **Preset Patterns** - Spawn classic patterns like gliders, blinkers, pulsars with a single keypress
- 🎯 **Manual Editing** - Pause and draw your own patterns with intuitive arrow key navigation
- 💾 **Save/Load** - Persist your creations to JSON files for later experimentation
- 🔄 **Adjustable Speed** - Control simulation speed from 100-1000ms per generation
- 🖥️ **Cross-Platform** - Works flawlessly on macOS, Linux, and Windows terminals
- 🧬 **Scientific Insight** - Color-coded cell ages reveal pattern stability and dynamics

## 🚀 Installation

### From PyPI (Recommended)

```bash
pip install game-of-life-tui
```

### From Source

```bash
git clone https://github.com/josephvolmer/game-of-life-tui.git
cd game-of-life-tui
pip install -e .
```

## 🎯 Quick Start

After installation, launch the game:

```bash
game-of-life
```

Or alternatively:

```bash
python -m game_of_life_tui
```

### First Time? Try This!

1. 🎲 Press `R` to generate random cells
2. ▶️ Press `P` to start the simulation
3. ⚡ Press `+` or `-` to adjust speed
4. 🎨 Press `Ctrl+\` to try different themes
5. 🎮 Press `P` to pause and draw your own patterns!

## 🎮 Controls

### Simulation Control
| Key | Action |
|-----|--------|
| `P` | Play/Pause simulation |
| `S` | Step forward one generation (when paused) |
| `+` / `=` | Increase simulation speed |
| `-` | Decrease simulation speed |

### Navigation & Editing
| Key | Action |
|-----|--------|
| `Arrow Keys` | Move cursor around grid |
| `Space` | Toggle cell at cursor (alive ↔ dead) |

### Grid Operations
| Key | Action |
|-----|--------|
| `R` | Fill grid with random cells |
| `C` | Clear all cells |

### Preset Patterns
| Key | Pattern | Type | Description |
|-----|---------|------|-------------|
| `1` | Glider | Spaceship | Travels diagonally across the grid |
| `2` | Blinker | Oscillator | Period 2 oscillator |
| `3` | Toad | Oscillator | Period 2 oscillator |
| `4` | Beacon | Oscillator | Period 2 oscillator |
| `5` | Pulsar | Oscillator | Period 3 oscillator (13×13) |

### File Operations
| Key | Action |
|-----|--------|
| `Ctrl+S` | Save grid to timestamped JSON file |
| `Ctrl+L` | Load grid from `game_of_life.json` |

### Themes & Application
| Key | Action |
|-----|--------|
| `Ctrl+\` | Open theme picker (try nord, monokai, gruvbox!) |
| `Q` or `Esc` | Quit application |

## 🌈 Cell Colors - Meaningful Rainbow

One of the most unique features of this implementation is the **meaningful color progression** that reveals cell dynamics:

```
█ = Live cell (color-coded by age)
· = Dead cell

Cell Age Colors (Rainbow Progression):
🐣 Bright Cyan (Age 1)    → Newborn cells, just born from 3 neighbors
🌱 Bright Green (Age 2)   → Young cells, survived first generation
⭐ Bright Yellow (Age 3)  → Mature cells, well-established
🔮 Bright Magenta (Age 4) → Old cells, long-lived survivors
💎 Bright Blue (Age 5+)   → Ancient survivors, the rarest cells

Cursor (when paused):
🎯 Red background with white text
```

### Why Rainbow Colors?

The color progression isn't just pretty—it's **scientifically meaningful**:

- **Spot Oscillators**: See repeating color patterns
- **Track Gliders**: Watch colorful trails as they move
- **Identify Stable Regions**: Blue/magenta areas are stable
- **See Birth Rate**: Lots of cyan means high activity
- **Understand Dynamics**: Color distribution shows pattern evolution

See [COLOR_GUIDE.md](COLOR_GUIDE.md) for detailed insights!

## 🎨 Theme Support

Press `Ctrl+\` while running to switch between beautiful themes:

- **textual-dark** (default) - Best contrast, easy on eyes
- **textual-light** - For bright environments
- **nord** - Soft, pleasant colors
- **monokai** - Vibrant, high contrast
- **gruvbox** - Warm, retro feel
- And many more!

The background adapts to your theme, while cell colors stay vibrant and meaningful for consistent pattern recognition.

## 📖 Game Rules

Conway's Game of Life is a zero-player game following these simple rules:

1. **Survival**: A live cell with 2-3 live neighbors survives to the next generation
2. **Birth**: A dead cell with exactly 3 live neighbors becomes alive
3. **Death**: All other cells die or remain dead

The grid is **toroidal** (wraps around edges), creating a seamless, infinite-like surface.

## 💡 Examples & Tips

### Creating a Glider
```
1. Run game-of-life
2. Press 1 to place a glider at the cursor
3. Press P to watch it travel diagonally
4. Notice the colorful trail it leaves!
```

### Drawing Custom Patterns
```
1. Press P to pause
2. Use arrow keys to navigate
3. Press Space to toggle cells on/off
4. Press P again to see your creation evolve
5. Watch the colors change as cells age
```

### Experimenting with Randomness
```
1. Press R to randomize
2. Press P to start
3. Watch complex patterns emerge from chaos
4. Press + to speed up time
5. Look for stable blue/magenta structures
```

### Pro Tips
- 🎯 **Finding Patterns**: Look for recurring color cycles to spot oscillators
- 🚀 **Speed Control**: Use `+`/`-` to find your perfect viewing speed
- 💾 **Save Discoveries**: Press `Ctrl+S` to save interesting patterns
- 🎨 **Theme Matching**: Try different themes to match your terminal setup
- 🔬 **Scientific Mode**: Watch color distributions to understand population dynamics

## 📚 Documentation

- **[PRD.md](PRD.md)** - Complete product requirements and specifications
- **[COLOR_GUIDE.md](COLOR_GUIDE.md)** - Deep dive into color meanings and visual insights
- **[QUICKSTART.md](QUICKSTART.md)** - Fast-track guide to get playing
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and improvements

## 🛠️ Technical Details

- **Grid Size**: 50×50 cells
- **Topology**: Toroidal (wrapping edges)
- **Update Rate**: 100-1000ms per generation (adjustable)
- **Architecture**: Pure Python with Textual TUI framework
- **Cell Rendering**: Unicode block characters (`█` and `·`)
- **Color Support**: Standard 16-color ANSI (works everywhere)
- **Save Format**: JSON with live cell coordinates

## 🧪 Development

### Setup

```bash
git clone https://github.com/josephvolmer/game-of-life-tui.git
cd game-of-life-tui
pip install -e .
```

### Run

```bash
game-of-life
```

### Project Structure

```
game-of-lif-tui/
├── README.md              # This file (GitHub)
├── README_PYPI.md        # PyPI package description
├── PRD.md                # Product requirements
├── CHANGELOG.md          # Version history
├── COLOR_GUIDE.md        # Color system documentation
├── LICENSE               # MIT license
├── pyproject.toml        # Package configuration
├── assets/
│   └── screenshot.png    # Demo screenshot
└── src/
    └── game_of_life_tui/
        ├── __init__.py   # Package initialization
        ├── __main__.py   # CLI entry point
        ├── app.py        # Textual application
        ├── game.py       # Game logic
        └── patterns.py   # Preset patterns
```

## 🤝 Contributing

Contributions are welcome! Here are some ideas:

- 🎨 Add more preset patterns
- 🎮 Create pattern collections/libraries
- 📊 Add statistics and analytics
- 🎯 Implement pattern detection
- 🌐 Add more themes
- 📖 Improve documentation
- 🐛 Fix bugs

Please open an issue or submit a pull request!

## 📋 Requirements

- Python 3.8 or higher
- textual >= 0.47.0 (automatically installed)

No system dependencies required—works out of the box!

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [John Conway](https://en.wikipedia.org/wiki/John_Horton_Conway) for inventing the Game of Life
- [Textual](https://textual.textualize.io/) for the amazing TUI framework
- The Python community for excellent tooling and libraries

## 🔗 Links

- **PyPI**: https://pypi.org/project/game-of-life-tui/
- **Issues**: https://github.com/josephvolmer/game-of-life-tui/issues
- **Discussions**: https://github.com/josephvolmer/game-of-life-tui/discussions

---

<div align="center">

**Enjoy exploring cellular automata!** 🎮✨

Made with ❤️ using Python and Textual

[⬆ Back to Top](#-game-of-life-tui)

</div>
