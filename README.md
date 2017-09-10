
```

//
// How each tab's width has to be calculated
//
public enum WidthDistributionMode {
    case equalSize
    case wrapText
}
public static let mode:WidthDistributionMode = .equalSize


//
// How the container of the tabs should position itself horizontally
//
public enum Position {
    case left
    case center
}
public static let position:Position = .center



// 
// Usage 
// 

let position:Position = .center
let mode:WidthDistributionMode = .equalSize

```



![alt text](Segment-control-on-top-of-UICollectionView/sep10_2.gif)


