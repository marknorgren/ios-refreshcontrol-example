# Refresh Control Example


## Large Title Issue Examples

Tabs showing examples with RefreshControl and Large Title.

When adding a `UICollectionView` as a subview that is contained in a `UINavigationController` that uses Large Titles 
the Refresh Control does not behave as expectd.


1. CollectionView (showing issue)
   
   This shows this the issue with the refresh control.
   It's state is 'refreshing' almost immediately after dragging just a few pixels.
   
2. CollectionVC

    This is a working example. The RefreshControl works as expected when the `UINavigationController`'s root view controller is a `UICollectionViewController`.
    
3. Workaround

    The workaround resolves the issue.
    
    To make the RefreshControl behave as expected a new instance is added to
    the CollectionView on `viewDidAppear`

<img src="docs/examples.gif" width=400 />

</br>

## Basic Examples

<img src="https://user-images.githubusercontent.com/205066/110666876-50276e80-818f-11eb-99c0-943442c5509a.gif" width=400 />
