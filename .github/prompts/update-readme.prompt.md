# Update README with New Feature

## Context

You are helping maintain a Flutter practice/portfolio project. The README.md showcases completed implementations with GIFs, techniques demonstrated, and inspiration sources.

## Your Task

Scan the codebase to detect any new features/modules/designs that are NOT yet documented in README.md, then update the README to include them.

## Step 1: Analyze Current README

Read `README.md` and extract the list of features already documented in the Features table.

## Step 2: Scan Codebase for Features

Check the `lib/` folder structure. Each subfolder (except common/shared utilities) typically represents a feature module:

```
lib/
├── main.dart
├── feature_one/          # Feature module
├── feature_two/          # Feature module
└── ...
```

Compare against what's documented in README.md to find **undocumented features**.

## Step 3: Analyze Each New Feature

For each undocumented feature folder, analyze the code to extract:

1. **Feature Name** - Human-readable name (convert snake_case to Title Case)
2. **Inspiration Source** - Look for comments mentioning inspiration, or infer from naming/design
3. **Techniques Demonstrated** - Analyze code for:
   - Animation techniques (AnimationController, AnimatedBuilder, Curves, etc.)
   - Custom painters/clippers (CustomPainter, CustomClipper)
   - State management patterns
   - Layout techniques (Slivers, CustomScrollView, etc.)
   - Gesture handling
   - Dart language features (extensions, pattern matching, etc.)
   - Any notable packages used

## Step 4: Locate Demo GIF

The user will provide a demo GIF file. Move/rename it to:

```
assets/screenshots/<feature_name>_demo.gif
```

## Step 5: Update README.md

### 5a. Add to Features Table

Add a new row in the Features table:

```markdown
|  #  | Feature                                          | Concepts Demonstrated                      |
| :-: | ------------------------------------------------ | ------------------------------------------ |
|  1  | [DBrand Skin Selection](#-dbrand-skin-selection) | Custom Clipper, Animations, Color Blending |
|  2  | [New Feature Name](#-new-feature-name)           | Technique1, Technique2, Technique3         |
```

### 5b. Add Implementation Section

Add a new section under "## 📱 Implementations" following this template:

```markdown
### 🎭 Feature Name

<p align="center">
  <img src="assets/screenshots/feature_name_demo.gif" alt="Feature Name Demo" width="300"/>
</p>

**Inspired by:** [Source Name](https://source-url.com) - brief description

**Techniques demonstrated:**

- ✅ `TechniqueName` with brief explanation
- ✅ Another technique demonstrated
- ✅ Continue listing all notable techniques...
```

### 5c. Update Project Structure (if needed)

If the new feature adds significant structure, update the Project Structure section.

## Step 6: Verify Changes

- Ensure the anchor link in Features table matches the section header
- Anchor format: `#-feature-name` (lowercase, hyphens, with emoji prefix)
- Verify GIF path is correct
- Check markdown renders properly

## Example Output Format

When reporting findings, structure like this:

### New Features Detected:

1. **feature_folder_name** → "Feature Display Name"
   - Techniques: List of techniques
   - Suggested emoji: 🎭/🎨/✨/🔥/💫

### Actions Required:

1. User to provide demo GIF for: `feature_name`
2. Move GIF to: `assets/screenshots/feature_name_demo.gif`
3. Update README.md with new feature section

---

## Usage Instructions

1. Run this prompt when you've completed a new practice implementation
2. Provide the demo GIF filename when asked
3. Review the generated README changes before committing
