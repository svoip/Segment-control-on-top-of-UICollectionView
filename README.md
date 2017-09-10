# Segment-control-on-top-of-UICollectionView
Super simple implementation of segment control with the use of UICollectionView


![alt text](Segment-control-on-top-of-UICollectionView/sep10_2.gif)


```

...
public enum WidthDistributionMode {
case equalSize
case wrapText
}
public enum Position {
case left
case center
}
...

public static let position:Position = .center
public static let mode:WidthDistributionMode = .equalSize

```
