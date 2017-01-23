# Setting CALayer speed < 1 drops frames in animation

Sample project for [rdar://30143339](https://openradar.appspot.com/radar?id=4942901515649024)

## Summary:
If a CALayer has a speed set to a value lower than 1, frames are dropped when it animates (unless iOS is displaying a double height status bar)

## Steps to Reproduce:
1. Ensure your iOS device is not in a mode where it would display a double height status bar
2. Create a UIView
3. Set its layer’s speed to 0.1
4. Add the view to the view hierarchy
5. Animate the view’s position

## Expected Results:
The view animates smoothly from one position to another 10 times slower than the duration set on the animation

## Actual Results:
The view animates to the new position but 90% of the frames are dropped

## Regression:
Reproduced on iPhone 6S running iOS 10.2, 5S running 10.2, and 5S running 10.0.2
Tested on iPad mini running iOS 9.3.5 and the issue does not reproduce there

## Notes:
- If you put the iOS device in a mode where it has a double height status bar (start GPS directions or a phone call for example) then the animation runs smoothly (and this is the case whether the app is currently displaying the status bar or not)
- This behaviour also effects transition if you set the completionSpeed on UIPercentDrivenInteractiveTransition which I presume is in turn setting the CALayer speed
