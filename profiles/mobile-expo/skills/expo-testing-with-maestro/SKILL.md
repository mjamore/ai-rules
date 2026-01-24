---
name: expo-testing-with-maestro
description: How to test Expo apps using Maestro.
version: 1.0.0
---

# Testing with Maestro

This guide covers how to write, run, and maintain Maestro tests for the ticked-off Expo app.

## Overview

Maestro is a mobile testing framework that allows us to write UI tests in YAML. All core functionality must be covered by Maestro tests (see AGENTS.md).

## Installation

Install the Maestro CLI:

```bash
brew tap mobile-dev-inc/tap
brew install maestro
```

Or via npm:

```bash
npm install -g maestro-cli
```

## Project Structure

Tests are located in the `e2e/flows/` directory:

```
e2e/
├── flows/
│   ├── smoke.yaml          # Basic app launch and visibility tests
│   ├── navigation.yaml     # Navigation flow tests
│   └── features.yaml       # Feature-specific tests
```

## Running Tests

### Local Testing

1. **Start the Expo dev server:**

   ```bash
   expo start --ios  # or --android
   ```

2. **Run Maestro tests in another terminal:**
   ```bash
   npm run test:maestro
   ```

### Run Specific Flow

```bash
maestro test e2e/flows/smoke.yaml
```

## Writing Tests

### Basic Structure

Every Maestro test file starts with `appId` and `---`:

```yaml
appId: com.ticked-off
---
- launchApp
- assertVisible:
    text: "Expected text"
```

### Common Commands

| Command                 | Purpose                   | Example                               |
| ----------------------- | ------------------------- | ------------------------------------- |
| `launchApp`             | Launch the app            | `- launchApp`                         |
| `tapOn`                 | Tap element by text or ID | `- tapOn: {text: "Button"}`           |
| `assertVisible`         | Verify text is visible    | `- assertVisible: {text: "Hello"}`    |
| `assertNotVisible`      | Verify text is hidden     | `- assertNotVisible: {text: "Error"}` |
| `inputText`             | Type text into field      | `- inputText: "user@example.com"`     |
| `scroll`                | Scroll down               | `- scroll`                            |
| `swipe`                 | Swipe in direction        | `- swipe: {direction: UP}`            |
| `waitForAnimationToEnd` | Wait for animations       | `- waitForAnimationToEnd`             |
| `back`                  | Press back button         | `- back`                              |

### Best Practices

1. **Use testIDs** for reliable test targeting:

   ```tsx
   <Text testID="welcome-message">Welcome</Text>
   ```

   Then in Maestro:

   ```yaml
   - tapOn:
       id: "welcome-message"
   ```

2. **Keep flows focused** - Each flow should test one feature
3. **Use descriptive names** - `navigation.yaml`, not `test1.yaml`
4. **Minimize nested conditions** - Align with project coding standards (AGENTS.md)
5. **Early assertions** - Check critical state early in tests

### Example Test Flow

```yaml
appId: com.ticked-off
---
- launchApp
- assertVisible:
    text: "Edit app/index.tsx to edit this screen."
- scroll
- scroll
- assertVisible:
    text: "Edit app/index.tsx to edit this screen."
```

## Debugging

### View test output

```bash
maestro test e2e/flows/smoke.yaml --verbose
```

### Common Issues

- **App not launching**: Ensure app is built and simulator/emulator is running
- **Element not found**: Check testID spelling and app state
- **Flaky tests**: Add `waitForAnimationToEnd` before assertions on animated elements

## CI/CD Integration

For GitHub Actions, add to `.github/workflows/test.yml`:

```yaml
name: Maestro Tests

on: [push, pull_request]

jobs:
  maestro:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: maestrosecurity/maestro-action@v1.8.1
        with:
          maestro-version: latest
          workspace: e2e
```

## References

- [Maestro Documentation](https://maestro.mobile.dev/)
- [Expo Testing Guide](https://docs.expo.dev/ui-programming/testable-code/)
- [Project Guidelines](AGENTS.md)
