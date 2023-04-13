<img src="Assets/Header.png" width="400" alt="SwipeActions">

Add customizable swipe actions to any view.

- Enable swipe actions on any view, not just Lists.
- Customize literally everything — corner radius, color, etc...
- Supports drag-to-delete and advanced gesture handling.
- Fine-tune animations and styling to your taste.
- Programmatically show/hide swipe actions.
- Made with 100% SwiftUI. Supports iOS 14+.
- Lightweight, no dependencies. One file.


![General](Assets/General.png) | ![Basics](Assets/Basics.png) | ![Customization](Assets/Customization.png)
| --- | --- | --- |
![Styles](Assets/Styles.png) | ![Animations](Assets/Animations.png) | ![Advanced](Assets/Advanced.png)



### Installation

SwipeActions is available via the [Swift Package Manager](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app). Alternatively, because all of SwipeActions is contained within a single file, drag [`SwipeActions.swift`](https://github.com/aheze/SwipeActions/blob/main/Sources/SwipeActions.swift) into your project. Requires iOS 14+.

```
https://github.com/aheze/SwipeActions
```

### Usage

```swift
import SwiftUI
import SwipeActions

struct ContentView: View {
    var body: some View {
        SwipeView {
            Text("Hello")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(32)
        } leadingActions: { _ in
        } trailingActions: { _ in
            SwipeAction("World") {
                print("Tapped!")
            }
        }
        .padding()
    }
}
```

<img src="Assets/Result.png" width="300" alt="The result, 'World' displayed on the right.">


### Examples

Check out the [example app](https://github.com/aheze/SwipeActions/archive/refs/heads/main.zip) for all examples!

![2 screenshots of the example app](Assets/ExampleApp.png)

### Customization

SwipeActions supports over 20 modifiers for customization.

```swift
// MARK: - For `SwipeAction` (the side views)

/**  
  For leading actions:
  Apply this to the leftmost edge action to enable drag-to-trigger.
  You must also call `swipeToTriggerLeadingEdge(true)` on the `SwipeView`.

  For trailing actions:
  Apply this to the rightmost edge action to enable drag-to-trigger.
  You must also call `swipeToTriggerTrailingEdge(true)` on the `SwipeView`.
*/
func swipeActionEdgeStyling() 

/// Constrain the action's content size (helpful for text).
func swipeActionLabelFixedSize(_ value: Bool = true) 

/// Additional horizontal padding.
func swipeActionLabelHorizontalPadding(_ value: Double = 16)

/// The opacity of the swipe actions, determined by `actionsVisibleStartPoint` and `actionsVisibleEndPoint`.
func swipeActionChangeLabelVisibilityOnly(_ value: Bool) 
```

```swift
// MARK: - For `SwipeView` (the main view)

/// Enable triggering the leading edge via a drag.
/// You must also call `swipeActionEdgeStyling()` on the leftmost edge `SwipeAction`.
func swipeToTriggerLeadingEdge(_ value: Bool) 

/// Enable triggering the trailing edge via a drag.
/// You must also call `swipeActionEdgeStyling()` on the rightmost edge `SwipeAction`.
func swipeToTriggerTrailingEdge(_ value: Bool) 

/// The minimum distance needed to drag to start the gesture. Should be more than 0 for best compatibility with other gestures/buttons.
func swipeMinimumDistance(_ value: Double) 

/// The style to use (`mask`, `equalWidths`, or `cascade`).
func swipeActionsStyle(_ value: SwipeActionStyle) 

/// The corner radius that encompasses all actions.
func swipeActionsMaskCornerRadius(_ value: Double) 

/// At what point the actions start becoming visible.
func swipeActionsVisibleStartPoint(_ value: Double) 

/// At what point the actions become fully visible.
func swipeActionsVisibleEndPoint(_ value: Double)

/// The corner radius for each action.
func swipeActionCornerRadius(_ value: Double) 

/// The width for each action.
func swipeActionWidth(_ value: Double) 

/// Spacing between actions and the label view.
func swipeSpacing(_ value: Double) 

/// The point where the user must drag to expand actions.
func swipeReadyToExpandPadding(_ value: Double) 

/// The point where the user must drag to enter the `triggering` state.
func swipeReadyToTriggerPadding(_ value: Double) 

/// Ensure that the user must drag a significant amount to trigger the edge action, even if the actions' total width is small.
func swipeMinimumPointToTrigger(_ value: Double) 

/// Applies if `swipeToTriggerLeadingEdge/swipeToTriggerTrailingEdge` is true.
func swipeEnableTriggerHaptics(_ value: Bool) 

/// Applies if `swipeToTriggerLeadingEdge/swipeToTriggerTrailingEdge` is false, or when there's no actions on one side.
func swipeStretchRubberBandingPower(_ value: Double)

/// If true, you can change from the leading to the trailing actions in one single swipe.
func swipeAllowSingleSwipeAcross(_ value: Bool) 

/// The animation used for adjusting the content's view when it's triggered.
func swipeActionContentTriggerAnimation(_ value: Animation)

/// Values for controlling the close animation.
func swipeOffsetCloseAnimation(stiffness: Double, damping: Double)

/// Values for controlling the expand animation.
func swipeOffsetExpandAnimation(stiffness: Double, damping: Double)

/// Values for controlling the trigger animation.
func swipeOffsetTriggerAnimation(stiffness: Double, damping: Double)
```

### Community

Author | Contributing | Need Help?
--- | --- | ---
SwipeActions is made by [aheze](https://github.com/aheze). | All contributions are welcome. Just [fork](https://github.com/aheze/SwipeActions/fork) the repo, then make a pull request. | Open an [issue](https://github.com/aheze/SwipeActions/issues) or join the [Discord server](https://discord.com/invite/Pmq8fYcus2). You can also ping me on [Twitter](https://twitter.com/aheze0).

### License

```
MIT License

Copyright (c) 2023 A. Zheng

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

https://user-images.githubusercontent.com/49819455/231671743-baca394e-fc74-4062-83eb-2024b8add924.mp4

