# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- New `NibLoadable` protocol for loading `UIView` subclasses from XIB files both from code and IB files.
- New `RoundableView` IBDesignable with `cornerRadius` defined for use right within Interface Builder files.
- New `TemplateButton` IBDesignable with `image` always rendered as `.alwaysTemplate` for use right within IB files.
- New `TemplateImageView` IBDesignable with `image` always rendered as `.alwaysTemplate` for use right within IB files.
- New `visibleViewController` properties on `UIWindow` to get the currently presented view controller globally.
### Changed
- The `bindEdgesToSuperview` method now supports an optional `insets` parameter of type `UIEdgeInsets`
### Deprecated
- None.
### Removed
- None.
### Fixed
- None.
### Security
- None.


## [1.8.0] - 2018-10-31
### Added
- UITableViewExtension to dequeue cells, headers & footers with static typing.
  via [#10](https://github.com/Flinesoft/HandyUIKit/pull/10) by [Murat Yilmaz](https://github.com/roccx)
### Changed
- Updated code to Swift 4.2 & Xcode 10.
### Deprecated
- None.
### Removed
- None.
### Fixed
- Fixed an issue where the `Info.plist` file could not be found when executing tests.
  via [#9](https://github.com/Flinesoft/HandyUIKit/pull/9) by [Andreas Link](https://github.com/LinkAndreas)
- Fixes an issue in `toGrayscale()` method – did not consider image's `scale`.
  via [#8](https://github.com/Flinesoft/HandyUIKit/pull/8) by [Andreas Link](https://github.com/LinkAndreas)
### Security
- None.
