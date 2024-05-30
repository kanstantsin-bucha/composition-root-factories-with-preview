# composition-root-factories-with-preview (CRF+P)

## CRF+P is Architecture for the SwiftUI based apps that improves the developer performance greatly

Positive aspects:

* Get flexibility of moving Views around your app in any direction
* Get silver bullet solution that works for all kinds of navigation
* Inject all your dependencies in one place
* Get an intuitive composition style workflow
* Get instant preview of any view
* Prevent you previews code from leaking into production app builds
* Reduce merge conflicts by using a Root Package and Swift Package Manager

Negative aspects:

* It is hard to create acceptance tests for this architecture.
* It is hard to follow for Junior Developers.

What you should remember?

* View init will be called again only:
    *   if initialization parameters changed.
    *   scene instance reloads the whole tree
* Each view that uses a Factory to produce child views should own that factory.
means you either create views inside of initializer or store the factory itself as a local property

# Why do we heed a ClientPackage?

The purpose of moving the app code to the package is:
* reduce number of conflicts during development
* eliminate conflicts in Xcode project file
* automatically sorting files by name in the project tree
* collect all third party dependencies in one place and separate them by target 

(see full implementation in https://github.com/kanstantsin-bucha/apple-ci-github-fastlane)

