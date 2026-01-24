---
name: XCUIAutomation
description: How to test iOS apps using XCUIAutomation.
version: 1.0.0
---

# SKILL: XCUIAutomation — Critical iOS Workflow Testing

## Summary

This skill is an expert in **XCUIAutomation (XCUITest)** for iOS applications, with a strict focus on **validating critical user workflows**.

It prioritizes:

- Deterministic UI automation
- Accessibility-driven querying
- End-to-end workflow validation
- Maintainable, low-flakiness tests

It explicitly **rejects snapshot, screenshot, or visual-diff testing**.

---

## Scope & Non-Goals

### In Scope

- XCUIAutomation / XCUITest
- XCUIApplication lifecycle control
- XCUIElementQuery querying strategies
- XCUIElement interaction & assertions
- Testing real user flows (login, onboarding, CRUD, navigation)

### Out of Scope

- Screenshot testing
- Snapshot testing
- Pixel comparison
- Visual diffing
- Internal UIKit / SwiftUI state inspection

All validation must be done via **observable UI behavior**.

---

## Core Philosophy

1. Test workflows, not views
2. Assert behavior, not appearance
3. Query by accessibility, never layout
4. Fail fast, fail clearly
5. Flakiness is a design bug

---

## Mental Model

XCUIAutomation tests the app **out-of-process**, through the accessibility layer.

You are not:

- Calling UIKit
- Touching SwiftUI
- Inspecting internal state

You are:

- Acting as a real user
- Discovering elements via accessibility
- Interacting via taps, typing, gestures
- Verifying externally observable results

---

## Core Types & Responsibilities

### XCUIApplication

Represents the application under test.

Responsibilities:

- Launching and terminating the app
- Acting as the root element query
- Managing launch arguments and environment

Example:

```swift
let app = XCUIApplication()
app.launch()
```

Best Practices:

- Launch once per test unless isolation requires otherwise
- Use launch arguments to control app state
- Never assume initial UI state without asserting it

---

### XCUIElementQuery

Used to locate UI elements.

Principles:

- Prefer accessibility identifiers
- Avoid positional queries
- Use predicates for dynamic content
- Always narrow queries intentionally

Good:

```swift
app.buttons["loginButton"]
```

Acceptable:

```swift
app.cells.containing(.staticText, identifier: "Task").firstMatch
```

Avoid:

```swift
app.otherElements.element(boundBy: 3)
```

---

### XCUIElement

Represents a concrete UI element.

Primary Capabilities:

- Interaction (tap, typeText, swipe)
- State validation (exists, isHittable, value)
- Synchronization (waitForExistence)

Golden Rule:
Never interact with an element before asserting it exists.

Example:

```swift
let submit = app.buttons["Submit"]
XCTAssertTrue(submit.waitForExistence(timeout: 5))
submit.tap()
```

---

## Test Structure Pattern

All tests should follow this structure:

1. Arrange – launch app and assert starting state
2. Act – perform user interactions
3. Assert – verify resulting UI state
4. Isolate – leave no shared state behind

Example:

```swift
func testUserCanLogIn() {
    let app = XCUIApplication()
    app.launch()

    let username = app.textFields["username"]
    XCTAssertTrue(username.waitForExistence(timeout: 5))
    username.tap()
    username.typeText("testuser")

    let password = app.secureTextFields["password"]
    password.tap()
    password.typeText("password")

    app.buttons["login"].tap()

    XCTAssertTrue(app.staticTexts["Welcome"].waitForExistence(timeout: 5))
}
```

---

## Assertions: What Is Valid

Valid Assertions:

- Element existence
- Element hittability
- Navigation completion
- Text values
- Enabled / disabled state
- Alerts appearing
- Screen transitions

Invalid Assertions:

- Screenshot comparisons
- Pixel alignment
- Font size
- Color checks
- Layout spacing

If a user cannot perceive it functionally, it should not be asserted.

---

## Synchronization Rules

Required:

- waitForExistence(timeout:) for async UI
- Assertions before interactions

Forbidden:

- sleep()
- Arbitrary delays
- Timing-based assumptions

---

## Accessibility Requirements

This skill assumes:

- Every critical interactive element has a stable accessibility identifier
- Identifiers are semantic, not visual

Bad:
button1

Good:
addTaskButton

If an element is hard to test, fix accessibility, not the test.

---

## Navigation & Gestures

Supported interactions:

- tap()
- typeText(\_:)
- swipeUp() / swipeDown()
- press(forDuration:)

Avoid gesture-heavy flows unless they are core to the app experience.

---

## Handling Flakiness

Flakiness is addressed by:

- Strong queries
- Explicit waits
- Clear state assertions
- Test isolation

Never fix flakiness by:

- Increasing timeouts blindly
- Adding sleeps
- Retrying without understanding failure

---

## Performance Tests

Performance tests:

- Should not use @MainActor
- Must avoid artificial serialization
- Measure real user-visible behavior only

Example:

```swift
measure(metrics: [XCTApplicationLaunchMetric()]) {
    XCUIApplication().launch()
}
```

---

## Actor & Concurrency Rules

- UI tests do not require @MainActor
- XCUIAutomation is already serialized and synchronized
- Use @MainActor only in unit tests touching app code directly

---

## Example Workflows to Automate

- App launch & first render
- Authentication (login / logout)
- Onboarding completion
- Creating, editing, deleting data
- Tab & navigation flows
- Error handling & validation states

Each workflow must:

- Start from a known state
- End with a clear assertion
- Be readable without comments

---

## Final Rule

If a test does not prove that a user can complete a critical task, it does not belong in the UI test suite.
