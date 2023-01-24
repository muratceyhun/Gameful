# Gameful iOS Application
---
This repository contains the iOS Application of Gameful.

Gameful is an app that includes games from all platforms. 
You can sort the game list by rating, popularity, release date and so on...
You can search any game you are interested in and also put them in your favorite list.
Additionally, you can take a note about the game if you want.


<img width="386" alt="Screenshot 2023-01-25 at 00 15 43" src="https://user-images.githubusercontent.com/95974560/214426216-82b66cb0-ee1d-4d42-9f41-97c5ab47bf7c.png">

## Developer

 - Murat Ceyhun Körpeoğlu <muratceyhunkorpeoglu@gmail.com>

##  Index 
- [Installing & Preparing the Environment](#installing--preparing-the-environment)
- [Definition of Done](#definition-of-done)
- [Development Guidelines](#development-guidelines)
  - [General](#general)
  - [Naming](#naming)
    - [Types (Classes/Protocols/Structs)](#types-classesprotocolsstructs)
    - [Variables / Methods](#variables--methods)
    - [IBOutlets & Accessibility Identifiers](#iboutlets--accessibility-identifiers)
  - [Naming Assets](#naming-assets)
    - [.xcassets](#xcassets)
    - [Colors](#colors)
    - [Strings](#strings)
    - [Fonts](#fonts)
    - [Dimensions](#dimensions)
  - [Git](#git)
  - [Must Reads](#must-reads)
  
### Installing & Preparing the Environment
⚠️ Pod file includes Alamofire, SDWebImage, PanModel and SVProgressHUD.
1. Please install podfile first.

2. You're good to go. Open *Gameful.xcworkspace*.


## Development Guidelines

### General

To ensure clarity and to make it easier to find stuff, please make sure to follow these general guidelines:

- **Project files and folders should be aligned with the file system.**
- **Underlying assets inside an `.xcassets` should match the file system.**
- **Unused or commented code blocks should never be comitted to version control unless it's there temporarily.**
- **Pay attention to weakify view controllers or other objects used inside an escaping block**

### Naming

We follow naming conventions from the Swift API Design Guidelines.

#### Types (Classes/Protocols/Structs)

**UpperCamelCase** and **should NOT** start with any prefix.

```swift

final class HomeViewController: UIViewController {}

```

#### Variables / Methods

All local and **static** variables, properties, and methods should be **lowerCamelCase**

```swift
class BaseCollectionViewCell: UICollectionViewCell {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
```

#### IBOutlets & Accessibility Identifiers

Outlets should be named as follows: `{name}{viewType}` ex: `posterImageView`

```swift
class ViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}
```

**Not**

```
delete.png
menu.png
selected.png
```

#### Strings

Localized strings defined in `Localizable.strings` can be accessed through the generated Strings constants as below.

`Localizable.strings`:
```
"welcome.message" = "Welcome";
"title" = "This is a title";
"welcome.withName" = "Welcome %d ;
"copy.progress" = "You complete %d of %d.";
```

#### Dimensions

Dimensions can range from spacing, margins, paddings, to font sizes and other constants.

We prefer to define them as static constants in the place (class) they belong to.

Example: 

```swift
final class SquareIconView: BaseView {
    
    let size = CGSize(width: 36, height: 36)
    
    override var intrinsicContentSize: CGSize {
        return size
    }
}

```

### Git

We follow a strict Conventional Commits to help us keep track of work over time.

[Conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)

### Must Reads

- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/).
- [Assets Naming](https://github.com/dkhamsing/ios-asset-names/blob/master/README.md#naming)
