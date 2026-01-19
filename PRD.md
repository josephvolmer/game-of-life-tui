# Game of Life TUI - Product Requirements Document

## Project Overview
A fully functional, pip-installable Conway's Game of Life implementation with a terminal-based user interface (TUI) using Python and Textual.

## Installation Requirements
- **Install command**: `pip install game-of-life-tui`
- **Run command**: `game-of-life` (console script entry point)
- **Alternative run**: `python -m game_of_life_tui`
- **Zero system dependencies**: Pure Python package
- **Platform support**: Windows, macOS, Linux
- **Python version**: >=3.8
- **Single dependency**: textual>=0.47.0

## Project Structure
```
game-of-lif-tui/
├── pyproject.toml           # Modern Python package configuration
├── README.md                # PyPI description & usage instructions
├── LICENSE                  # MIT license
├── PRD.md                   # This file - Product Requirements
└── src/
    └── game_of_life_tui/
        ├── __init__.py      # Package initialization with version
        ├── __main__.py      # Entry point for `python -m game_of_life_tui`
        ├── app.py           # Main Textual application (~250 lines)
        ├── game.py          # Game logic (grid, rules) (~150 lines)
        └── patterns.py      # Preset pattern definitions (~50 lines)
```

## Core Game Rules (Conway's Game of Life)
1. Any live cell with 2-3 live neighbors survives
2. Any dead cell with exactly 3 live neighbors becomes alive
3. All other cells die or stay dead

## Grid Specifications
- **Dimensions**: 50 rows × 50 columns
- **Topology**: Toroidal (wrapping edges) - top wraps to bottom, left wraps to right
- **Cell representation**:
  - Live cell: `█` (block character)
  - Dead cell: `·` (middle dot) or space

## Display Requirements
- Real-time grid updates during simulation
- No flickering or visual artifacts
- Status bar showing:
  - Current generation number
  - Current population count (number of live cells)
  - Simulation speed (ms per generation)
  - Current mode (Playing/Paused/Editing)
- Cursor highlighting when in edit mode (paused)
- Color coding for cell age (1-5 generations old, gradient from bright to dim)

## Keyboard Controls

### Navigation & Editing
- **Arrow keys** (↑↓←→): Navigate cursor around grid
- **Spacebar**: Toggle cell at cursor position (alive ↔ dead)

### Simulation Control
- **P**: Play/Pause simulation
- **S**: Step forward one generation (only when paused)
- **+**: Increase simulation speed (decrease delay)
- **-**: Decrease simulation speed (increase delay)

### Grid Operations
- **R**: Randomize grid with random live cells
- **C**: Clear all cells (empty grid)
- **1-5**: Spawn preset patterns at cursor position:
  - **1**: Glider
  - **2**: Blinker
  - **3**: Toad
  - **4**: Beacon
  - **5**: Pulsar

### File Operations
- **Ctrl+S**: Save current grid state to file
- **Ctrl+L**: Load grid state from file
- **File format**: JSON with grid dimensions and live cell coordinates

### Application
- **Q** or **Esc**: Quit application

## Features

### 1. Real-time Simulation
- Adjustable speed: 100ms to 1000ms per generation
- Smooth updates using Textual's reactive framework
- Generation counter increments automatically
- Population counter updates in real-time

### 2. Manual Editing Mode
- When paused, user can navigate with arrow keys
- Cursor highlights current cell
- Spacebar toggles cell state
- Can place preset patterns at cursor location
- Resume simulation with P key

### 3. Preset Patterns Library
Five common Game of Life patterns:
1. **Glider**: 3×3 pattern that moves diagonally
2. **Blinker**: 3×1 oscillator (period 2)
3. **Toad**: 4×2 oscillator (period 2)
4. **Beacon**: 4×4 oscillator (period 2)
5. **Pulsar**: 13×13 oscillator (period 3)

### 4. Color Coding
- Cells color-coded by age (how long they've been alive)
- Age 1: Brightest color (newly born)
- Age 2-4: Gradual dimming
- Age 5+: Dimmest color (oldest cells)
- Uses Textual's rich color support

### 5. Save/Load Functionality
- **Save format**: JSON file
  ```json
  {
    "width": 50,
    "height": 50,
    "generation": 42,
    "live_cells": [[x1, y1], [x2, y2], ...]
  }
  ```
- **Default filename**: `game_of_life_<timestamp>.json`
- **Load**: Prompts for filename or uses file picker

### 6. Random Initialization
- R key fills grid with random cells
- Approximately 20-30% density for interesting patterns
- Useful for quick experimentation

### 7. Step Mode
- S key advances exactly one generation when paused
- Useful for studying pattern evolution
- Shows immediate visual feedback

## Technical Implementation Details

### Game Logic (game.py)
- `GameGrid` class managing 50×50 grid
- Efficient neighbor counting with toroidal wraparound
- Cell age tracking (1-5+)
- Conway's rules implementation
- Save/load methods for JSON serialization

### Patterns (patterns.py)
- Dictionary of preset patterns
- Each pattern defined as list of relative coordinates
- `place_pattern(grid, pattern, x, y)` function
- Handles boundary wrapping when placing patterns

### Textual Application (app.py)
- Custom `GridWidget` for displaying game grid
- Reactive properties for generation, population, speed
- Keyboard bindings for all controls
- Status bar component
- File dialog integration for save/load
- Main app class coordinating all components

### Package Configuration (pyproject.toml)
- Build system: setuptools or hatchling
- Package name: `game-of-life-tui`
- Console script entry point: `game-of-life`
- Dependencies: textual>=0.47.0
- Python requirement: >=3.8
- Metadata for PyPI upload

## User Experience Goals
1. **Immediate usability**: Works after single `pip install` command
2. **Intuitive controls**: Clear keyboard shortcuts, visible in help screen
3. **Visual clarity**: Clear distinction between live/dead cells
4. **Responsive**: No lag during simulation or editing
5. **Educational**: Easy to experiment with patterns and observe behavior
6. **Professional**: Clean, polished terminal interface

## Success Criteria
- ✓ Installs successfully with `pip install game-of-life-tui`
- ✓ Runs with `game-of-life` command
- ✓ All keyboard controls work as specified
- ✓ Grid updates smoothly without flickering
- ✓ All preset patterns spawn correctly
- ✓ Save/load preserves grid state accurately
- ✓ Works on macOS, Linux, and Windows
- ✓ No external system dependencies required

## Future Enhancements (Out of Scope for v1.0)
- Additional pattern library
- Grid size customization
- Different color themes
- Pattern editor mode
- Performance statistics
- Multiplayer/collaborative editing
- Web-based version
