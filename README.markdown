# About Cocoa Helpers
Cocoa Helpers are a collection of categories we've written to the Apple UIKit/Cocoa classes to make them more useful.

# Helpers
## NSArray
* **empty** property - Checks to see if the array is empty

## NSDictionary
* **containsObjectForKey:** - Checks to see if the dictionary contains the given key
* **empty** property - Checks to see if the dictionary is empty

## NSString
* **containsString:** - Checks to see if the string contains the given string, case insenstive
* **containsString:options:** - Checks to see if the string contains the given string while allowing you to define the compare options
* **md5** - Returns the MD5 value of the string

## NSURL
* **baseString** - Returns a string of the base of the URL, will contain a trailing slash

## UIAlertView
* **UIAlertViewQuick(NSString* title, NSString* message, NSString* dismissButtonTitle)** - Convenience method to throw a quick alert to the user

## UIColor
* **UIColorMakeRGB(nRed,nGreen,nBlue)** - Convenience method to return a UIColor with RGB values based on 255

## UIDevice
* **availableMemory** property - Available device memory in MB

## UIImage
* **imageWithContentsOfURL:** - Creates an image from the contents of a URL
* **scaleToSize:** - Scales the image to the given size
* **scaleAndCropToSize:** - Scales and crops the image to the given size
* **scaleHeightAndCropWidthToSize:** - Scales the height and crops the width to the size
* **scaleWidthAndCropHeightToSize:** - Scales the width and crops the height to the size
* **scaleToSize:withOffset:** - Scales image to the size, crops to the offset

# Documentation
There's additional documentation and examples provided in each header file

# Questions
Feel free to contact info@enormego.com if you need any help with any of these methods or wish to contribute to Cocoa Helpers.

