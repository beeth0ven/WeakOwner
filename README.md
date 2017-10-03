# WeakOwner

[![Build Status](https://travis-ci.org/beeth0ven/WeakOwner.svg?branch=master)](https://travis-ci.org/beeth0ven/WeakOwner)
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![CocoaPods](http://img.shields.io/cocoapods/v/WeakOwner.svg)](https://cocoapods.org/pods/WeakOwner)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A better way to deal function with weak reference.

## At a Glance

- **Function without return value:**

  ```swift
  button.rx.tap
      .subscribe(onNext: weak(self) { me in me.showAlert() })
      ...
  ```

  is equivalent to:

  ```swift
  button.rx.tap
      .subscribe(onNext: { [weak self] in
          guard let me = self else { return }
          me.showAlert()
      })
      ...
  ```

- **Function with return value:**

  ```swift
  let searchResults = rxText
      .flatMapLatest(weak(self, default: .empty()) { me, text in
          me.searchGitHub(text)
      })
  ```

  is equivalent to:

  ```swift
  let searchResults = rxText
      .flatMapLatest { [weak self] text -> Observable<[Repository]> in
          guard let me = self else { return .empty() }
          return me.searchGitHub(text)
  }
  ```

## Installation

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'WeakOwner'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "beeth0ven/WeakOwner"
    ```


## License

**WeakOwner** is under MIT license. See the [LICENSE](LICENSE) file for more info.
