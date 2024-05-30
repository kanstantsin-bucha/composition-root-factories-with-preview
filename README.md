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

Composition root:
* it created to manage all your dependencies in one place
    mean you can do manage flavors of the app efficiently
* having big picture in composition root allows developers to understand the app faster
    mean you always see ALL dependencies of a particular view
* you always can split the app into several independent packages without hustle 
    mean you just 
    1) group views, factories and dependencies inside of the composition root, 
    2) gracefully copy-paste them into a separate package. 
    3) import the package and create and instance as a dependency in the composition root
    4) use it as you do before in the app
* you can replace a composition root for the previews
    means effectively have a developer preview for any view. no matter 
    1) how many dependencies it has
    2) how deep in the hierarchy it is displayed

About views and factories:

* View init will be called again only:
    *   if initialization parameters changed.
    *   scene instance reloads the whole tree
* Each view that uses a Factory to produce child views should own that factory.
means you either create views inside of initializer or store the factory itself as a local property

About navigation:

* navigation model allows you to separate navigation logic of different parts of the app
each context can has own navigation model.
* navigation model should be provided from the Composition Root using Factory initializer
you should avoid pass navigation model as parameter that one view passes into another view.  

# Why do we heed a ClientPackage?

The purpose of moving the app code to the package is:
* reduce number of conflicts during development
* eliminate conflicts in Xcode project file
* automatically sorting files by name in the project tree
* collect all third party dependencies in one place and separate them by target 

(see full implementation in https://github.com/kanstantsin-bucha/apple-ci-github-fastlane)

