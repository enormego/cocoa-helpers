//
//  UIBezierPath.h
//  Private UIKit Class
//

#import <UIKit/UIKit.h>

typedef enum {
    kUIBezierPathTopLeftCorner = 1,
    kUIBezierPathTopRightCorner = 1 << 1,
    kUIBezierPathBottomLeftCorner = 1 << 2,
    kUIBezierPathBottomRightCorner = 1 << 3,
    kUIBezierPathAllCorners = (kUIBezierPathTopLeftCorner | kUIBezierPathTopRightCorner | kUIBezierPathBottomLeftCorner | kUIBezierPathBottomRightCorner)
} UIBezierPathCorners;

@interface UIBezierPath : NSObject {
    void* _pathRef;
    float _width;
}

+ (UIBezierPath*)bezierPath;
+ (UIBezierPath*)bezierPathKnockingOutTopOfRect:(CGRect)fp8 withCornerRadius:(float)fp24;
+ (UIBezierPath*)bezierPathKnockingOutBottomOfRect:(CGRect)fp8 withCornerRadius:(float)fp24;
+ (UIBezierPath*)roundedRectBezierPath:(CGRect)fp8 withRoundedEdges:(int)fp24;
+ (UIBezierPath*)roundedRectBezierPath:(CGRect)fp8 withRoundedCorners:(UIBezierPathCorners)fp24 withCornerRadius:(float)fp28;
+ (UIBezierPath*)roundedRectBezierPath:(CGRect)fp8 withRoundedCorners:(UIBezierPathCorners)fp24 withCornerRadii:(id)fp28;
+ (UIBezierPath*)roundedRectBezierPath:(CGRect)fp8 withRoundedCorners:(UIBezierPathCorners)fp24 visibleEdges:(int)fp28 cornerRadius:(float)fp32;
- (id)init;
- (void)dealloc;
- (void)moveToPoint:(CGPoint)fp8;
- (void)lineToPoint:(CGPoint)fp8;
- (void)appendBezierPath:(id)fp8;
- (void)appendBezierPathWithRect:(CGRect)fp8;
- (void)appendBezierPathWithOvalInRect:(CGRect)fp8;
- (void)appendBezierPathWithOvalInRect:(CGRect)fp8 transform:(CGAffineTransform)fp24;
- (void)closePath;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)fp8 radius:(float)fp16 startAngle:(float)fp20 endAngle:(float)fp24 clockwise:(BOOL)fp28;
- (void)setLineWidth:(float)fp8;
- (void)fill;
- (void)stroke;
- (void)clip;

@end
