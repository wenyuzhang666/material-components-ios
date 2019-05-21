### Dynamic Type

#### Overview
Typography library provides APIs that allow users to support Dynamic Type feature in Material Components. For those components with Dynamic Type feature supported, text size changes based on the Dynamic Type setting provided by the user.

To support Dynamic Type in your component, you need to set up text styles represented by `MDCFontTextStyle` on text, such as `MDCFontTextStyleBody1` or `MDCFontTextStyleTitle`. These text styles describe how text size should be adjusted when Dynamic Type setting changes.

#### Configure Text Styles

Users configure text styles in source code. First, you call the `scalerForMaterialTextStyle:` method. This method returns an `MDCFontScalar` object for a given `MDCFontTextStyle`. Next, use the `MDCFontScalar` object to scale a `UIFont` by calling `scaledFontWithFont:` method. This method scales the font based on Dynamic Type setting provided by the user. This method also supports both system fonts and custom fonts.

##### Objective-C

```objc
UIFont *customFont = [UIFont fontWithName:@"CustomFontName" size:18.0];
MDCFontScaler *fontScaler = [MDCFontScaler scalerForMaterialTextStyle:MDCTextStyleBody1];
UIFont *customScalableFont = [fontScaler scaledFontWithFont:customFont];
label.font = customScalingFont;
```

```swift
let customFont = UIFont(name: "CustomFontName", size: 18.0)!
let fontScaler = MDCFontScaler(forMaterialTextStyle:.body1);
let customScalableFont = fontScaler.scaledFont(with:customFont);
label.font = customScalingFont;
```

The text control doesn't adjust the font size automatically when the user adjust Dynamic Type setting. To detech such adjustments, you can listen to `UIContentSizeCategoryDidChangeNotification` and update the font by calling `mdc_scaledFontForCurrentSizeCategory` method when the notification arrives.


#### Configure Dynamic Type in Material Components

In your source code, set `mdc_adjustsFontForContentSizeCategory` to `YES` on components that have Dynamic Type support. When the user makes Dynamic Type changes in Settings, components will respond automatically.